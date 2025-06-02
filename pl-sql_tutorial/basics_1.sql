--Order of operation
--1. FROM
--2. SELECT
--3. ORDER BY

--SELECT

SELECT * FROM customers;

SELECT name, credit_limit FROM customers;

SELECT name customer_name, credit_limit FROM customers;

-- 'AS' keyword for alias is optional
SELECT name AS customer_name, credit_limit FROM customers;

-- Using expressions
SELECT name, credit_limit, credit_limit * 1.1 new_credit_limit FROM customers;

--ORDER BY
SELECT customer_id, name, credit_limit FROM customers
ORDER BY customer_id DESC;

--Using alias
SELECT customer_id, name full_name, credit_limit FROM customers
ORDER BY full_name ASC;

SELECT customer_id, first_name, last_name FROM contacts
ORDER BY first_name DESC, last_name ASC;

SELECT customer_id, first_name, last_name FROM contacts
ORDER BY 2 ASC, 3 DESC;

SELECT location_id, city, state FROM locations
ORDER BY state ASC NULLS FIRST;

SELECT location_id, city, state FROM locations
ORDER BY state ASC NULLS LAST;

--Using expressions such as string or math functions in ORDER BY clause
SELECT name, credit_limit FROM customers
ORDER by credit_limit * 1.1 DESC;

--DISTINCT
SELECT DISTINCT first_name FROM contacts
ORDER BY first_name;

SELECT DISTINCT product_id, quantity FROM order_items
ORDER BY product_id;

/* Note that if you want to apply the DISTINCT to some columns,
   while skipping other columns, you should use the GROUP BY clause instead. */