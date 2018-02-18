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
