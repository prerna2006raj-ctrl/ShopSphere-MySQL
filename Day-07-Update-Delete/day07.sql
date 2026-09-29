USE shopsphere;

-- ============================================
-- DAY 7: UPDATE + DELETE
-- ============================================

-- Create backup for practice
CREATE TABLE products_day07_backup AS
SELECT *
FROM products;

-- ============================================
-- UPDATE
-- ============================================

-- Update product price
SELECT product_id, product_name, price
FROM products
WHERE product_id = 101;

UPDATE products
SET price = 649.00
WHERE product_id = 101;

SELECT product_id, product_name, price
FROM products
WHERE product_id = 101;


-- Update multiple columns
UPDATE products
SET price = 2299.00,
    stock_quantity = 35
WHERE product_id = 102;

SELECT *
FROM products
WHERE product_id = 102;


-- Increase prices of category 6 products
UPDATE products
SET price = price + 100
WHERE category_id = 6;

SELECT product_name, price, category_id
FROM products
WHERE category_id = 6;


-- Reduce stock
UPDATE products
SET stock_quantity = stock_quantity - 5
WHERE product_id = 108;

SELECT product_name, stock_quantity
FROM products
WHERE product_id = 108;


-- Update product status
UPDATE products
SET product_status = 'Out of Stock'
WHERE product_id = 109;

SELECT product_name, product_status
FROM products
WHERE product_id = 109;


-- Update customer city
UPDATE customers
SET city = 'Pune'
WHERE customer_id = 4;

SELECT *
FROM customers
WHERE customer_id = 4;


-- ============================================
-- DELETE
-- ============================================

-- Check product before deleting
SELECT *
FROM products
WHERE product_id = 115;

-- Delete product
DELETE FROM products
WHERE product_id = 115;

-- Verify deletion
SELECT *
FROM products
WHERE product_id = 115;


-- ============================================
-- RESTORE ORIGINAL DATA
-- ============================================

DELETE FROM products;

INSERT INTO products
SELECT *
FROM products_day07_backup;

SELECT *
FROM products;

-- Remove backup table
DROP TABLE products_day07_backup;