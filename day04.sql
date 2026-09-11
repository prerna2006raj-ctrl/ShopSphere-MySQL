USE shopsphere;

-- ============================================
-- DAY 4: SELECT QUERIES
-- ============================================

-- 1. Display all customers
SELECT *
FROM customers;


-- 2. Display all categories
SELECT *
FROM categories;


-- 3. Display all products
SELECT *
FROM products;


-- 4. Display only customer names
SELECT first_name, last_name
FROM customers;


-- 5. Display customer name and city
SELECT first_name, last_name, city
FROM customers;


-- 6. Display product name and price
SELECT product_name, price
FROM products;


-- 7. Display product name, price and stock
SELECT product_name, price, stock_quantity
FROM products;


-- 8. Display all available products
SELECT *
FROM products
WHERE product_status = 'Available';


-- 9. Display products costing more than 1000
SELECT product_name, price
FROM products
WHERE price > 1000;


-- 10. Display products costing less than 1000
SELECT product_name, price
FROM products
WHERE price < 1000;


-- 11. Display products having stock greater than 50
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity > 50;


-- 12. Display customers from Delhi
SELECT *
FROM customers
WHERE city = 'Delhi';


-- 13. Display customers from Chandigarh
SELECT *
FROM customers
WHERE city = 'Chandigarh';


-- 14. Display products belonging to category 1
SELECT product_name, price, category_id
FROM products
WHERE category_id = 1;


-- 15. Display products with price between 500 and 1500
SELECT product_name, price
FROM products
WHERE price BETWEEN 500 AND 1500;