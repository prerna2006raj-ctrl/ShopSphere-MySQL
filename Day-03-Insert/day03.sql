USE shopsphere;

-- ============================================
-- DAY 3: INSERT E-COMMERCE DATA
-- ============================================

-- Insert customers
INSERT INTO customers
(customer_id, first_name, last_name, email, city)
VALUES
(4, 'Rahul', 'Verma', 'rahul@gmail.com', 'Mumbai'),
(5, 'Neha', 'Sharma', 'neha@gmail.com', 'Delhi'),
(6, 'Karan', 'Singh', 'karan@gmail.com', 'Amritsar'),
(7, 'Ananya', 'Kaur', 'ananya@gmail.com', 'Ludhiana'),
(8, 'Rohit', 'Kumar', 'rohit@gmail.com', 'Bangalore'),
(9, 'Mehak', 'Gupta', 'mehak@gmail.com', 'Chandigarh'),
(10, 'Arjun', 'Mehta', 'arjun@gmail.com', 'Jaipur');


-- Insert categories
INSERT INTO categories
(category_id, category_name, description)
VALUES
(5, 'Beauty', 'Beauty and personal care products'),
(6, 'Sports', 'Sports and fitness products'),
(7, 'Toys', 'Toys and games for children');


-- Insert products
INSERT INTO products
(product_id, product_name, price, stock_quantity, category_id, product_status)
VALUES
(106, 'Face Wash', 349.00, 60, 5, 'Available'),
(107, 'Running Shoes', 1999.00, 40, 6, 'Available'),
(108, 'Yoga Mat', 899.00, 35, 6, 'Available'),
(109, 'Cricket Bat', 1499.00, 20, 6, 'Available'),
(110, 'Wireless Earbuds', 1799.00, 45, 1, 'Available'),
(111, 'Hoodie', 1299.00, 70, 2, 'Available'),
(112, 'Novel Book', 499.00, 30, 3, 'Available'),
(113, 'Water Bottle', 599.00, 80, 4, 'Available'),
(114, 'Board Game', 799.00, 25, 7, 'Available'),
(115, 'Table Lamp', 999.00, 15, 4, 'Available');


-- Display customers
SELECT * FROM customers;

-- Display categories
SELECT * FROM categories;

-- Display products
SELECT * FROM products;