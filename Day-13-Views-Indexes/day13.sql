USE shopsphere;

-- ============================================
-- DAY 13: VIEWS + INDEXES + EXPLAIN
-- ============================================


-- ============================================
-- PART 1: VIEWS
-- ============================================


-- 1. Create product details view
CREATE OR REPLACE VIEW product_details AS
SELECT
    p.product_id,
    p.product_name,
    p.price,
    p.stock_quantity,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id;


-- 2. View all product details
SELECT *
FROM product_details;


-- 3. Products above ₹1000
SELECT
    product_name,
    price,
    category_name
FROM product_details
WHERE price > 1000;


-- 4. Products sorted by price
SELECT *
FROM product_details
ORDER BY price DESC;


-- ============================================
-- CATEGORY SUMMARY VIEW
-- ============================================


-- 5. Create category summary
CREATE OR REPLACE VIEW category_summary AS
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
GROUP BY c.category_name;


-- 6. View category summary
SELECT *
FROM category_summary;


-- 7. Categories sorted by stock
SELECT *
FROM category_summary
ORDER BY total_stock DESC;


-- 8. Categories with average price above ₹1000
SELECT *
FROM category_summary
WHERE average_price > 1000;


-- ============================================
-- STOCK REPORT VIEW
-- ============================================


-- 9. Create stock report
CREATE OR REPLACE VIEW stock_report AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.stock_quantity,
    CASE
        WHEN p.stock_quantity = 0 THEN 'Out of Stock'
        WHEN p.stock_quantity <= 10 THEN 'Low Stock'
        WHEN p.stock_quantity <= 50 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS stock_status
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id;


-- 10. View stock report
SELECT *
FROM stock_report;


-- 11. Find low-stock products
SELECT *
FROM stock_report
WHERE stock_status = 'Low Stock';


-- ============================================
-- VIEW INFORMATION
-- ============================================


-- 12. Show all views
SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';


-- 13. Show view definition
SHOW CREATE VIEW product_details;


-- ============================================
-- INDEXES
-- ============================================


-- 14. Show existing indexes
SHOW INDEX FROM products;


-- 15. Create price index
CREATE INDEX idx_product_price
ON products(price);


-- 16. Create category index
CREATE INDEX idx_product_category
ON products(category_id);


-- 17. Create status index
CREATE INDEX idx_product_status
ON products(product_status);


-- 18. Show indexes after creation
SHOW INDEX FROM products;


-- ============================================
-- TEST INDEXED QUERIES
-- ============================================


-- 19. Search by price
SELECT *
FROM products
WHERE price > 1000;


-- 20. Search by category
SELECT *
FROM products
WHERE category_id = 1;


-- 21. Search by product status
SELECT *
FROM products
WHERE product_status = 'Available';


-- ============================================
-- EXPLAIN
-- ============================================


-- 22. Explain price search
EXPLAIN
SELECT *
FROM products
WHERE price > 1000;


-- 23. Explain category search
EXPLAIN
SELECT *
FROM products
WHERE category_id = 1;


-- 24. Explain JOIN
EXPLAIN
SELECT
    p.product_name,
    c.category_name
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id;


-- 25. Explain sorting
EXPLAIN
SELECT
    product_name,
    price
FROM products
ORDER BY price DESC;


-- ============================================
-- REMOVE ONE INDEX FOR PRACTICE
-- ============================================

-- 26. Remove status index
DROP INDEX idx_product_status
ON products;


-- Check remaining indexes
SHOW INDEX FROM products;