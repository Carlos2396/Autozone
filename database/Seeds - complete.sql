INSERT INTO positions (name, salary) VALUES ('Manager', 22750.00);
INSERT INTO positions (name, salary) VALUES ('Cashier', 12000.00);
INSERT INTO positions (name, salary) VALUES ('Salesman', 10000.00);

INSERT INTO locations (address, postal_code, lat, lng) VALUES ('Av. tec 547', 72510, 19.614587, -90.123456);
INSERT INTO locations (address, postal_code, lat, lng) VALUES ('Av. juarez 547', 72500, 19.614587, -90.123456);
INSERT INTO locations (address, postal_code, lat, lng) VALUES ('Av. bosques 547', 72520, 19.614587, -90.123456);
INSERT INTO locations (address, postal_code, lat, lng) VALUES ('Av. 5 de mayo 547', 72530, 19.614587, -90.123456);
INSERT INTO locations (address, postal_code, lat, lng) VALUES ('Av. las torres 547', 72570, 19.614587, -90.123456);
INSERT INTO locations (address, postal_code, lat, lng) VALUES ('Av. margaritas 547', 72540, 19.614587, -90.123456);

INSERT INTO employees (name, birth, phone, email, password, active, created_at, branch_id, position_id) VALUES ('Dan Perez', '1975-05-10', '2224778563', 'danperez@itesm.mx', 'secret', 1, NOW(), 2, 1);
INSERT INTO employees (name, birth, phone, email, password, active, created_at, branch_id, position_id) VALUES ('Alberto Oliart', '1970-05-10', '2224789563', 'aoliart@itesm.mx', 'secret', 1, NOW(), 1, 1);
INSERT INTO employees (name, birth, phone, email, password, active, created_at, branch_id, position_id) VALUES ('Juan Calleros', '1978-05-10', '2224781563', 'jmcalleros@itesm.mx', 'secret', 1, NOW(), 1, 2);
INSERT INTO employees (name, birth, phone, email, password, active, created_at, branch_id, position_id) VALUES ('David Sol', '1965-05-10', '2224789514', 'dsol@itesm.mx', 'secret', 1, NOW(), 1, 2);
INSERT INTO employees (name, birth, phone, email, password, active, created_at, branch_id, position_id) VALUES ('Alberto Palomares', '1980-05-10', '2224789203', 'apalomares@itesm.mx', 'secret', 1, NOW(), 1, 3);

INSERT INTO branches (name, schedule, balance, address, postal_code, lat, lng, manager_id) VALUES ('Física', 'Lunes a sabado de 10:00 a 21:00', 50000.00, 'Av. astronomos 547', 72500, 19.614587, -90.123456, 2);
INSERT INTO branches (name, schedule, balance, address, postal_code, lat, lng, manager_id) VALUES ('En linea', 'Lunes a domingo de 00:00 a 23:59', 50000.00, 'Av. astronomos 547', 72500, 19.614587, -90.123456, 1);
ALTER TABLE employees ADD CONSTRAINT FOREIGN KEY (branch_id) REFERENCES branches (id);

INSERT INTO tills (balance, branch_id) VALUES (2350.50, 1);
INSERT INTO tills (balance, branch_id) VALUES (1200.50, 1);
INSERT INTO tills (balance, branch_id) VALUES (10300.00, 2);

INSERT INTO logs (start, end, employee_id, till_id) VALUES ('2018-01-25 08:00:00', DATE_ADD('2018-01-25 08:00:00', INTERVAL 2 HOUR), 3, 1);
INSERT INTO logs (start, end, employee_id, till_id) VALUES ('2018-01-25 08:00:00', DATE_ADD('2018-01-25 08:00:00', INTERVAL 2 HOUR), 4, 2);
INSERT INTO logs (start, end, employee_id, till_id) VALUES ('2018-01-25 12:00:00', DATE_ADD('2018-01-25 12:00:00', INTERVAL 2 HOUR), 3, 2);
INSERT INTO logs (start, end, employee_id, till_id) VALUES ('2018-01-25 12:00:00', DATE_ADD('2018-01-25 12:00:00', INTERVAL 2 HOUR), 4, 1);

