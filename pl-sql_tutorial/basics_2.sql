--Order of operation
--1. FROM
--2. WHERE
--3. SELECT
--4. ORDER BY

SELECT product_name, description, list_price, category_id
FROM products
WHERE product_name = 'Kingston';

SELECT product_name, list_price
FROM products
WHERE list_price > 500 AND category_id = 1;

SELECT product_name, list_price
FROM products
WHERE list_price BETWEEN 650 AND 680
ORDER BY list_price;

SELECT product_name, category_id
FROM products
WHERE category_id IN(1, 4)
ORDER BY product_name;

SELECT product_name, list_price
FROM products
WHERE product_name LIKE 'Asus%'
ORDER BY list_price;

SELECT order_id, customer_id, status, order_date
FROM orders
WHERE status = 'Pending' OR status = 'Canceled'
ORDER BY order_date DESC;

SELECT order_id, customer_id, status, salesman_id, order_date
FROM orders
WHERE (status = 'Canceled' OR status = 'Pending') AND customer_id = 44
ORDER BY order_date DESC;

SELECT *
FROM logs
WHERE created_at BETWEEN DATE '2024-01-01' AND DATE  '2024-01-31';

SELECT *
FROM logs
WHERE created_at >= DATE '2024-01-01' AND created_at < DATE '2024-02-01';

SELECT *
FROM orders
WHERE salesman_id IS NOT NULL
ORDER BY order_Date DESC;