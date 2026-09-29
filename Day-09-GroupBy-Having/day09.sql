USE shopsphere;

-- ============================================
-- DAY 9: GROUP BY + HAVING
-- ============================================


-- ============================================
-- GROUP BY
-- ============================================

-- 1. Count products in each category
SELECT
    category_id,
    COUNT(*) AS total_products
FROM products
GROUP BY category_id;


-- 2. Calculate total stock in each category
SELECT
    category_id,
    SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category_id;


-- 3. Calculate average price in each category
SELECT
    category_id,
    AVG(price) AS average_price
FROM products
GROUP BY category_id;


-- 4. Find minimum price in each category
SELECT
    category_id,
    MIN(price) AS minimum_price
FROM products
GROUP BY category_id;


-- 5. Find maximum price in each category
SELECT
    category_id,
    MAX(price) AS maximum_price
FROM products
GROUP BY category_id;


-- ============================================
-- ROUND() WITH GROUP BY
-- ============================================

-- 6. Average price per category rounded to 2 decimals
SELECT
    category_id,
    ROUND(AVG(price), 2) AS average_price
FROM products
GROUP BY category_id;


-- ============================================
-- MULTIPLE AGGREGATE FUNCTIONS
-- ============================================

-- 7. Complete statistics for each category
SELECT
    category_id,
    COUNT(*) AS total_products,
    SUM(stock_quantity) AS total_stock,
    ROUND(AVG(price), 2) AS average_price,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM products
GROUP BY category_id;


-- ============================================
-- ORDER BY WITH GROUP BY
-- ============================================

-- 8. Categories with highest total stock first
SELECT
    category_id,
    SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category_id
ORDER BY total_stock DESC;


-- 9. Categories with highest average price first
SELECT
    category_id,
    ROUND(AVG(price), 2) AS average_price
FROM products
GROUP BY category_id
ORDER BY average_price DESC;


-- 10. Categories with most products first
SELECT
    category_id,
    COUNT(*) AS total_products
FROM products
GROUP BY category_id
ORDER BY total_products DESC;


-- ============================================
-- HAVING
-- ============================================

-- 11. Categories having more than 2 products
SELECT
    category_id,
    COUNT(*) AS total_products
FROM products
GROUP BY category_id
HAVING COUNT(*) > 2;


-- 12. Categories having total stock greater than 100
SELECT
    category_id,
    SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category_id
HAVING SUM(stock_quantity) > 100;


-- 13. Categories having average price greater than 1000
SELECT
    category_id,
    ROUND(AVG(price), 2) AS average_price
FROM products
GROUP BY category_id
HAVING AVG(price) > 1000;


-- 14. Categories having maximum price greater than 2000
SELECT
    category_id,
    MAX(price) AS maximum_price
FROM products
GROUP BY category_id
HAVING MAX(price) > 2000;


-- ============================================
-- WHERE + GROUP BY
-- ============================================

-- 15. Count products costing more than 500
--     in each category
SELECT
    category_id,
    COUNT(*) AS products_above_500
FROM products
WHERE price > 500
GROUP BY category_id;


-- 16. Total stock of available products
--     in each category
SELECT
    category_id,
    SUM(stock_quantity) AS available_stock
FROM products
WHERE product_status = 'Available'
GROUP BY category_id;


-- 17. Average price of products costing
--     more than 500 in each category
SELECT
    category_id,
    ROUND(AVG(price), 2) AS average_price
FROM products
WHERE price > 500
GROUP BY category_id;


-- ============================================
-- WHERE + GROUP BY + HAVING
-- ============================================

-- 18. Categories having more than 1 product
--     costing above 500
SELECT
    category_id,
    COUNT(*) AS products_above_500
FROM products
WHERE price > 500
GROUP BY category_id
HAVING COUNT(*) > 1;


-- 19. Categories whose available stock
--     is greater than 50
SELECT
    category_id,
    SUM(stock_quantity) AS total_stock
FROM products
WHERE product_status = 'Available'
GROUP BY category_id
HAVING SUM(stock_quantity) > 50;


-- 20. Top categories by total stock
SELECT
    category_id,
    SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category_id
ORDER BY total_stock DESC
LIMIT 3;