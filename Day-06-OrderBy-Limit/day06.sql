USE shopsphere;

-- ============================================
-- DAY 6: ORDER BY + LIMIT
-- ============================================

-- 1. Display all products sorted by price
--    from lowest to highest
SELECT product_name, price
FROM products
ORDER BY price ASC;


-- 2. Display all products sorted by price
--    from highest to lowest
SELECT product_name, price
FROM products
ORDER BY price DESC;


-- 3. Display products sorted by stock
--    lowest stock first
SELECT product_name, stock_quantity
FROM products
ORDER BY stock_quantity ASC;


-- 4. Display products sorted by stock
--    highest stock first
SELECT product_name, stock_quantity
FROM products
ORDER BY stock_quantity DESC;


-- 5. Display customers alphabetically
SELECT first_name, last_name, city
FROM customers
ORDER BY first_name ASC;


-- 6. Display customers in reverse alphabetical order
SELECT first_name, last_name, city
FROM customers
ORDER BY first_name DESC;


-- 7. Display the 5 most expensive products
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 5;


-- 8. Display the 5 cheapest products
SELECT product_name, price
FROM products
ORDER BY price ASC
LIMIT 5;


-- 9. Display the 3 products with the highest stock
SELECT product_name, stock_quantity
FROM products
ORDER BY stock_quantity DESC
LIMIT 3;


-- 10. Display the 3 products with the lowest stock
SELECT product_name, stock_quantity
FROM products
ORDER BY stock_quantity ASC
LIMIT 3;


-- 11. Find the most expensive product
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 1;


-- 12. Find the cheapest product
SELECT product_name, price
FROM products
ORDER BY price ASC
LIMIT 1;


-- 13. Display available products from
--     highest price to lowest price
SELECT product_name, price, product_status
FROM products
WHERE product_status = 'Available'
ORDER BY price DESC;


-- 14. Display products costing more than 700,
--     sorted from highest to lowest
SELECT product_name, price
FROM products
WHERE price > 700
ORDER BY price DESC;


-- 15. Display products with stock greater than 20,
--     sorted by stock
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity > 20
ORDER BY stock_quantity DESC;


-- 16. Display the 5 most expensive products
--     having stock greater than 20
SELECT product_name, price, stock_quantity
FROM products
WHERE stock_quantity > 20
ORDER BY price DESC
LIMIT 5;


-- 17. Display customers from Delhi or Mumbai,
--     sorted alphabetically
SELECT first_name, last_name, city
FROM customers
WHERE city = 'Delhi'
   OR city = 'Mumbai'
ORDER BY first_name ASC;


-- 18. Display products from category 6
--     from highest price to lowest price
SELECT product_name, price, category_id
FROM products
WHERE category_id = 6
ORDER BY price DESC;


-- 19. Display the top 3 most expensive
--     products from category 1
SELECT product_name, price, category_id
FROM products
WHERE category_id = 1
ORDER BY price DESC
LIMIT 3;


-- 20. Display the top 10 products by stock
SELECT product_name, stock_quantity
FROM products
ORDER BY stock_quantity DESC
LIMIT 10;