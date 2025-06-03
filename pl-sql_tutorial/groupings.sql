--Order of operation
--1. FROM
--2. JOIN
--3. WHERE
--4. GROUP BY
--5. HAVING
--6. SELECT
--7. DISTINCT
--8. ORDER BY

SELECT status, COUNT(order_id)
FROM orders
GROUP BY status;

SELECT name, COUNT(order_id)
FROM orders
INNER JOIN customers USING (customer_id)
GROUP BY name
ORDER BY name;

SELECT
    order_id,
    SUM(quantity * unit_price) total
FROM
    order_items
GROUP BY
    order_id
HAVING
    SUM(quantity * unit_price) < 50000;

SELECT name, COUNT(order_id) total_orders
FROM orders
INNER JOIN customers USING (customer_id)
WHERE status = 'Shipped'
GROUP BY name
HAVING COUNT(order_id) > 2
ORDER BY name;

SELECT EXTRACT(year FROM order_date) order_year, COUNT(order_id) order_count
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY order_year;

CREATE OR REPLACE VIEW customer_category_sales
AS
SELECT e.category_name category, a.name customer, SUM(c.quantity * c.unit_price) total_price
FROM customers a
INNER JOIN orders b ON b.customer_id = a.customer_id
INNER JOIN order_items c ON c.order_id = b.order_id
INNER JOIN products d ON d.product_id = c.product_id
INNER JOIN product_categories e ON e.category_id = d.category_id
GROUP BY a.name, e.category_name;

SELECT
  category,
  customer,
  SUM(total_price)
FROM
  customer_category_sales
WHERE
    customer IN ('Plains GP Holdings', 'Raytheon')
GROUP BY
  CUBE (category, customer)
ORDER BY
  category NULLS LAST,
  customer NULLS LAST;

SELECT
    category,
    customer,
    SUM(total_price)
FROM
    customer_category_sales
WHERE customer IN ('Plains GP Holdings', 'Raytheon')
GROUP BY
    GROUPING SETS(
        (category, customer),
        (category),
        (customer)
    )
ORDER BY
  category NULLS LAST,
  customer NULLS LAST;

SELECT
    category,
    customer,
    sum(total_price) total_sales_amount
FROM
    customer_category_sales
WHERE customer IN ('Plains GP Holdings', 'Raytheon')
GROUP BY
    ROLLUP (category, customer)
ORDER BY
    category nulls last,
    customer nulls last;

SELECT
    category,
    customer,
    sum(total_price) total_sales_amount
FROM
    customer_category_sales
WHERE customer IN ('Plains GP Holdings', 'Raytheon')
GROUP BY
    customer,
    ROLLUP (category)
ORDER BY
    category nulls last,
    customer nulls last;