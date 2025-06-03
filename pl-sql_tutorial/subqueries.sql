--Order of operation
--1. FROM
--2. JOIN
--3. WHERE
--4. GROUP BY
--5. HAVING
--6. SELECT
--7. DISTINCT
--8. ORDER BY

SELECT MAX(list_price)
FROM products;

SELECT product_id, product_name, list_price
FROM products
WHERE list_price = 8867.99;

--Using subquery
SELECT
    product_id,
    product_name,
    list_price
FROM
    products
WHERE
    list_price = (
       SELECT MAX(list_price)
       FROM products
  );

--Inline view
SELECT
    order_id,
    order_value
FROM
  (
    SELECT
        order_id,
        SUM(quantity * unit_price) order_value
    FROM
        order_items
    GROUP BY
        order_id
    ORDER BY
        order_value DESC
  );

--Subqueries with operators
SELECT
  product_id,
  product_name,
  list_price
FROM
  products
WHERE
  list_price > (
    SELECT
      AVG(list_price)
    FROM
      products
  )
ORDER BY
  product_name;

SELECT
  employee_id,
  first_name,
  last_name
FROM
  employees
WHERE
  employee_id IN (
    SELECT
      salesman_id
    FROM
      orders
      INNER JOIN order_items USING (order_id)
    WHERE
      status = 'Shipped'
    GROUP BY
      salesman_id,
      EXTRACT(
        YEAR
        FROM
          order_date
      )
    HAVING
      SUM(quantity * unit_price) >= 1000000
      AND EXTRACT(
        YEAR
        FROM
          order_date
      ) = 2017
      AND salesman_id IS NOT NULL
  )
ORDER BY
  first_name,
  last_name;
