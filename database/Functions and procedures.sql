####################################################################################
#                        MySQL stored functions                                    #
####################################################################################

# Esta funcion obtiene el precio de un producto en una sucursal en un dia definido.
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

# Esta funcion obtiene el descuento de un producto en una sucursal en un dia definido.
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

# Esta funcion obtiene el precio real (aplicando descuento si existe) de un producto.
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

# Esta función obtiene la suma de los valores de los productos de un carrito.
DELIMITER $$
  CREATE FUNCTION getCartTotal(cart_id INT) RETURNS FLOAT(7,2)
  DETERMINISTIC
  BEGIN
    DECLARE total FLOAT(7,2);
    SET total = 0;

    SELECT sum((getValue(p.id, 1, NOW()) * cp.quantity))
    INTO total
    FROM products p, carts c, cart_product cp
    WHERE c.id = cart_id and cp.cart_id = c.id and p.id = cp.product_id;

    RETURN (total);
  END
  $$
DELIMITER ;

####################################################################################
#                        MySQL stored procedures                                   #
####################################################################################

# Este stored procedure obtiene todas las ventas de una sucursal definida
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