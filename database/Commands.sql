/*
* Stores procedures
*/

-- Obtiene todas las ventas cmpletadas de una sucursal, recibe el id de la sucursal como parámetro
DELIMITER $$
CREATE PROCEDURE getCompletedRequisitions(IN branch_id INT)
  BEGIN
    SELECT r.id, getCartTotal(r.cart_id) as total, b.name as branch, s.name as status, rs.created_at as completed, c.name as client, pt.name as payment_type, d.name as delivery, r.created_at
    FROM requisitions r, statuses s, requisition_status rs, clients c, payment_types pt, deliveries d, branches b, tills t
    WHERE s.id = rs.status_id and r.id = rs.requisition_id and s.name = "Entregado" and t.branch_id = b.id
          and c.id = r.client_id and pt.id = r.payment_type_id and d.id = r.delivery_id and r.till_id = t.id
          and t.id IN(
            SELECT t.id
            FROM tills t
            WHERE t.branch_id = branch_id)
    ORDER BY rs.created_at;
  END$$
DELIMITER ;

-- Obtiene la lista de categorias, con su id, nombre, departamento, subdepartamento y cantidad de productos.
DELIMITER $$
CREATE PROCEDURE getCategories()
  BEGIN
    SELECT c.id, d.name as department, sd.name as subdepartment, c.name as name, count(p.id) as products
    FROM departments d, subdepartments sd, categories c, products p
    WHERE c.subdepartment_id = sd.id and sd.department_id = d.id and p.category_id = c.id
    GROUP BY c.id
    ORDER BY d.name;
  END$$
DELIMITER ;

/*
* Stores functions
*/

-- Obtiene el precio de un producto en una sucursal en un día y hora específicos.
DELIMITER $$
  CREATE FUNCTION getPrice(product_id INT, branch_id INT, date DATETIME) RETURNS FLOAT(7,2)
  DETERMINISTIC
  BEGIN
    DECLARE price FLOAT(7,2);
    SET price = 0;

    SELECT if (p.price = NULL, 0.0, p.price)
    INTO price
    FROM branch_price_product bpp, prices p
    WHERE bpp.branch_id = branch_id and bpp.product_id = product_id and bpp.price_id = p.id and date >= p.created_at
    GROUP BY bpp.price_id
    ORDER BY p.created_at desc
    limit 1;

    RETURN (price);
  END
  $$
DELIMITER ;

-- Obtiene el descuento de un producto en una sucursal en un día y hora específicos.
DELIMITER $$
  CREATE FUNCTION getDiscount(product_id INT, branch_id INT, date DATETIME) RETURNS FLOAT(7,2)
  DETERMINISTIC
  BEGIN
    DECLARE discount FLOAT(7,2);
    SET discount = 0;

    SELECT if(d.price = NULL, 0.0, d.price)
    INTO discount
    FROM branch_discount_product bdp, discounts d
    WHERE bdp.branch_id = 1 and bdp.product_id = 1 and bdp.discount_id = d.id and NOW() >= d.created_at
    GROUP BY bdp.discount_id
    ORDER BY d.created_at desc
    limit 1;

    RETURN (discount);
  END
  $$
DELIMITER ;

-- Obtiene el precio con descuento (si tiene) de un producto en una sucursal en un día y hora específicos.
DELIMITER $$
  CREATE FUNCTION getValue(product_id INT, branch_id INT, date DATETIME) RETURNS FLOAT(7,2)
  DETERMINISTIC
  BEGIN
    DECLARE value FLOAT(7,2);
    
    SET value = getPrice(product_id, branch_id, date) - getDiscount(product_id, branch_id, date);

    RETURN (value);
  END
  $$
DELIMITER ;

-- Obtiene el monto total de un carrito.
DELIMITER $$
  CREATE FUNCTION getCartTotal(cart_id INT) RETURNS FLOAT(7,2)
  DETERMINISTIC
  BEGIN
    DECLARE total FLOAT(7,2);
    SET total = 0;

    SELECT SUM((getValue(p.id, 2, NOW()) * cp.quantity))
    INTO total
    FROM products p, carts c, cart_product cp
    WHERE c.id = cart_id and cp.cart_id = c.id and p.id = cp.product_id;

    RETURN (total);
  END
  $$
