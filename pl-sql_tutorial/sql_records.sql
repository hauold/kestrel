CREATE OR REPLACE VIEW year_of_services AS
SELECT
  employee_id,
  first_name || ' ' || last_name full_name,
  FLOOR(months_between (CURRENT_DATE, hire_date) / 12) years,
  hire_date
FROM
  employees;

SELECT
    status,
    COUNT(order_id) order_count
FROM
    orders
GROUP BY
    status;

SELECT DISTINCT status
FROM orders;

SELECT
    customer_id,
    COUNT(order_id)
FROM
    orders
GROUP BY
    customer_id
ORDER BY
    customer_id;

SELECT
    name,
    COUNT(order_id) order_count
FROM
    orders
    INNER JOIN customers USING (customer_id)
GROUP BY
    name
ORDER BY
    name;

SELECT
    EXTRACT(MONTH FROM order_date) order_month,
    COUNT( order_id ) order_count
FROM
    orders
GROUP BY
    EXTRACT(MONTH FROM order_date)
ORDER BY
    order_month;