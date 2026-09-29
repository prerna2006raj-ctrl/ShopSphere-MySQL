USE shopsphere;

-- ============================================
-- DAY 12: CASE + SQL FUNCTIONS
-- ============================================


-- 1. Classify products by price
SELECT
    product_name,
    price,
    CASE
        WHEN price < 500 THEN 'Budget'
        WHEN price <= 1500 THEN 'Mid Range'
        ELSE 'Premium'
    END AS price_category
FROM products;


-- 2. Classify products by stock
SELECT
    product_name,
    stock_quantity,
    CASE
        WHEN stock_quantity = 0 THEN 'Out of Stock'
        WHEN stock_quantity <= 10 THEN 'Low Stock'
        WHEN stock_quantity <= 50 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS stock_status
FROM products;


-- 3. Price classification with category
SELECT
    p.product_name,
    c.category_name,
    p.price,
    CASE
        WHEN p.price < 500 THEN 'Budget'
        WHEN p.price <= 1500 THEN 'Mid Range'
        ELSE 'Premium'
    END AS price_category
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id;


-- 4. Multiple conditions using CASE
SELECT
    product_name,
    price,
    stock_quantity,
    CASE
        WHEN price > 2000 AND stock_quantity < 10
            THEN 'Expensive - Low Stock'
        WHEN price > 2000 AND stock_quantity >= 10
            THEN 'Expensive - Available'
        WHEN price <= 2000 AND stock_quantity < 10
            THEN 'Affordable - Low Stock'
        ELSE 'Affordable - Available'
    END AS product_status
FROM products;


-- 5. IF() for price
SELECT
    product_name,
    price,
    IF(price > 1000, 'Expensive', 'Affordable') AS price_type
FROM products;


-- 6. IF() for stock
SELECT
    product_name,
    stock_quantity,
    IF(stock_quantity > 0, 'In Stock', 'Out of Stock') AS availability
FROM products;


-- 7. IFNULL()
SELECT
    product_name,
    IFNULL(product_status, 'Unknown') AS status
FROM products;


-- 8. UPPER()
SELECT
    product_name,
    UPPER(product_name) AS uppercase_name
FROM products;


-- 9. LOWER()
SELECT
    product_name,
    LOWER(product_name) AS lowercase_name
FROM products;


-- 10. CONCAT()
SELECT
    CONCAT(product_name, ' - ₹', price) AS product_details
FROM products;


-- 11. CONCAT() with category
SELECT
    CONCAT(
        p.product_name,
        ' | ',
        c.category_name
    ) AS product_category
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id;


-- 12. LENGTH()
SELECT
    product_name,
    LENGTH(product_name) AS name_length
FROM products;


-- 13. ROUND()
SELECT
    product_name,
    price,
    ROUND(price, 0) AS rounded_price
FROM products;


-- 14. CEIL()
SELECT
    product_name,
    price,
    CEIL(price) AS ceiling_price
FROM products;


-- 15. FLOOR()
SELECT
    product_name,
    price,
    FLOOR(price) AS floor_price
FROM products;


-- 16. Calculate 10% discounted price
SELECT
    product_name,
    price,
    ROUND(price * 0.90, 2) AS discounted_price
FROM products;


-- 17. Different discounts using CASE
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 2000 THEN 15
        WHEN price >= 1000 THEN 10
        ELSE 5
    END AS discount_percent
FROM products;


-- 18. Calculate final price
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 2000 THEN
            ROUND(price * 0.85, 2)
        WHEN price >= 1000 THEN
            ROUND(price * 0.90, 2)
        ELSE
            ROUND(price * 0.95, 2)
    END AS final_price
FROM products;


-- 19. Current date
SELECT CURDATE();


-- 20. Current date and time
SELECT NOW();


-- 21. Current year
SELECT YEAR(CURDATE());


-- 22. Count products by price category
SELECT
    CASE
        WHEN price < 500 THEN 'Budget'
        WHEN price <= 1500 THEN 'Mid Range'
        ELSE 'Premium'
    END AS price_category,
    COUNT(*) AS total_products
FROM products
GROUP BY
    CASE
        WHEN price < 500 THEN 'Budget'
        WHEN price <= 1500 THEN 'Mid Range'
        ELSE 'Premium'
    END;


-- 23. Category classification by average price
SELECT
    c.category_name,
    CASE
        WHEN AVG(p.price) < 500 THEN 'Budget Category'
        WHEN AVG(p.price) <= 1500 THEN 'Mid-Range Category'
        ELSE 'Premium Category'
    END AS category_type,
    ROUND(AVG(p.price), 2) AS average_price
FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name;


-- 24. Complete product analysis
SELECT
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity,

    CASE
        WHEN p.price < 500 THEN 'Budget'
        WHEN p.price <= 1500 THEN 'Mid Range'
        ELSE 'Premium'
    END AS price_category,

    CASE
        WHEN p.stock_quantity = 0 THEN 'Out of Stock'
        WHEN p.stock_quantity <= 10 THEN 'Low Stock'
        WHEN p.stock_quantity <= 50 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS stock_status

FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
ORDER BY p.price DESC;


-- 25. Complete category analysis
SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products,
    SUM(p.stock_quantity) AS total_stock,
    ROUND(AVG(p.price), 2) AS average_price,

    CASE
        WHEN AVG(p.price) < 500 THEN 'Budget Category'
        WHEN AVG(p.price) <= 1500 THEN 'Mid-Range Category'
        ELSE 'Premium Category'
    END AS category_type

FROM categories c
INNER JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY average_price DESC;