INSERT INTO prices (price, created_at) VALUES (90.00, NOW());
INSERT INTO prices (price, created_at) VALUES (100.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO prices (price, created_at) VALUES (110.00, NOW());
INSERT INTO prices (price, created_at) VALUES (50.00, NOW());
INSERT INTO prices (price, created_at) VALUES (55.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO prices (price, created_at) VALUES (60.00, NOW());
INSERT INTO prices (price, created_at) VALUES (200.00, NOW());
INSERT INTO prices (price, created_at) VALUES (220.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO prices (price, created_at) VALUES (225.00, NOW());
INSERT INTO prices (price, created_at) VALUES (300.00, NOW());
INSERT INTO prices (price, created_at) VALUES (330.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO prices (price, created_at) VALUES (320.00, NOW());
INSERT INTO prices (price, created_at) VALUES (150.00, NOW());
INSERT INTO prices (price, created_at) VALUES (160.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO prices (price, created_at) VALUES (155.00, NOW());
INSERT INTO prices (price, created_at) VALUES (90.00, NOW());
INSERT INTO prices (price, created_at) VALUES (100.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO prices (price, created_at) VALUES (110.00, NOW());
INSERT INTO prices (price, created_at) VALUES (50.00, NOW());
INSERT INTO prices (price, created_at) VALUES (55.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO prices (price, created_at) VALUES (60.00, NOW());
INSERT INTO prices (price, created_at) VALUES (200.00, NOW());
INSERT INTO prices (price, created_at) VALUES (220.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO prices (price, created_at) VALUES (225.00, NOW());
INSERT INTO prices (price, created_at) VALUES (300.00, NOW());
INSERT INTO prices (price, created_at) VALUES (330.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO prices (price, created_at) VALUES (320.00, NOW());
INSERT INTO prices (price, created_at) VALUES (150.00, NOW());
INSERT INTO prices (price, created_at) VALUES (160.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO prices (price, created_at) VALUES (155.00, NOW());

INSERT INTO prices (price, created_at) VALUES (70.00, NOW());
INSERT INTO prices (price, created_at) VALUES (35.00, NOW());
INSERT INTO prices (price, created_at) VALUES (150.00, NOW());
INSERT INTO prices (price, created_at) VALUES (220.00, NOW());
INSERT INTO prices (price, created_at) VALUES (120.00, NOW());
INSERT INTO prices (price, created_at) VALUES (70.00, NOW());
INSERT INTO prices (price, created_at) VALUES (35.00, NOW());
INSERT INTO prices (price, created_at) VALUES (150.00, NOW());
INSERT INTO prices (price, created_at) VALUES (220.00, NOW());
INSERT INTO prices (price, created_at) VALUES (120.00, NOW());

INSERT INTO prices (price, created_at) VALUES (72.00, NOW());
INSERT INTO prices (price, created_at) VALUES (33.00, NOW());
INSERT INTO prices (price, created_at) VALUES (152.00, NOW());
INSERT INTO prices (price, created_at) VALUES (217.00, NOW());
INSERT INTO prices (price, created_at) VALUES (122.00, NOW());
INSERT INTO prices (price, created_at) VALUES (72.00, NOW());
INSERT INTO prices (price, created_at) VALUES (33.00, NOW());
INSERT INTO prices (price, created_at) VALUES (152.00, NOW());
INSERT INTO prices (price, created_at) VALUES (217.00, NOW());
INSERT INTO prices (price, created_at) VALUES (122.00, NOW());

INSERT INTO discounts (price, created_at) VALUES(85.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO discounts (price, created_at) VALUES(45.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO discounts (price, created_at) VALUES(190.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO discounts (price, created_at) VALUES(280.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO discounts (price, created_at) VALUES(135.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO discounts (price, created_at) VALUES(85.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO discounts (price, created_at) VALUES(45.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO discounts (price, created_at) VALUES(190.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO discounts (price, created_at) VALUES(280.00, DATE_ADD(NOW(), INTERVAL 2 DAY));
INSERT INTO discounts (price, created_at) VALUES(135.00, DATE_ADD(NOW(), INTERVAL 2 DAY));

INSERT INTO companies (name, rfc) VALUES ('Big provider company', 'rfc123456');
INSERT INTO companies (name, rfc) VALUES ('Small provider company', 'rfc123457');

INSERT INTO providers (name, phone, email, company_id) VALUES ('Juan proovedor', 'juan@proveedor.com', '554477889', 1);
INSERT INTO providers (name, phone, email, company_id) VALUES ('Jose proovedor', 'jose@proveedor.com', '554477880', 1);
INSERT INTO providers (name, phone, email, company_id) VALUES ('Pedro proovedor', 'pedro@proveedor.com', '554477887', 2);
INSERT INTO providers (name, phone, email, company_id) VALUES ('Miguel proovedor', 'miguel@proveedor.com', '554477886', 2);

INSERT INTO departments (name) VALUES ('Refacciones');
INSERT INTO departments (name) VALUES ('Accesorios');

INSERT INTO subdepartments (name, department_id) VALUES ('Partes', 1);
INSERT INTO subdepartments (name, department_id) VALUES ('Aceites', 1);
INSERT INTO subdepartments (name, department_id) VALUES ('Decorativos', 2);
INSERT INTO subdepartments (name, department_id) VALUES ('Seguridad', 2);

INSERT INTO categories (name, subdepartment_id) VALUES ('Luces', 1);
INSERT INTO categories (name, subdepartment_id) VALUES ('Baleros', 1);
INSERT INTO categories (name, subdepartment_id) VALUES ('De motor', 2);
INSERT INTO categories (name, subdepartment_id) VALUES ('Genericos', 2);
INSERT INTO categories (name, subdepartment_id) VALUES ('Aromatizantes', 3);
INSERT INTO categories (name, subdepartment_id) VALUES ('Vinilos', 3);
INSERT INTO categories (name, subdepartment_id) VALUES ('Bastones', 4);
INSERT INTO categories (name, subdepartment_id) VALUES ('Controles a distancia', 4);

INSERT INTO brands (name) VALUES ('VW');
INSERT INTO brands (name) VALUES ('BMW');
INSERT INTO brands (name) VALUES ('Mazda');
INSERT INTO brands (name) VALUES ('LTH');
INSERT INTO brands (name) VALUES ('Roshfranz');
INSERT INTO brands (name) VALUES ('Michelin');
INSERT INTO brands (name) VALUES ('OEM');
INSERT INTO brands (name) VALUES ('Quaker state');

INSERT INTO products (secondary_id, name, description, brand_id, category_id) VALUES (1234, 'Faros de halogeno', 'Faros para automovil ...', 4, 1);
INSERT INTO products (secondary_id, name, description, brand_id, category_id) VALUES (1235, 'Faros de niebla', 'Faros para automovil ...', 4, 1);
INSERT INTO products (secondary_id, name, description, brand_id, category_id) VALUES (1236, 'Baleros profesionales', 'Baleros para automovil ...', 7, 2);
INSERT INTO products (secondary_id, name, description, brand_id, category_id) VALUES (1237, 'Aceite estandar', 'Aceite para automovil ...', 5, 3);
INSERT INTO products (secondary_id, name, description, brand_id, category_id) VALUES (1238, 'Aceite protector', 'Aceite protector para automovil ...', 5, 4);
INSERT INTO products (secondary_id, name, description, brand_id, category_id) VALUES (1239, 'Aceite para bizagras', 'Aceite para bizagras de automovil ...', 5, 4);
INSERT INTO products (secondary_id, name, description, brand_id, category_id) VALUES (1241, 'Aromatizante de pino', 'Aromatizante para automovil ...', 8, 5);
INSERT INTO products (secondary_id, name, description, brand_id, category_id) VALUES (1242, 'Vinilos de parabrizas', 'Vinilos de parabrizas para automovil ...', 7, 6);
INSERT INTO products (secondary_id, name, description, brand_id, category_id) VALUES (1243, 'Bastones para volante', 'Bastones para volante para automovil ...', 6, 7);
INSERT INTO products (secondary_id, name, description, brand_id, category_id) VALUES (1249, 'Controles de puertas', 'Controles de puertas para automovil ...', 5, 8);

INSERT INTO images (path, product_id) VALUES ('images/1a.jpg', 1);
INSERT INTO images (path, product_id) VALUES ('images/1b.jpg', 1);
INSERT INTO images (path, product_id) VALUES ('images/2a.jpg', 2);
INSERT INTO images (path, product_id) VALUES ('images/2b.jpg', 2);
INSERT INTO images (path, product_id) VALUES ('images/3a.jpg', 3);
INSERT INTO images (path, product_id) VALUES ('images/4a.jpg', 4);
INSERT INTO images (path, product_id) VALUES ('images/5a.jpg', 5);
INSERT INTO images (path, product_id) VALUES ('images/6a.jpg', 6);
INSERT INTO images (path, product_id) VALUES ('images/7a.jpg', 7);
INSERT INTO images (path, product_id) VALUES ('images/8a.jpg', 8);
INSERT INTO images (path, product_id) VALUES ('images/9a.jpg', 9);
INSERT INTO images (path, product_id) VALUES ('images/10a.jpg', 10);

INSERT INTO specifications (name, description, product_id) VALUES ('Voltaje', '220 volts', 1);
INSERT INTO specifications (name, description, product_id) VALUES ('Garantia', '2 años', 1);
INSERT INTO specifications (name, description, product_id) VALUES ('Voltaje', '220 volts', 2);
INSERT INTO specifications (name, description, product_id) VALUES ('Garantia', '2 años', 2);
INSERT INTO specifications (name, description, product_id) VALUES ('Voltaje', '220 volts', 3);
INSERT INTO specifications (name, description, product_id) VALUES ('Garantia', '2 años', 3);
INSERT INTO specifications (name, description, product_id) VALUES ('Voltaje', '220 volts', 4);
INSERT INTO specifications (name, description, product_id) VALUES ('Garantia', '2 años', 4);
INSERT INTO specifications (name, description, product_id) VALUES ('Voltaje', '220 volts', 5);
INSERT INTO specifications (name, description, product_id) VALUES ('Garantia', '2 años', 5);
INSERT INTO specifications (name, description, product_id) VALUES ('Voltaje', '220 volts', 6);
INSERT INTO specifications (name, description, product_id) VALUES ('Garantia', '2 años', 6);
INSERT INTO specifications (name, description, product_id) VALUES ('Voltaje', '220 volts', 7);
INSERT INTO specifications (name, description, product_id) VALUES ('Garantia', '2 años', 7);
INSERT INTO specifications (name, description, product_id) VALUES ('Voltaje', '220 volts', 8);
INSERT INTO specifications (name, description, product_id) VALUES ('Garantia', '2 años', 8);
INSERT INTO specifications (name, description, product_id) VALUES ('Voltaje', '220 volts', 9);
INSERT INTO specifications (name, description, product_id) VALUES ('Garantia', '2 años', 9);
INSERT INTO specifications (name, description, product_id) VALUES ('Voltaje', '220 volts', 10);
INSERT INTO specifications (name, description, product_id) VALUES ('Garantia', '2 años', 10);

INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (1, 1, 10);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (2, 1, 5);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (1, 2, 10);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (2, 2, 5);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (1, 3, 10);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (2, 3, 5);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (1, 4, 10);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (2, 4, 5);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (2, 5, 5);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (1, 6, 10);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (2, 6, 5);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (1, 7, 10);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (2, 7, 5);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (1, 8, 10);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (2, 8, 5);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (1, 9, 10);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (2, 9, 5);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (1, 10, 10);
INSERT INTO branch_product (branch_id, product_id, quantity) VALUES (2, 10, 5);

INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 1, 1);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 1, 2);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (2, 1, 3);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 2, 4);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 2, 5);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (2, 2, 6);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 3, 7);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 3, 8);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (2, 3, 9);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 4, 10);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 4, 11);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (2, 4, 12);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 5, 13);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 5, 14);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (2, 5, 15);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 6, 16);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 6, 17);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (2, 6, 18);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 7, 19);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 7, 20);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (2, 7, 21);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 8, 22);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 8, 23);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (2, 8, 24);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 9, 25);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 9, 26);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (2, 9, 27);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 10, 28);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (1, 10, 29);
INSERT INTO branch_price_product (branch_id, product_id, price_id) VALUES (2, 10, 30);

