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