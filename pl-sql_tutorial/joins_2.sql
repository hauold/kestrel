--Order of operation
--1. FROM
--2. JOIN
--3. WHERE
--4. SELECT
--5. ORDER BY

SELECT member_name, project_name
FROM members m
FULL OUTER JOIN projects p ON p.project_id = m.project_id
ORDER BY member_name;

SELECT
  warehouse_name,
  product_name,
  ' ' quantity
FROM
  products
  CROSS JOIN warehouses
ORDER BY
  warehouse_name;

SELECT
  e1.hire_date,
  (e1.first_name || ' ' || e1.last_name) employee1,
  (e2.first_name || ' ' || e2.last_name) employee2
FROM
  employees e1
  INNER JOIN employees e2 ON e1.employee_id > e2.employee_id
  AND e1.hire_date = e2.hire_date
ORDER BY
  e1.hire_date DESC,
  employee1,
  employee2;