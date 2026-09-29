USE shopsphere;

-- ============================================
-- DAY 11: SUBQUERIES
-- ============================================


-- 1. Products more expensive than average
SELECT
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);


-- 2. Products cheaper than average
SELECT
    product_name,
    price
FROM products
WHERE price < (
    SELECT AVG(price)
    FROM products
);


-- 3. Most expensive product
SELECT
    product_name,
    price
FROM products
WHERE price = (
    SELECT MAX(price)
    FROM products
);


-- 4. Cheapest product
SELECT
    product_name,
    price
FROM products
WHERE price = (
    SELECT MIN(price)
    FROM products
);


-- 5. Products with above-average stock
SELECT
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity > (
    SELECT AVG(stock_quantity)
    FROM products
);


-- 6. Products with below-average stock
SELECT
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity < (
    SELECT AVG(stock_quantity)
    FROM products
);


-- 7. Categories containing products above ₹2000
SELECT
    category_name
FROM categories
WHERE category_id IN (
    SELECT category_id
    FROM products
    WHERE price > 2000
);


-- 8. Products belonging to categories
--    containing products above ₹2000
SELECT
    product_name,
    price,
    category_id
FROM products
WHERE category_id IN (
    SELECT category_id
    FROM products
    WHERE price > 2000
);


-- 9. Categories without products above ₹2000
SELECT
    category_id,
    category_name
FROM categories
WHERE category_id NOT IN (
    SELECT category_id
    FROM products
    WHERE price > 2000
);


-- 10. Categories with at least one product
SELECT
    c.category_id,
    c.category_name
FROM categories c
WHERE EXISTS (
    SELECT 1
    FROM products p
    WHERE p.category_id = c.category_id
);


-- 11. Categories without products
SELECT
    c.category_id,
    c.category_name
FROM categories c
WHERE NOT EXISTS (
    SELECT 1
    FROM products p
    WHERE p.category_id = c.category_id
);


-- 12. Products above average price
--     with category names
SELECT
    p.product_name,
    p.price,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
WHERE p.price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY p.price DESC;


-- 13. Products with the maximum price
--     with category name
SELECT
    p.product_name,
    p.price,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
WHERE p.price = (
    SELECT MAX(price)
    FROM products
);


-- 14. Products with minimum price
--     with category name
SELECT
    p.product_name,
    p.price,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
WHERE p.price = (
    SELECT MIN(price)
    FROM products
);


-- 15. Products with above-average stock
--     and their category names
SELECT
    p.product_name,
    p.stock_quantity,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
WHERE p.stock_quantity > (
    SELECT AVG(stock_quantity)
    FROM products
)
ORDER BY p.stock_quantity DESC;


-- 16. Categories with average price above
--     the overall average product price
SELECT
    c.category_name,
    ROUND(AVG(p.price), 2) AS category_average
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
HAVING AVG(p.price) > (
    SELECT AVG(price)
    FROM products
);


-- 17. Products more expensive than
--     the cheapest product
SELECT
    product_name,
    price
FROM products
WHERE price > (
    SELECT MIN(price)
    FROM products
)
ORDER BY price;


-- 18. Products cheaper than
--     the most expensive product
SELECT
    product_name,
    price
FROM products
WHERE price < (
    SELECT MAX(price)
    FROM products
)
ORDER BY price DESC;


-- 19. Complete above-average product analysis
SELECT
    p.product_name,
    c.category_name,
    p.price,
    ROUND(
        (SELECT AVG(price) FROM products),
        2
    ) AS overall_average_price
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
WHERE p.price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY p.price DESC;


-- 20. Category statistics above overall average
SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products,
    ROUND(AVG(p.price), 2) AS average_price,
    SUM(p.stock_quantity) AS total_stock
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
HAVING AVG(p.price) > (
    SELECT AVG(price)
    FROM products
)
ORDER BY average_price DESC;