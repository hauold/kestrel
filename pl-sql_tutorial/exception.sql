DECLARE
    l_name customers.NAME%TYPE;
    l_customer_id customers.customer_id%TYPE := 0;
BEGIN
    -- get the customer
    SELECT NAME INTO l_name
    FROM customers
    WHERE customer_id = l_customer_id;
    
    -- show the customer name   
    dbms_output.put_line('customer name is ' || l_name);

    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Customer ' || l_customer_id ||  ' does not exist');
END;

DECLARE
    l_name customers.NAME%TYPE;
    l_customer_id customers.customer_id%TYPE := 10;
BEGIN
    -- get the customer
    SELECT NAME INTO l_name
    FROM customers
    WHERE customer_id > l_customer_id;
    
    -- show the customer name   
    dbms_output.put_line('Customer name is ' || l_name);
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Customer ' || l_customer_id ||  ' does not exist');
        WHEN TOO_MANY_ROWS THEN
            dbms_output.put_line('The database returns more than one customer');    
END;

DECLARE
    e_credit_too_high EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_credit_too_high, -20001);
    l_max_credit customers.credit_limit%TYPE;
    l_customer_id customers.customer_id%TYPE := 100;
    l_credit customers.credit_limit%TYPE := 20000;
BEGIN
    SELECT MAX(credit_limit)
    INTO l_max_credit
    FROM customers;

    IF l_credit > l_max_credit THEN
        RAISE_APPLICATION_ERROR(-20001,'Credit is too high');
    END IF;

    UPDATE customers
    SET credit_limit = l_credit
    WHERE customer_id = l_customer_id;

    COMMIT;
END;

DECLARE
    l_customer_id customers.customer_id%TYPE := -100;
BEGIN
    -- get the meax credit limit
    IF l_customer_id < 0 THEN
        RAISE invalid_number;
    END IF;
END;

DECLARE
    e_credit_too_high EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_credit_too_high, -20001);
    l_max_credit customers.credit_limit%TYPE;
    l_customer_id customers.customer_id%TYPE := 100;
    l_credit customers.credit_limit%TYPE := 20000;
BEGIN
    BEGIN
        SELECT MAX(credit_limit)
        INTO l_max_credit
        FROM customers;

        IF l_credit > l_max_credit THEN
            RAISE e_credit_too_high;
        END IF;
        EXCEPTION
            WHEN e_credit_too_high THEN
                dbms_output.put_line('The credit is too high!');
                RAISE;
    END;
    EXCEPTION
        WHEN e_credit_too_high THEN
            SELECT AVG(credit_limit)
            INTO l_credit
            FROM customers;

            dbms_output.put_line('Adjusted credit to: ' || l_credit );

            UPDATE customers
            SET credit_limit = l_credit
            WHERE customer_id = l_customer_id;
    COMMIT;
END;

SELECT * FROM customers 
WHERE customer_id = 100;