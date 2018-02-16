CREATE TABLE positions(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    salary FLOAT(24) NOT NULL,
 
    PRIMARY KEY (id)
);
 
CREATE TABLE locations(
    id INT NOT NULL AUTO_INCREMENT,
    address VARCHAR(511) NOT NULL,
    postal_code INT NOT NULL,
    lat FLOAT(53) NOT NULL,
    lng FLOAT(53) NOT NULL,
 
    PRIMARY KEY (id)
);
 
CREATE TABLE employees(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birth DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    active BIT NOT NULL,
    branch_id INT NOT NULL,
    position_id INT NOT NULL,
 
    PRIMARY KEY (id),
    FOREIGN KEY (position_id) REFERENCES positions (id)
);
 
CREATE TABLE branches(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    schedule VARCHAR(511) NOT NULL,
    balance FLOAT(53) NOT NULL,
    address VARCHAR(511) NOT NULL,
    postal_code INT NOT NULL,
    lat FLOAT(53) NOT NULL,
    lng FLOAT(53) NOT NULL,
    manager_id INT NOT NULL,
 
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES employees (id)
);
 
CREATE TABLE tills(
    id INT NOT NULL AUTO_INCREMENT,
    balance FLOAT(53) NOT NULL,
    branch_id INT NOT NULL,
 
    PRIMARY KEY (id),
    FOREIGN KEY (branch_id) REFERENCES branches (id)
);
 
CREATE TABLE logs(
    id INT NOT NULL AUTO_INCREMENT,
    start DATETIME NOT NULL,
    end DATETIME NOT NULL,
    employee_id INT NOT NULL,
    till_id INT NOT NULL,
 
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees (id),
    FOREIGN KEY (till_id) REFERENCES tills (id)
);
 
CREATE TABLE discounts(
    id INT NOT NULL AUTO_INCREMENT,
    price FLOAT(53) NOT NULL,
    created_at DATETIME NOT NULL,
 
    PRIMARY KEY (id)
);
 
CREATE TABLE prices(
    id INT NOT NULL AUTO_INCREMENT,
    price FLOAT(53) NOT NULL,
    created_at DATETIME NOT NULL,
 
    PRIMARY KEY (id)
);
 
CREATE TABLE companies(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    rfc VARCHAR(15) NOT NULL,
 
    PRIMARY KEY (id)
);
 
CREATE TABLE providers(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    company_id INT NOT NULL,
 
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES companies (id)
);

