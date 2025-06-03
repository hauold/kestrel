--Order of operation
--1. FROM
--2. JOIN
--3. WHERE
--4. GROUP BY
--5. HAVING
--6. SELECT
--7. DISTINCT
--8. ORDER BY

SELECT first_name || ' ' || last_name name, email, 'contact' contact_type
FROM contacts
UNION
SELECT first_name || ' ' || last_name name, email, 'employee' contact_type
FROM employees
ORDER BY name DESC;

SELECT last_name
FROM contacts
INTERSECT
SELECT last_name
FROM employees
ORDER BY last_name;

SELECT last_name
FROM contacts
MINUS
SELECT last_name
FROM employees
ORDER BY last_name;

SELECT product_id
FROM products
MINUS
SELECT product_id
FROM inventories;