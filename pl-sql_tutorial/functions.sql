CREATE OR REPLACE FUNCTION test_function (
    in_year PLS_INTEGER
)
RETURN NUMBER
IS
    l_total_sales NUMBER := 0;
BEGIN
    SELECT SUM(unit_price * quantity)
    INTO l_total_sales
    FROM order_items
    INNER JOIN orders USING (order_id)
    WHERE status = 'Shipped'
    GROUP BY EXTRACT(YEAR FROM order_date)
    HAVING EXTRACT(YEAR FROM order_date) = in_year;

    RETURN l_total_sales;
END;

SET SERVEROUTPUT ON;

DECLARE
    l_sales NUMBER := 0;
BEGIN
    l_sales := test_function (2017);
    DBMS_OUTPUT.PUT_LINE('Sales 2017 : ' || l_sales);

    IF test_function (2015) < 10000000 THEN
        DBMS_OUTPUT.PUT_LINE('Sales 2015 is below target');
    END IF;
END;