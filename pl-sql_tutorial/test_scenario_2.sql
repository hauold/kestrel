CREATE VIEW total_sales_by_customer AS
    SELECT CUSTOMER_ID, SUM(UNIT_PRICE) total_sales
    FROM ORDER_ITEMS
    INNER JOIN ORDERS USING (ORDER_ID)
    INNER JOIN CUSTOMERS USING (CUSTOMER_ID)
    GROUP BY CUSTOMER_ID

CREATE OR REPLACE FUNCTION get_total_orders(
    f_customer_id NUMBER
)
RETURN NUMBER
IS

    CURSOR c_get_total_orders IS
    SELECT * FROM total_sales_by_customer
    WHERE CUSTOMER_ID = f_customer_id;

    r_get_total_orders c_get_total_orders%ROWTYPE;

BEGIN
    OPEN c_get_total_orders;
    LOOP
        FETCH c_get_total_orders INTO r_get_total_orders;
        EXIT WHEN c_get_total_orders%NOTFOUND;
    END LOOP;

    RETURN r_get_total_orders.total_sales;
END;

DECLARE
    t_total_sales NUMBER;
BEGIN
    t_total_sales := get_total_orders(61);
    DBMS_OUTPUT.PUT_LINE(t_total_sales);
END;