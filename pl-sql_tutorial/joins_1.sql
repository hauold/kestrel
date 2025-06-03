--Order of operation
--1. FROM
--2. JOIN
--3. WHERE
--4. SELECT
--5. ORDER BY

SELECT
    a.CUSTOMER_ID,
    a.NAME,
    a.ADDRESS,
    b.CONTACT_ID,
    b.FIRST_NAME,
    b.LAST_NAME
FROM
    customers a
FULL OUTER JOIN
    contacts b ON a.customer_id = b.customer_id
--WHERE a.customer_id IS NULL OR b.contact_id IS NULL;

SELECT DISTINCT country_name FROM countries
WHERE country_name LIKE '%a';

SELECT *
FROM orders
INNER JOIN order_items ON order_items.order_id = orders.order_id
ORDER BY order_date DESC;

SELECT *
FROM orders
INNER JOIN order_items USING (order_id)
ORDER BY order_date DESC;

SELECT
    name customer_name,
    order_id,
    order_date,
    item_id,
    quantity,
    unit_price
FROM
    orders
    INNER JOIN order_items USING (order_id)
    INNER JOIN customers USING (customer_id)
ORDER BY
    order_date DESC,
    order_id DESC,
    item_id ASC;

SELECT order_id, status, first_name, last_name
FROM orders LEFT JOIN employees ON employees.employee_id = orders.salesman_id
WHERE first_name IS NULL
ORDER BY order_date DESC;

SELECT
  order_id,
  name AS customer_name,
  status,
  first_name,
  last_name
FROM
  orders
  LEFT JOIN employees ON employee_id = salesman_id
  LEFT JOIN customers ON customers.customer_id = orders.customer_id
ORDER BY
  order_date DESC;

SELECT
    first_name,
    last_name,
    order_id,
    status
FROM
    orders
    RIGHT JOIN employees ON employees.employee_id = orders.salesman_id
WHERE
    status IS NULL
ORDER BY
    first_name,
    last_name;