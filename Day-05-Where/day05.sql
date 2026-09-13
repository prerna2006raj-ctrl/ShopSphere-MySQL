USE shopsphere;

-- ============================================
-- DAY 5: WHERE FILTERING
-- ============================================

-- 1. Customers from Delhi
SELECT *
FROM customers
WHERE city = 'Delhi';


-- 2. Customers not from Delhi
SELECT *
FROM customers
WHERE city <> 'Delhi';


-- 3. Products costing more than 1000
SELECT product_name, price
FROM products
WHERE price > 1000;


-- 4. Products costing less than 1000
SELECT product_name, price
FROM products
WHERE price < 1000;


-- 5. Products costing 1000 or more
SELECT product_name, price
FROM products
WHERE price >= 1000;


-- 6. Products costing 1000 or less
SELECT product_name, price
FROM products
WHERE price <= 1000;


-- 7. Products with exactly 599 price
SELECT product_name, price
FROM products
WHERE price = 599;


-- 8. Products between 500 and 1500
SELECT product_name, price
FROM products
WHERE price BETWEEN 500 AND 1500;


-- 9. Products outside the 500–1500 range
SELECT product_name, price
FROM products
WHERE price NOT BETWEEN 500 AND 1500;


-- 10. Products belonging to Electronics category
SELECT product_name, price, category_id
FROM products
WHERE category_id = 1;


-- 11. Products with stock greater than 50
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity > 50;


-- 12. Products with stock less than or equal to 30
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity <= 30;


-- 13. Available products
SELECT product_name, product_status
FROM products
WHERE product_status = 'Available';


-- 14. Products whose name starts with W
SELECT product_name, price
FROM products
WHERE product_name LIKE 'W%';


-- 15. Products whose name contains "Book"
SELECT product_name, price
FROM products
WHERE product_name LIKE '%Book%';


-- 16. Customers whose first name starts with A
SELECT first_name, last_name
FROM customers
WHERE first_name LIKE 'A%';


-- 17. Customers from Delhi OR Mumbai
SELECT first_name, last_name, city
FROM customers
WHERE city = 'Delhi'
   OR city = 'Mumbai';


-- 18. Products costing more than 1000 AND stock greater than 20
SELECT product_name, price, stock_quantity
FROM products
WHERE price > 1000
  AND stock_quantity > 20;


-- 19. Products from category 1 OR category 2
SELECT product_name, category_id
FROM products
WHERE category_id = 1
   OR category_id = 2;


-- 20. Products from category 1 with price greater than 1000
SELECT product_name, price, category_id
FROM products
WHERE category_id = 1
  AND price > 1000;