INSERT INTO branch_discount_product (branch_id, product_id, discount_id) VALUES (1, 1, 1);
INSERT INTO branch_discount_product (branch_id, product_id, discount_id) VALUES (1, 2, 2);
INSERT INTO branch_discount_product (branch_id, product_id, discount_id) VALUES (1, 3, 3);
INSERT INTO branch_discount_product (branch_id, product_id, discount_id) VALUES (1, 4, 4);
INSERT INTO branch_discount_product (branch_id, product_id, discount_id) VALUES (1, 5, 5);
INSERT INTO branch_discount_product (branch_id, product_id, discount_id) VALUES (1, 6, 6);
INSERT INTO branch_discount_product (branch_id, product_id, discount_id) VALUES (1, 7, 7);
INSERT INTO branch_discount_product (branch_id, product_id, discount_id) VALUES (1, 8, 8);
INSERT INTO branch_discount_product (branch_id, product_id, discount_id) VALUES (1, 9, 9);
INSERT INTO branch_discount_product (branch_id, product_id, discount_id) VALUES (1, 10, 10);

INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (1, 1, 31);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (2, 2, 32);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (3, 1, 33);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (4, 2, 34);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (5, 1, 35);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (6, 2, 36);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (7, 1, 37);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (8, 2, 38);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (9, 1, 39);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (10, 2, 40);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (1, 3, 41);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (2, 4, 42);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (3, 3, 43);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (4, 4, 44);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (5, 3, 45);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (6, 4, 46);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (7, 3, 47);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (8, 4, 48);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (9, 3, 49);
INSERT INTO product_provider_price (product_id, provider_id, price_id) VALUES (10, 4, 50);

