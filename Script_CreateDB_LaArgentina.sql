-- Drop the database if it already exists
DROP DATABASE IF EXISTS ecommerce_la_argentina;

-- Create the database
CREATE DATABASE ecommerce_la_argentina;

-- Use the created database
USE ecommerce_la_argentina;

-- Create the User table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100)
);

-- Insert sample data into the User table
INSERT INTO User (full_name, email, password) VALUES
('Juan Pérez', 'juan@example.com', 'password123'),
('María López', 'maria@example.com', 'qwerty456'),
('Carlos García', 'carlos@example.com', 'abc123');

-- Create the Role table
CREATE TABLE Role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50)
);

-- Insert sample data into the Role table
INSERT INTO Role (role_name) VALUES
('Administrator'),
('Publisher'),
('Customer');

-- Create the UserRole table
CREATE TABLE UserRole (
    user_id INT,
    role_id INT,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Insert sample data into the UserRole table
INSERT INTO UserRole (user_id, role_id) VALUES
(1, 1),
(2, 3),
(3, 3);

-- Create the State table
CREATE TABLE State (
    state_id INT AUTO_INCREMENT PRIMARY KEY,
    state_name VARCHAR(50),
    description TEXT
);

-- Insert sample data into the State table
INSERT INTO State (state_name, description) VALUES
('Pending', 'The order is pending processing.'),
('Shipped', 'The order has been shipped to the customer.'),
('Delivered', 'The order has been delivered to the customer.');

-- Create the OrderDetail table
CREATE TABLE OrderDetail (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    state_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Insert sample data into the OrderDetail table
INSERT INTO OrderDetail (user_id, state_id, order_date) VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-02-20'),
(3, 1, '2024-03-25');

-- Create the Product table
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock INT
);

-- Insert sample data into the Product table
INSERT INTO Product (product_name, description, price, stock) VALUES
('Blue Shirt', 'Blue cotton shirt for men.', 29.99, 50),
('Floral Dress', 'Summer dress with floral print for women.', 39.99, 30),
('Black Pants', 'Black dress pants for men.', 49.99, 20);

-- Create the OrderProduct table
CREATE TABLE OrderProduct (
    order_detail_id INT,
    product_id INT,
    PRIMARY KEY (order_detail_id, product_id),
    FOREIGN KEY (order_detail_id) REFERENCES OrderDetail(order_detail_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Insert sample data into the OrderProduct table
INSERT INTO OrderProduct (order_detail_id, product_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 3);

-- Create the Session table
CREATE TABLE Session (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    start_date DATETIME,
    end_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Insert sample data into the Session table
INSERT INTO Session (user_id, start_date, end_date) VALUES
(1, '2024-01-01 10:00:00', '2024-01-01 12:00:00'),
(2, '2024-02-01 10:00:00', '2024-02-01 12:00:00'),
(3, '2024-03-01 10:00:00', '2024-03-01 12:00:00');

-- Create the AccessHistory table
CREATE TABLE AccessHistory (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    access_date DATETIME,
    action VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Insert sample data into the AccessHistory table
INSERT INTO AccessHistory (user_id, access_date, action) VALUES
(1, '2024-01-01 10:00:00', 'Logged in'),
(2, '2024-02-01 10:00:00', 'Logged in'),
(3, '2024-03-01 10:00:00', 'Logged in');

-- Create the ShippingAddress table
CREATE TABLE ShippingAddress (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    address VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Insert sample data into the ShippingAddress table
INSERT INTO ShippingAddress (user_id, address, city, postal_code, country) VALUES
(1, '123 Main St', 'Cityville', '12345', 'Countryland'),
(2, '456 Oak Ave', 'Townburg', '67890', 'Countryland'),
(3, '789 Pine Rd', 'Villageton', '54321', 'Countryland');

-- Create the PaymentMethod table
CREATE TABLE PaymentMethod (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    type VARCHAR(50),
    number VARCHAR(100),
    expiration_date DATE,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Insert sample data into the PaymentMethod table
INSERT INTO PaymentMethod (user_id, type, number, expiration_date) VALUES
(1, 'Credit Card', '1234-5678-9012-3456', '2025-01-01'),
(2, 'Debit Card', '9876-5432-1098-7654', '2024-12-01'),
(3, 'PayPal', 'user@example.com', '2023-06-01');

-- Create the OrderShippingAddress table
CREATE TABLE OrderShippingAddress (
    order_detail_id INT,
    address_id INT,
    PRIMARY KEY (order_detail_id, address_id),
    FOREIGN KEY (order_detail_id) REFERENCES OrderDetail(order_detail_id),
    FOREIGN KEY (address_id) REFERENCES ShippingAddress(address_id)
);

-- Insert sample data into the OrderShippingAddress table
INSERT INTO OrderShippingAddress (order_detail_id, address_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Create the OrderPaymentMethod table
CREATE TABLE OrderPaymentMethod (
    order_detail_id INT,
    method_id INT,
    PRIMARY KEY (order_detail_id, method_id),
    FOREIGN KEY (order_detail_id) REFERENCES OrderDetail(order_detail_id),
    FOREIGN KEY (method_id) REFERENCES PaymentMethod(method_id)
);

-- Insert sample data into the OrderPaymentMethod table
INSERT INTO OrderPaymentMethod (order_detail_id, method_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Vistas

-- Vista que muestra los roles asignados a cada usuario.
CREATE VIEW UserRolesView AS
SELECT u.user_id, u.full_name, u.email, r.role_name
FROM User u
JOIN UserRole ur ON u.user_id = ur.user_id
JOIN Role r ON ur.role_id = r.role_id;

-- Vista que muestra los pedidos pendientes de procesar.
CREATE VIEW PendingOrdersView AS
SELECT od.order_detail_id, od.user_id, od.state_id, od.order_date
FROM OrderDetail od
JOIN State s ON od.state_id = s.state_id
WHERE s.state_name = 'Pending';

-- Vista que muestra los productos que están fuera de stock.
CREATE VIEW OutOfStockProductsView AS
SELECT *
FROM Product
WHERE stock = 0;

-- Funciones

-- Función para calcular el total de un pedido.
DELIMITER //
CREATE FUNCTION CalculateOrderTotal(orderId INT) RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(Product.price)
    INTO total
    FROM OrderProduct
    INNER JOIN Product ON OrderProduct.product_id = Product.product_id
    WHERE OrderProduct.order_detail_id = orderId;
    RETURN total;
END;
//

-- Función para contar la cantidad de productos en un pedido.
DELIMITER //
CREATE FUNCTION CountProductsInOrder(orderId INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE productCount INT;
    SELECT COUNT(*)
    INTO productCount
    FROM OrderProduct
    WHERE order_detail_id = orderId;
    RETURN productCount;
END;
//

-- Función para obtener el estado actual de un pedido.
DELIMITER //
CREATE FUNCTION GetCurrentOrderState(orderId INT) RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE currentState VARCHAR(255);
    SELECT State.state_name
    INTO currentState
    FROM OrderDetail
    INNER JOIN State ON OrderDetail.state_id = State.state_id
    WHERE OrderDetail.order_detail_id = orderId;
    RETURN currentState;
END;
//

-- Stored Procedures

-- Procedimiento para registrar un nuevo usuario.
DELIMITER //
CREATE PROCEDURE RegisterUser(
    IN fullName VARCHAR(255),
    IN email VARCHAR(255),
    IN pass VARCHAR(255)
)
BEGIN
    INSERT INTO User (full_name, email, password)
    VALUES (fullName, email, pass);
END //
DELIMITER ;

-- Procedimiento para actualizar la información de un usuario.
DELIMITER //
CREATE PROCEDURE UpdateUserInfo(
    IN userId INT,
    IN newFullName VARCHAR(255),
    IN newEmail VARCHAR(255)
)
BEGIN
    UPDATE User
    SET full_name = newFullName,
        email = newEmail
    WHERE user_id = userId;
END //
DELIMITER ;

-- Procedimiento para eliminar un usuario.
DELIMITER //
CREATE PROCEDURE DeleteUser(
    IN userId INT
)
BEGIN
    DELETE FROM User WHERE user_id = userId;
END //
DELIMITER ;

-- Triggers

-- Trigger para registrar el acceso de un usuario.
DELIMITER //
CREATE TRIGGER LogUserAccess
AFTER INSERT ON Session
FOR EACH ROW
BEGIN
    INSERT INTO AccessHistory (user_id, access_date, action)
    VALUES (NEW.user_id, NEW.start_date, 'Login');
END //
DELIMITER ;

-- Trigger para notificar al administrador sobre un nuevo pedido pendiente.
DELIMITER //
CREATE TRIGGER NotifyAdminOfPendingOrder
AFTER INSERT ON OrderDetail
FOR EACH ROW
BEGIN
    IF NEW.state_id = (SELECT state_id FROM State WHERE state_name = 'Pending') THEN
        INSERT INTO AdminNotifications (order_id, notification_date)
        VALUES (NEW.order_detail_id, NOW());
    END IF;
END //
DELIMITER ;

-- Trigger para actualizar el stock de productos después de agregar un nuevo pedido.
DELIMITER $$
CREATE TRIGGER update_product_stock AFTER INSERT ON OrderProduct
FOR EACH ROW
BEGIN
    DECLARE product_quantity INT;
    
    -- Obtener la cantidad del producto del pedido
    SELECT quantity INTO product_quantity
    FROM OrderDetail
    WHERE order_detail_id = NEW.order_detail_id;
    
    -- Actualizar el stock del producto
    UPDATE Product
    SET stock = stock - product_quantity
    WHERE product_id = NEW.product_id;
END$$
DELIMITER ;


-- Show success message
SELECT 'Database and sample data created successfully.' AS 'Message';