CREATE TABLE departments(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE subdepartments(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    department_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments (id)
);

CREATE TABLE categories(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    subdepartment_id INT NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY (subdepartment_id) REFERENCES subdepartments(id)
);

CREATE TABLE brands(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY(id)
);

CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT,
    secondary_id INT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(511) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
 
    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brands (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

CREATE TABLE images(
    id INT NOT NULL AUTO_INCREMENT,
    path VARCHAR(255) NOT NULL,
    product_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE specifications(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(511) NOT NULL,
    product_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE branch_product(
    quantity INT NOT NULL,
    restock INT NOT NULL,
    branch_id INT NOT NULL,
    product_id INT NOT NULL,
 
    FOREIGN KEY (branch_id) REFERENCES branches (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    PRIMARY KEY (branch_id, product_id)
);
 
CREATE TABLE branch_discount_product(
    branch_id INT NOT NULL,
    discount_id INT NOT NULL,
    product_id INT NOT NULL,
 
    FOREIGN KEY (branch_id) REFERENCES branches (id),
    FOREIGN KEY (discount_id) REFERENCES discounts (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    PRIMARY KEY (branch_id, discount_id, product_id)
);
 
CREATE TABLE branch_price_product(
    branch_id INT NOT NULL,
    price_id INT NOT NULL,
    product_id INT NOT NULL,
 
    FOREIGN KEY (branch_id) REFERENCES branches (id),
    FOREIGN KEY (price_id) REFERENCES prices (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    PRIMARY KEY (branch_id, price_id, product_id)
);
 
CREATE TABLE product_provider_price(
    price_id INT NOT NULL,
    provider_id INT NOT NULL,
    product_id INT NOT NULL,
 
    FOREIGN KEY (price_id) REFERENCES prices (id),
    FOREIGN KEY (provider_id) REFERENCES providers (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    PRIMARY KEY (price_id, provider_id, product_id)
);
 
CREATE TABLE purchases(
    id INT NOT NULL AUTO_INCREMENT,
    quantity INT NOT NULL,
    branch_id INT NOT NULL,
    price_id INT NOT NULL,
    product_id INT NOT NULL,
    provider_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    done TINYINT(1) NOT NULL DEFAULT 0,
    
 
    FOREIGN KEY (branch_id) REFERENCES branches (id),
    FOREIGN KEY (price_id) REFERENCES prices (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    FOREIGN KEY (provider_id) REFERENCES providers (id),
    PRIMARY KEY (id)
);

CREATE TABLE clients(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birth DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE models(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brands (id)
);

CREATE TABLE motors(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE model_motor(
    model_id INT NOT NULL,
    motor_id INT NOT NULL,

    FOREIGN KEY (model_id) REFERENCES models (id),
    FOREIGN KEY (motor_id) REFERENCES motors (id),
    PRIMARY KEY (model_id, motor_id)
);

CREATE TABLE model_product(
    model_id INT NOT NULL,
    product_id INT NOT NULL,

    FOREIGN KEY (model_id) REFERENCES models (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    PRIMARY KEY (model_id, product_id)
);

CREATE TABLE vehicles(
    id INT NOT NULL AUTO_INCREMENT,
    year INT NOT NULL,
    model_id INT NOT NULL,
    motor_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (model_id) REFERENCES models (id),
    FOREIGN KEY (motor_id) REFERENCES motors (id)
);

CREATE TABLE client_vehicle(
    client_id INT NOT NULL,
    vehicle_id INT NOT NULL,

    FOREIGN KEY (client_id) REFERENCES clients (id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (id)
);

CREATE TABLE client_location(
    client_id INT NOT NULL,
    location_id INT NOT NULL,
 
    FOREIGN KEY (client_id) REFERENCES clients (id),
    FOREIGN KEY (location_id) REFERENCES locations (id),
    PRIMARY KEY (client_id, location_id)
);
 
CREATE TABLE carts(
    id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,

    FOREIGN KEY (client_id) REFERENCES clients (id),
    PRIMARY KEY (id)
);
 
CREATE TABLE cart_product(
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
 
    FOREIGN KEY (cart_id) REFERENCES carts (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    PRIMARY KEY (cart_id, product_id)
);

CREATE TABLE payment_types(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE deliveries(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE statuses(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE requisitions(
    id INT NOT NULL AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    cart_id INT NOT NULL,
    client_id INT NOT NULL,
    delivery_id INT NOT NULL,
    payment_type_id INT NOT NULL,
    till_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (cart_id) REFERENCES carts (id),
    FOREIGN KEY (client_id) REFERENCES clients (id),
    FOREIGN KEY (delivery_id) REFERENCES deliveries (id),
    FOREIGN KEY (payment_type_id) REFERENCES payment_types (id),
    FOREIGN KEY (till_id) REFERENCES tills (id)
);

CREATE TABLE requisition_status(
    created_at DATETIME NOT NULL,
    requisition_id INT NOT NULL,
    status_id INT NOT NULL,

    FOREIGN KEY (requisition_id)  REFERENCES requisitions (id),
    FOREIGN KEY (status_id) REFERENCES statuses (id),
    PRIMARY KEY (requisition_id, status_id)
);

CREATE TABLE salesPerHour(
    id INT NOT NULL AUTO_INCREMENT,
    total FLOAT(7,2) NOT NULL,
    created_at DATETIME NOT NULL,

    PRIMARY KEY(id)
);

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

DELIMITER $$
  CREATE FUNCTION getCartTotal(cart_id INT) RETURNS FLOAT(7,2)
  DETERMINISTIC
  BEGIN
    DECLARE total FLOAT(7,2);
    SET total = 0;

    SELECT sum((getValue(p.id, 2, NOW()) * cp.quantity))
    INTO total
    FROM products p, carts c, cart_product cp
    WHERE c.id = cart_id and cp.cart_id = c.id and p.id = cp.product_id;

    RETURN (total);
  END
  $$
DELIMITER ;

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
  CREATE FUNCTION getPurchaseCartTotal(cart_id INT) RETURNS FLOAT(7,2)
  DETERMINISTIC
  BEGIN
    DECLARE total FLOAT(7,2);
    SET total = 0;

    SELECT sum((getPurchaseValue(p.id, 2, NOW()) * cp.quantity))
    INTO total
    FROM products p, carts c, cart_product cp
    WHERE c.id = cart_id and cp.cart_id = c.id and p.id = cp.product_id;

    RETURN (total);
  END
  $$
DELIMITER ;

DELIMITER $$
    CREATE FUNCTION getLastHourValue() RETURNS FLOAT(7,2)
    DETERMINISTIC
    BEGIN
        DECLARE total FLOAT(7,2);
        SET total = 0;

        SELECT SUM(getCartTotal(r.cart_id))
        INTO total
        FROM requisitions r
        WHERE r.created_at >= (NOW() - INTERVAL 1 HOUR);

        RETURN (total);
    END $$
DELIMITER ;

SET GLOBAL event_scheduler = ON;

CREATE EVENT IF NOT EXISTS hourlyValues
ON SCHEDULE EVERY 1 HOUR
DO
    INSERT INTO salesPerHour(total, created_at)
    VALUES(getLastHourValue(), NOW());


CREATE EVENT IF NOT EXISTS activateHourlyValues
ON SCHEDULE 
    EVERY 1 DAY
    STARTS '2018-02-14 05:00:00'
DO
    ALTER EVENT hourlyValues
        ENABLE;

CREATE EVENT IF NOT EXISTS deactivateHourlyValues
ON SCHEDULE 
    EVERY 1 DAY
    STARTS '2018-02-15 23:00:00'
DO
    ALTER EVENT hourlyValues
        DISABLE;

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
DELIMITER ;CREATE TABLE positions(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    salary FLOAT(24) NOT NULL,
 
    PRIMARY KEY (id)
);
 
CREATE TABLE locations(
    id INT NOT NULL AUTO_INCREMENT,
    address VARCHAR(511) NOT NULL,
    postal_code INT NOT NULL,
    lat FLOAT(53) NOT NULL,
    lng FLOAT(53) NOT NULL,
 
    PRIMARY KEY (id)
);
 
CREATE TABLE employees(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birth DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    active BIT NOT NULL,
    branch_id INT NOT NULL,
    position_id INT NOT NULL,
 
    PRIMARY KEY (id),
    FOREIGN KEY (position_id) REFERENCES positions (id)
);
 
CREATE TABLE branches(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    schedule VARCHAR(511) NOT NULL,
    balance FLOAT(53) NOT NULL,
    address VARCHAR(511) NOT NULL,
    postal_code INT NOT NULL,
    lat FLOAT(53) NOT NULL,
    lng FLOAT(53) NOT NULL,
    manager_id INT NOT NULL,
 
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES employees (id)
);
 
CREATE TABLE tills(
    id INT NOT NULL AUTO_INCREMENT,
    balance FLOAT(53) NOT NULL,
    branch_id INT NOT NULL,
 
    PRIMARY KEY (id),
    FOREIGN KEY (branch_id) REFERENCES branches (id)
);
 
CREATE TABLE logs(
    id INT NOT NULL AUTO_INCREMENT,
    start DATETIME NOT NULL,
    end DATETIME NOT NULL,
    employee_id INT NOT NULL,
    till_id INT NOT NULL,
 
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees (id),
    FOREIGN KEY (till_id) REFERENCES tills (id)
);
 
CREATE TABLE discounts(
    id INT NOT NULL AUTO_INCREMENT,
    price FLOAT(53) NOT NULL,
    created_at DATETIME NOT NULL,
 
    PRIMARY KEY (id)
);
 
CREATE TABLE prices(
    id INT NOT NULL AUTO_INCREMENT,
    price FLOAT(53) NOT NULL,
    created_at DATETIME NOT NULL,
 
    PRIMARY KEY (id)
);
 
CREATE TABLE companies(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    rfc VARCHAR(15) NOT NULL,
 
    PRIMARY KEY (id)
);
 
CREATE TABLE providers(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    company_id INT NOT NULL,
 
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES companies (id)
);

CREATE TABLE departments(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE subdepartments(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    department_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments (id)
);

CREATE TABLE categories(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    subdepartment_id INT NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY (subdepartment_id) REFERENCES subdepartments(id)
);

CREATE TABLE brands(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY(id)
);

CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT,
    secondary_id INT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(511) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
 
    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brands (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

CREATE TABLE images(
    id INT NOT NULL AUTO_INCREMENT,
    path VARCHAR(255) NOT NULL,
    product_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE specifications(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(511) NOT NULL,
    product_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE branch_product(
    quantity INT NOT NULL,
    restock INT NOT NULL,
    branch_id INT NOT NULL,
    product_id INT NOT NULL,
 
    FOREIGN KEY (branch_id) REFERENCES branches (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    PRIMARY KEY (branch_id, product_id)
);
 
CREATE TABLE branch_discount_product(
    branch_id INT NOT NULL,
    discount_id INT NOT NULL,
    product_id INT NOT NULL,
 
    FOREIGN KEY (branch_id) REFERENCES branches (id),
    FOREIGN KEY (discount_id) REFERENCES discounts (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    PRIMARY KEY (branch_id, discount_id, product_id)
);
 
CREATE TABLE branch_price_product(
    branch_id INT NOT NULL,
    price_id INT NOT NULL,
    product_id INT NOT NULL,
 
    FOREIGN KEY (branch_id) REFERENCES branches (id),
    FOREIGN KEY (price_id) REFERENCES prices (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    PRIMARY KEY (branch_id, price_id, product_id)
);
 
CREATE TABLE product_provider_price(
    price_id INT NOT NULL,
    provider_id INT NOT NULL,
    product_id INT NOT NULL,
 
    FOREIGN KEY (price_id) REFERENCES prices (id),
    FOREIGN KEY (provider_id) REFERENCES providers (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    PRIMARY KEY (price_id, provider_id, product_id)
);
 
CREATE TABLE purchases(
    id INT NOT NULL AUTO_INCREMENT,
    quantity INT NOT NULL,
    branch_id INT NOT NULL,
    price_id INT NOT NULL,
    product_id INT NOT NULL,
    provider_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    done TINYINT(1) NOT NULL DEFAULT 0,
    
 
    FOREIGN KEY (branch_id) REFERENCES branches (id),
    FOREIGN KEY (price_id) REFERENCES prices (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    FOREIGN KEY (provider_id) REFERENCES providers (id),
    PRIMARY KEY (id)
);

CREATE TABLE clients(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birth DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE models(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brands (id)
);

CREATE TABLE motors(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE model_motor(
    model_id INT NOT NULL,
    motor_id INT NOT NULL,

    FOREIGN KEY (model_id) REFERENCES models (id),
    FOREIGN KEY (motor_id) REFERENCES motors (id),
    PRIMARY KEY (model_id, motor_id)
);

CREATE TABLE model_product(
    model_id INT NOT NULL,
    product_id INT NOT NULL,

    FOREIGN KEY (model_id) REFERENCES models (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    PRIMARY KEY (model_id, product_id)
);

CREATE TABLE vehicles(
    id INT NOT NULL AUTO_INCREMENT,
    year INT NOT NULL,
    model_id INT NOT NULL,
    motor_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (model_id) REFERENCES models (id),
    FOREIGN KEY (motor_id) REFERENCES motors (id)
);

CREATE TABLE client_vehicle(
    client_id INT NOT NULL,
    vehicle_id INT NOT NULL,

    FOREIGN KEY (client_id) REFERENCES clients (id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (id)
);

CREATE TABLE client_location(
    client_id INT NOT NULL,
    location_id INT NOT NULL,
 
    FOREIGN KEY (client_id) REFERENCES clients (id),
    FOREIGN KEY (location_id) REFERENCES locations (id),
    PRIMARY KEY (client_id, location_id)
);
 
CREATE TABLE carts(
    id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,

    FOREIGN KEY (client_id) REFERENCES clients (id),
    PRIMARY KEY (id)
);
 
CREATE TABLE cart_product(
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
 
    FOREIGN KEY (cart_id) REFERENCES carts (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    PRIMARY KEY (cart_id, product_id)
);

CREATE TABLE payment_types(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE deliveries(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE statuses(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE requisitions(
    id INT NOT NULL AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    cart_id INT NOT NULL,
    client_id INT NOT NULL,
    delivery_id INT NOT NULL,
    payment_type_id INT NOT NULL,
    till_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (cart_id) REFERENCES carts (id),
    FOREIGN KEY (client_id) REFERENCES clients (id),
    FOREIGN KEY (delivery_id) REFERENCES deliveries (id),
    FOREIGN KEY (payment_type_id) REFERENCES payment_types (id),
    FOREIGN KEY (till_id) REFERENCES tills (id)
);

CREATE TABLE requisition_status(
    created_at DATETIME NOT NULL,
    requisition_id INT NOT NULL,
    status_id INT NOT NULL,

    FOREIGN KEY (requisition_id)  REFERENCES requisitions (id),
    FOREIGN KEY (status_id) REFERENCES statuses (id),
    PRIMARY KEY (requisition_id, status_id)
);

CREATE TABLE salesPerHour(
    id INT NOT NULL AUTO_INCREMENT,
    total FLOAT(7,2) NOT NULL,
    created_at DATETIME NOT NULL,

    PRIMARY KEY(id)
);

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

DELIMITER $$
  CREATE FUNCTION getCartTotal(cart_id INT) RETURNS FLOAT(7,2)
  DETERMINISTIC
  BEGIN
    DECLARE total FLOAT(7,2);
    SET total = 0;

    SELECT sum((getValue(p.id, 2, NOW()) * cp.quantity))
    INTO total
    FROM products p, carts c, cart_product cp
    WHERE c.id = cart_id and cp.cart_id = c.id and p.id = cp.product_id;

    RETURN (total);
  END
  $$
DELIMITER ;

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
  CREATE FUNCTION getPurchaseCartTotal(cart_id INT) RETURNS FLOAT(7,2)
  DETERMINISTIC
  BEGIN
    DECLARE total FLOAT(7,2);
    SET total = 0;

    SELECT sum((getPurchaseValue(p.id, 2, NOW()) * cp.quantity))
    INTO total
    FROM products p, carts c, cart_product cp
    WHERE c.id = cart_id and cp.cart_id = c.id and p.id = cp.product_id;

    RETURN (total);
  END
  $$
DELIMITER ;

DELIMITER $$
    CREATE FUNCTION getLastHourValue() RETURNS FLOAT(7,2)
    DETERMINISTIC
    BEGIN
        DECLARE total FLOAT(7,2);
        SET total = 0;

        SELECT SUM(getCartTotal(r.cart_id))
        INTO total
        FROM requisitions r
        WHERE r.created_at >= (NOW() - INTERVAL 1 HOUR);

        RETURN (total);
    END $$
DELIMITER ;

DELIMITER $$
    CREATE FUNCTION getDayValue(date Date) RETURNS FLOAT(7,2)
    DETERMINISTIC
    BEGIN
        DECLARE total FLOAT(7,2);
        SET total = 0;

        SELECT SUM(getCartTotal(r.cart_id))
        INTO total
        FROM requisitions r
        WHERE DATE(r.created_at) = date;

        RETURN (total);
    END $$
DELIMITER ;

SET GLOBAL event_scheduler = ON;

DELIMITER $$
CREATE EVENT IF NOT EXISTS hourlyValues
ON SCHEDULE EVERY 1 HOUR
    START '2018-02-16 15:00:00'
DO
    BEGIN
        START TRANSACTION;
        INSERT INTO salesPerHour(total, created_at) VALUES (getLastHourValue(), NOW());
        COMMIT;
    END $$
DELIMITER ;

CREATE EVENT IF NOT EXISTS activateHourlyValues
ON SCHEDULE 
    EVERY 1 DAY
    STARTS '2018-02-17 5:00:00'
DO
    ALTER EVENT hourlyValues
        ENABLE;

CREATE EVENT IF NOT EXISTS deactivateHourlyValues
ON SCHEDULE 
    EVERY 10 MINUTE
    STARTS '2018-02-16 23:01:00'
DO
    ALTER EVENT hourlyValues
        DISABLE;

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