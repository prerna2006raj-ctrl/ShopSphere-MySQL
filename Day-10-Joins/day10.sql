USE shopsphere;

-- ============================================
-- DAY 10: JOINs
-- ============================================


-- 1. Basic INNER JOIN
SELECT
    p.product_name,
    p.price,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id;


-- 2. Products from Electronics
SELECT
    p.product_name,
    p.price,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
WHERE c.category_name = 'Electronics';


-- 3. Products costing more than ₹1000
SELECT
    p.product_name,
    p.price,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
WHERE p.price > 1000;


-- 4. Products sorted by price
SELECT
    p.product_name,
    p.price,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
ORDER BY p.price DESC;


-- 5. Top 5 most expensive products
SELECT
    p.product_name,
    p.price,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
ORDER BY p.price DESC
LIMIT 5;


-- 6. Number of products per category
SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name;


-- 7. Average price per category
SELECT
    c.category_name,
    ROUND(AVG(p.price), 2) AS average_price
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name;


-- 8. Total stock per category
SELECT
    c.category_name,
    SUM(p.stock_quantity) AS total_stock
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY total_stock DESC;


-- 9. Minimum and maximum price per category
SELECT
    c.category_name,
    MIN(p.price) AS minimum_price,
    MAX(p.price) AS maximum_price
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name;


-- 10. Categories having more than 2 products
SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
HAVING COUNT(p.product_id) > 2;


-- 11. Categories with average price above ₹800
SELECT
    c.category_name,
    ROUND(AVG(p.price), 2) AS average_price
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
HAVING AVG(p.price) > 800;


-- 12. LEFT JOIN
SELECT
    c.category_name,
    p.product_name
FROM categories c
LEFT JOIN products p
    ON c.category_id = p.category_id;


-- 13. Categories without products
SELECT
    c.category_id,
    c.category_name
FROM categories c
LEFT JOIN products p
    ON c.category_id = p.category_id
WHERE p.product_id IS NULL;


-- 14. Products with their category and stock
SELECT
    p.product_name,
    c.category_name,
    p.stock_quantity
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
ORDER BY p.stock_quantity DESC;


-- 15. Products above ₹700 with category names
SELECT
    p.product_name,
    p.price,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
WHERE p.price > 700
ORDER BY p.price DESC;


-- 16. Available products by category
SELECT
    c.category_name,
    COUNT(p.product_id) AS available_products
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
WHERE p.product_status = 'Available'
GROUP BY c.category_name;


-- 17. Total available stock by category
SELECT
    c.category_name,
    SUM(p.stock_quantity) AS available_stock
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
WHERE p.product_status = 'Available'
GROUP BY c.category_name
ORDER BY available_stock DESC;


-- 18. Category with the highest total stock
SELECT
    c.category_name,
    SUM(p.stock_quantity) AS total_stock
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY total_stock DESC
LIMIT 1;


-- 19. Three categories with the highest average price
SELECT
    c.category_name,
    ROUND(AVG(p.price), 2) AS average_price
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY average_price DESC
LIMIT 3;


-- 20. Complete category analysis
SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products,
    SUM(p.stock_quantity) AS total_stock,
    ROUND(AVG(p.price), 2) AS average_price,
    MIN(p.price) AS minimum_price,
    MAX(p.price) AS maximum_price
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY total_stock DESC;