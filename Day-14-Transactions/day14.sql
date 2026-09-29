USE shopsphere;

-- ============================================
-- DAY 14: TRANSACTIONS
-- ============================================


-- ============================================
-- PART 1: CHECK TABLE STRUCTURES
-- ============================================

DESCRIBE customers;

DESCRIBE products;

DESCRIBE orders;

DESCRIBE order_items;


-- ============================================
-- PART 2: CHECK AUTOCOMMIT
-- ============================================

SELECT @@autocommit;


-- ============================================
-- PART 3: ROLLBACK PRACTICE
-- ============================================

SELECT
    product_id,
    product_name,
    stock_quantity
FROM products
WHERE product_id = 1;


START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;

SELECT
    product_id,
    product_name,
    stock_quantity
FROM products
WHERE product_id = 1;

ROLLBACK;


SELECT
    product_id,
    product_name,
    stock_quantity
FROM products
WHERE product_id = 1;


-- ============================================
-- PART 4: COMMIT PRACTICE
-- ============================================

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;

COMMIT;


SELECT
    product_id,
    product_name,
    stock_quantity
FROM products
WHERE product_id = 1;


-- ============================================
-- PART 5: MULTIPLE UPDATES
-- ============================================

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;

UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 2;

COMMIT;


-- ============================================
-- PART 6: SAVEPOINT
-- ============================================

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;

SAVEPOINT product_one_update;

UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 2;

ROLLBACK TO SAVEPOINT product_one_update;

COMMIT;


-- ============================================
-- PART 7: MULTIPLE SAVEPOINTS
-- ============================================

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;

SAVEPOINT first_product;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 2;

SAVEPOINT second_product;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 3;

ROLLBACK TO SAVEPOINT second_product;

COMMIT;


-- ============================================
-- PART 8: RELEASE SAVEPOINT
-- ============================================

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;

SAVEPOINT product_update;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 2;

RELEASE SAVEPOINT product_update;

COMMIT;


-- ============================================
-- PART 9: STOCK VALIDATION
-- ============================================

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1
  AND stock_quantity > 0;

COMMIT;


-- ============================================
-- PART 10: AUTOCOMMIT
-- ============================================

SELECT @@autocommit;

SET autocommit = 0;

SELECT @@autocommit;

COMMIT;

SET autocommit = 1;

SELECT @@autocommit;


-- ============================================
-- PART 11: E-COMMERCE TRANSACTION EXAMPLE
-- ============================================

-- Check your actual orders and order_items
-- columns with DESCRIBE before using this section.

-- Example structure:

/*
START TRANSACTION;

INSERT INTO orders
(customer_id, order_date)
VALUES
(1, NOW());

INSERT INTO order_items
(order_id, product_id, quantity)
VALUES
(LAST_INSERT_ID(), 1, 2);

UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 1
  AND stock_quantity >= 2;

COMMIT;
*/


-- ============================================
-- PART 12: FINAL STOCK CHECK
-- ============================================

SELECT
    product_id,
    product_name,
    stock_quantity
FROM products
ORDER BY product_id;