DELIMITER ;

-- Obtiene el mejor precio que ofrecen los proveedores de un producto en una fecha específica.
DELIMITER $$
  CREATE FUNCTION getPurchaseValue(product_id INT, date DATETIME) RETURNS FLOAT(7,2)
  DETERMINISTIC
  BEGIN
    DECLARE price FLOAT(7,2);
    SET price = 0;

    
    SELECT if (pri.price = NULL, 0.0, pri.price)
    INTO price
    FROM product_provider_price ppp, prices pri, providers pro
    WHERE ppp.product_id = product_id and ppp.provider_id = pro.id and ppp.price_id = pri.id and date >= pri.created_at
    GROUP BY ppp.price_id, ppp.provider_id
    ORDER BY pri.price asc
    limit 1;

    RETURN (price);
  END
  $$
DELIMITER ;

-- Obtiene el id del mejor precio que ofrecen los proveedores de un producto en una fecha específica.
DELIMITER $$
  CREATE FUNCTION getPurchaseValueId(product_id INT, date DATETIME) RETURNS INT
  DETERMINISTIC
  BEGIN
    DECLARE id INT;
    
    SELECT if (pri.id = NULL, 1, pri.id)
    INTO id
    FROM product_provider_price ppp, prices pri, providers pro
    WHERE ppp.product_id = product_id and ppp.provider_id = pro.id and ppp.price_id = pri.id and date >= pri.created_at
    GROUP BY ppp.price_id, ppp.provider_id
    ORDER BY pri.price asc
    limit 1;

    RETURN (id);
  END
  $$
DELIMITER ;

DELIMITER $$
    CREATE FUNCTION getLastHourValue() RETURNS FLOAT(7,2)
    DETERMINISTIC
    BEGIN
        DECLARE total FLOAT(7,2);
        SET total = 0.0;

        SELECT SUM(getCartTotal(r.cart_id))
        INTO total
        FROM requisitions r
        WHERE r.created_at >= (NOW() - INTERVAL 1 HOUR);

        IF total is NULL THEN
          SET total = 0.0;
        END IF;

        RETURN (total);
    END $$
DELIMITER ;

/*
* Triggers
*/

-- Inserta una nueva compra que no modifica el inventario cuando la cantidad de un producto en una sucursal llega a 0
DELIMITER $$
CREATE TRIGGER after_branch_product_update
AFTER UPDATE ON branch_product
FOR EACH ROW
BEGIN
    IF NEW.quantity = 0 THEN
        INSERT INTO purchases
        SET quantity = OLD.restock,
        branch_id = OLD.branch_id,
        price_id = getPurchaseValueId(OLD.product_id, NOW()),
        product_id = OLD.product_id,
        provider_id = 1,
        created_at = NOW();
    END IF;
END $$
DELIMITER ;

/*
* Events
*/

SET GLOBAL event_scheduler = ON;

-- Evento que inserta una nueva fila en la tabla ventas por hora cada hora
DELIMITER $$
CREATE EVENT IF NOT EXISTS hourlyValues
ON SCHEDULE EVERY 1 HOUR
    STARTS '2018-02-18 13:00:00'
DO
    BEGIN
        START TRANSACTION;
        INSERT INTO salesPerHour(total, created_at) VALUES (getLastHourValue(), NOW());
        COMMIT;
    END $$
DELIMITER ;

-- Evento que activa houlyValues cada día a las 04:59
CREATE EVENT IF NOT EXISTS activateHourlyValues
ON SCHEDULE EVERY 1 DAY
    STARTS '2018-02-19 04:55:00'
DO
    ALTER EVENT hourlyValues ENABLE;

-- Evento que desactiva houlyValues cada día a las 23:01
CREATE EVENT IF NOT EXISTS deactivateHourlyValues
ON SCHEDULE EVERY 1 DAY
    STARTS '2018-02-18 23:05:00'
DO
    ALTER EVENT hourlyValues DISABLE;
