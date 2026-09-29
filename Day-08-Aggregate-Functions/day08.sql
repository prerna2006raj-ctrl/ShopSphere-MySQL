USE shopsphere;

-- ============================================
-- DAY 8: AGGREGATE FUNCTIONS
-- ============================================

-- ============================================
-- COUNT()
-- ============================================

-- 1. Count all customers
SELECT COUNT(*) AS total_customers
FROM customers;


-- 2. Count all products
SELECT COUNT(*) AS total_products
FROM products;


-- 3. Count all categories
SELECT COUNT(*) AS total_categories
FROM categories;


-- 4. Count available products
SELECT COUNT(*) AS available_products
FROM products
WHERE product_status = 'Available';


-- 5. Count products with stock greater than 50
SELECT COUNT(*) AS products_with_high_stock
FROM products
WHERE stock_quantity > 50;


-- ============================================
-- SUM()
-- ============================================

-- 6. Calculate total inventory quantity
SELECT SUM(stock_quantity) AS total_inventory
FROM products;


-- 7. Calculate total stock of category 1
SELECT SUM(stock_quantity) AS category_1_stock
FROM products
WHERE category_id = 1;


-- 8. Calculate total stock of category 6
SELECT SUM(stock_quantity) AS category_6_stock
FROM products
WHERE category_id = 6;


-- ============================================
-- AVG()
-- ============================================

-- 9. Calculate average product price
SELECT AVG(price) AS average_price
FROM products;


-- 10. Calculate average stock
SELECT AVG(stock_quantity) AS average_stock
FROM products;


-- 11. Calculate average price of products
--     costing more than ₹500
SELECT AVG(price) AS average_price_above_500
FROM products
WHERE price > 500;


-- ============================================
-- MIN()
-- ============================================

-- 12. Find the cheapest product price
SELECT MIN(price) AS minimum_price
FROM products;


-- 13. Find the minimum stock
SELECT MIN(stock_quantity) AS minimum_stock
FROM products;


-- ============================================
-- MAX()
-- ============================================

-- 14. Find the most expensive product price
SELECT MAX(price) AS maximum_price
FROM products;


-- 15. Find the maximum stock
SELECT MAX(stock_quantity) AS maximum_stock
FROM products;


-- ============================================
-- COMBINING AGGREGATE FUNCTIONS
-- ============================================

-- 16. Product statistics
SELECT
    COUNT(*) AS total_products,
    SUM(stock_quantity) AS total_stock,
    AVG(price) AS average_price,
    MIN(price) AS cheapest_price,
    MAX(price) AS highest_price
FROM products;


-- 17. Statistics for category 1
SELECT
    COUNT(*) AS total_products,
    SUM(stock_quantity) AS total_stock,
    AVG(price) AS average_price,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM products
WHERE category_id = 1;


-- 18. Statistics for category 6
SELECT
    COUNT(*) AS total_products,
    SUM(stock_quantity) AS total_stock,
    AVG(price) AS average_price,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM products
WHERE category_id = 6;


-- ============================================
-- ROUND()
-- ============================================

-- 19. Average price rounded to 2 decimals
SELECT
    ROUND(AVG(price), 2) AS average_price
FROM products;


-- 20. Average stock rounded to 2 decimals
SELECT
    ROUND(AVG(stock_quantity), 2) AS average_stock
FROM products;