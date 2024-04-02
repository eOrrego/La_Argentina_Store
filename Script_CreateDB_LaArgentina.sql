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

-- Show success message
SELECT 'Database and sample data created successfully.' AS 'Message';
