-- ShopSphere - Day 02
-- Tables, Data Types and Constraints
USE shopsphere;
SHOW TABLES;
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(200)
);
SHOW TABLES;
DESCRIBE categories;
INSERT INTO categories
(category_id, category_name, description)
VALUES
(1, 'Electronics', 'Electronic devices and accessories'),
(2, 'Clothing', 'Men and women clothing'),
(3, 'Books', 'Books and educational materials'),
(4, 'Home', 'Home and kitchen products');
SELECT * FROM categories;


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    category_id INT,
    product_status VARCHAR(20) DEFAULT 'Available',
    CHECK (price >= 0),
    CHECK (stock_quantity >= 0)
);
SHOW TABLES;
DESCRIBE products;
INSERT INTO products
(product_id, product_name, price, stock_quantity, category_id)
VALUES
(101, 'Wireless Mouse', 599.00, 50, 1),
(102, 'Mechanical Keyboard', 2499.00, 30, 1),
(103, 'Cotton T-Shirt', 799.00, 100, 2),
(104, 'SQL Programming Book', 699.00, 25, 3),
(105, 'Coffee Mug', 299.00, 75, 4);
SELECT * FROM products;


-- Display only product names and prices.
SELECT product_name, price FROM products;
-- Display products whose price is greater than 700.
SELECT * FROM products WHERE price > 700;
-- Display products having stock greater than 50.
SELECT * FROM products WHERE stock_quantity > 50;