INSERT INTO purchases (quantity, branch_id, product_id, provider_id, price_id) VALUES (5, 1, 1, 1, 31);
INSERT INTO purchases (quantity, branch_id, product_id, provider_id, price_id) VALUES (12, 1, 5, 3, 45);


INSERT INTO clients (name, birth, email, phone, password) VALUES ('Endy Flores', '1952-10-20', 'endy@gmail.com', '2295638417','secret');
INSERT INTO clients (name, birth, email, phone, password) VALUES ('Rosa Paredes', '1978-10-20', 'rosa@gmail.com', '2221639845', 'secret');
INSERT INTO clients (name, birth, email, phone, password) VALUES ('JM González Calleros', '1970-5-17', 'jmgc@gmail.com','2221458596', 'secret');

INSERT INTO models(name, brand_id) VALUES ('Vento', 1);
INSERT INTO models(name, brand_id) VALUES ('Serie 4 Coupé', 2);
INSERT INTO models(name, brand_id) VALUES ('CX7', 3);


INSERT INTO motors(name) VALUES ('Turbo TSI');
INSERT INTO motors(name) VALUES ('428i');

INSERT INTO model_motor(model_id, motor_id) VALUES (1, 1);
INSERT INTO model_motor(model_id, motor_id) VALUES (3, 1);
INSERT INTO model_motor(model_id, motor_id) VALUES (2, 2);
INSERT INTO model_motor(model_id, motor_id) VALUES (3, 2);

