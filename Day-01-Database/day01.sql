-- ShopSphere - Day 01
-- Database Creation and Customer Table


create database shopsphere;
use shopsphere;
-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);
SHOW TABLES;
DESCRIBE customers;
-- Insert sample customers
INSERT INTO customers
(customer_id, first_name, last_name, email, city)
VALUES
(1, 'Prerna', 'Raj', 'prerna@example.com', 'Patiala'),
(2, 'Aman', 'Sharma', 'aman@example.com', 'Delhi'),
(3, 'Simran', 'Kaur', 'simran@example.com', 'Chandigarh');
-- Display customers
SELECT * FROM customers;