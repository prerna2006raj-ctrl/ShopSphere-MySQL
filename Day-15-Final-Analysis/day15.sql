USE shopsphere;

-- ============================================
-- SHOPSPHERE - FINAL E-COMMERCE ANALYSIS
-- DAY 15
-- ============================================


-- ============================================
-- 1. DATABASE OVERVIEW
-- ============================================

SHOW TABLES;

DESCRIBE customers;
DESCRIBE categories;
DESCRIBE products;
DESCRIBE orders;
DESCRIBE order_items;


-- ============================================
-- 2. PRODUCT ANALYSIS
-- ============================================

-- Most expensive products
SELECT
    product_name,
    price
FROM products
ORDER BY price DESC
LIMIT 5;


-- Cheapest products
SELECT
    product_name,
    price
FROM products
ORDER BY price ASC
LIMIT 5;


-- Products above average price
SELECT
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;


-- ============================================
-- 3. STOCK ANALYSIS
-- ============================================

-- Low stock
SELECT
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity <= 10
ORDER BY stock_quantity;


-- Total stock
SELECT
    SUM(stock_quantity) AS total_stock
FROM products;


-- Average stock
SELECT
    ROUND(AVG(stock_quantity), 2) AS average_stock
FROM products;


-- Stock classification
SELECT
    product_name,
    stock_quantity,
    CASE
        WHEN stock_quantity = 0 THEN 'Out of Stock'
        WHEN stock_quantity <= 10 THEN 'Low Stock'
        WHEN stock_quantity <= 50 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS stock_status
FROM products
ORDER BY stock_quantity;


-- ============================================
-- 4. CATEGORY ANALYSIS
-- ============================================

-- Products with categories
SELECT
    p.product_name,
    c.category_name,
    p.price
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id;


-- Products per category
SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM categories c
LEFT JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY total_products DESC;


-- Average price per category
SELECT
    c.category_name,
    ROUND(AVG(p.price), 2) AS average_price
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY average_price DESC;


-- ============================================
-- 5. CUSTOMER ANALYSIS
-- ============================================

-- Customers with orders
SELECT DISTINCT
    c.customer_id,
    c.customer_name
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;


-- Orders per customer
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_orders DESC;


-- ============================================
-- 6. ORDER ANALYSIS
-- ============================================

-- Orders with customer information
SELECT
    o.order_id,
    c.customer_name,
    o.order_date
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id;


-- ============================================
-- 7. PRODUCT SALES ANALYSIS
-- ============================================

-- Quantity sold per product
SELECT
    p.product_name,
    SUM(oi.quantity) AS quantity_sold
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY quantity_sold DESC;


-- Most ordered product
SELECT
    p.product_name,
    SUM(oi.quantity) AS quantity_sold
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY quantity_sold DESC
LIMIT 1;


-- ============================================
-- 8. REVENUE ANALYSIS
-- ============================================

-- Total revenue
SELECT
    ROUND(
        SUM(oi.quantity * p.price),
        2
    ) AS total_revenue
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id;


-- Revenue by product
SELECT
    p.product_name,
    SUM(oi.quantity) AS quantity_sold,
    ROUND(
        SUM(oi.quantity * p.price),
        2
    ) AS revenue
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY revenue DESC;


-- Revenue by category
SELECT
    c.category_name,
    SUM(oi.quantity) AS quantity_sold,
    ROUND(
        SUM(oi.quantity * p.price),
        2
    ) AS revenue
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
INNER JOIN categories c
    ON p.category_id = c.category_id
GROUP BY
    c.category_id,
    c.category_name
ORDER BY revenue DESC;


-- ============================================
-- 9. CUSTOMER SPENDING
-- ============================================

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(
        SUM(oi.quantity * p.price),
        2
    ) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spent DESC;


-- ============================================
-- 10. FINAL PRODUCT PERFORMANCE REPORT
-- ============================================

SELECT
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity,

    CASE
        WHEN p.stock_quantity = 0 THEN 'Out of Stock'
        WHEN p.stock_quantity <= 10 THEN 'Low Stock'
        WHEN p.stock_quantity <= 50 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS stock_status,

    COALESCE(
        SUM(oi.quantity),
        0
    ) AS quantity_sold,

    ROUND(
        COALESCE(
            SUM(oi.quantity * p.price),
            0
        ),
        2
    ) AS revenue

FROM products p

INNER JOIN categories c
    ON p.category_id = c.category_id

LEFT JOIN order_items oi
    ON p.product_id = oi.product_id

GROUP BY
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity

ORDER BY revenue DESC;


-- ============================================
-- 11. FINAL ANALYSIS VIEW
-- ============================================

CREATE OR REPLACE VIEW final_product_analysis AS

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity,

    CASE
        WHEN p.stock_quantity = 0 THEN 'Out of Stock'
        WHEN p.stock_quantity <= 10 THEN 'Low Stock'
        WHEN p.stock_quantity <= 50 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS stock_status,

    COALESCE(
        SUM(oi.quantity),
        0
    ) AS quantity_sold,

    ROUND(
        COALESCE(
            SUM(oi.quantity * p.price),
            0
        ),
        2
    ) AS revenue

FROM products p

INNER JOIN categories c
    ON p.category_id = c.category_id

LEFT JOIN order_items oi
    ON p.product_id = oi.product_id

GROUP BY
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity;


-- View final report
SELECT *
FROM final_product_analysis
ORDER BY revenue DESC;