INSERT INTO model_product(model_id, product_id) VALUES (1, 1);
INSERT INTO model_product(model_id, product_id) VALUES (2, 1);
INSERT INTO model_product(model_id, product_id) VALUES (3, 1);
INSERT INTO model_product(model_id, product_id) VALUES (1, 2);
INSERT INTO model_product(model_id, product_id) VALUES (2, 2);
INSERT INTO model_product(model_id, product_id) VALUES (3, 3);
INSERT INTO model_product(model_id, product_id) VALUES (1, 4);
INSERT INTO model_product(model_id, product_id) VALUES (2, 4);
INSERT INTO model_product(model_id, product_id) VALUES (2, 5);
INSERT INTO model_product(model_id, product_id) VALUES (3, 6);
INSERT INTO model_product(model_id, product_id) VALUES (1, 6);
INSERT INTO model_product(model_id, product_id) VALUES (2, 7);
INSERT INTO model_product(model_id, product_id) VALUES (3, 8);
INSERT INTO model_product(model_id, product_id) VALUES (1, 9);
INSERT INTO model_product(model_id, product_id) VALUES (2, 9);
INSERT INTO model_product(model_id, product_id) VALUES (3, 9);
INSERT INTO model_product(model_id, product_id) VALUES (1, 10);
INSERT INTO model_product(model_id, product_id) VALUES (2, 10);

