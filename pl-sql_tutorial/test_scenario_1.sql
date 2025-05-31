-- Create function to generate customer_id
CREATE OR REPLACE FUNCTION new_customer_id (
    table_name VARCHAR2
)
RETURN NUMBER
IS
    t_new_ID NUMBER;
    v_sql VARCHAR2(1000);
BEGIN
    v_sql := 'SELECT COUNT(*) FROM ' || table_name;
    EXECUTE IMMEDIATE v_sql INTO t_new_ID;

    RETURN t_new_ID;
END;

-- Procedure that adds a record to a table
CREATE OR REPLACE PROCEDURE add_customer (
    p_name customers.name%TYPE,
    p_address customers.address%TYPE,
    p_website customers.website%TYPE,
    p_credit_limit customers.credit_limit%TYPE
)
IS
    r_customer customers%ROWTYPE;
    t_row_ID NUMBER;
BEGIN
    -- generate new customer_id
    t_row_ID := new_customer_id('CUSTOMERS') + 1;

    -- insert new record to customer table
    INSERT INTO customers (customer_id, name, address, website, credit_limit)
    VALUES (t_row_ID, p_name, p_address, p_website, p_credit_limit);

    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

EXEC add_customer('Test Using Procedure', 'Metro Manila', 'http://www.test.com', 90000);
EXEC add_customer(NULL, 'Zambales', 'http://www.okay.com', 1100000);