INSERT INTO vehicles (year, model_id, motor_id) VALUES (2011, 1, 1);
INSERT INTO vehicles (year, model_id, motor_id) VALUES (2015, 2, 2);
INSERT INTO vehicles (year, model_id, motor_id) VALUES (2017, 3, 2);

INSERT INTO client_vehicle(client_id, vehicle_id) VALUES (1, 1);
INSERT INTO client_vehicle(client_id, vehicle_id) VALUES (2, 1);
INSERT INTO client_vehicle(client_id, vehicle_id) VALUES (3, 2);
INSERT INTO client_vehicle(client_id, vehicle_id) VALUES (3, 3);

INSERT INTO client_location(client_id, location_id) VALUES (1, 1);
INSERT INTO client_location(client_id, location_id) VALUES (2, 2);
INSERT INTO client_location(client_id, location_id) VALUES (3, 3);

INSERT INTO carts(client_id) VALUES (1);
INSERT INTO carts(client_id) VALUES (2);
INSERT INTO carts(client_id) VALUES (3);

INSERT INTO payment_types(name) VALUES ('Efectivo');
INSERT INTO payment_types(name) VALUES ('Débito');
INSERT INTO payment_types(name) VALUES ('Crédito');

INSERT INTO deliveries(name) VALUES ('En tienda');
INSERT INTO deliveries(name) VALUES ('Envío a domicilio');

INSERT INTO statuses(name) VALUES ('Apartado en tienda');
INSERT INTO statuses(name) VALUES ('En proceso de envío');
INSERT INTO statuses(name) VALUES ('En tránsito');
INSERT INTO statuses(name) VALUES ('Entregado');

INSERT INTO requisitions(created_at, cart_id, client_id, delivery_id, payment_type_id, till_id) VALUES (now(), 1, 1, 1, 1, 3);
INSERT INTO requisitions(created_at, cart_id, client_id, delivery_id, payment_type_id, till_id) VALUES (now(), 2, 2, 1, 3, 3);
INSERT INTO requisitions(created_at, cart_id, client_id, delivery_id, payment_type_id, till_id) VALUES (now(), 3, 3, 2, 2, 3);

INSERT INTO requisition_status(created_at, requisition_id, status_id) VALUES (now(), 1, 4);
INSERT INTO requisition_status(created_at, requisition_id, status_id) VALUES (now(), 2, 4);
INSERT INTO requisition_status(created_at, requisition_id, status_id) VALUES (now(), 3, 3);

INSERT INTO cart_product(cart_id,product_id, quantity) VALUES (1, 2, 3);
INSERT INTO cart_product(cart_id,product_id, quantity) VALUES (1, 5, 1);
INSERT INTO cart_product(cart_id,product_id, quantity) VALUES (1, 3, 4);
INSERT INTO cart_product(cart_id,product_id, quantity) VALUES (2, 7, 3);
INSERT INTO cart_product(cart_id,product_id, quantity) VALUES (2, 9, 1);
INSERT INTO cart_product(cart_id,product_id, quantity) VALUES (3, 10, 10);