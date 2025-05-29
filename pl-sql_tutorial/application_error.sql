DECLARE
    credit_limit_exceed EXCEPTION;
    PRAGMA exception_init(credit_limit_exceed, -20111);

    l_customer_id     customers.customer_id%TYPE := 100;
    l_credit_limit    customers.credit_limit%TYPE := 1000;

    l_customer_credit customers.credit_limit%TYPE;
    
BEGIN
    -- get customer credit limit
    SELECT credit_limit INTO l_customer_credit
    FROM customers
    WHERE customer_id = l_customer_id;
    
    -- raise an exception if the credit limit is exceeded
    IF l_customer_credit > l_credit_limit THEN
        raise_application_error(-20111,'Credit Limit Exceeded');
    END IF;
    
    dbms_output.put_line('Credit Limit is checked and passed');
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Customer with id ' || l_customer_id || ' does not exist.');
END;

DECLARE
    e1 EXCEPTION;
    PRAGMA exception_init (e1, -20001);
    e2 EXCEPTION;
    PRAGMA exception_init (e2, -20002);
    e3 EXCEPTION;
    PRAGMA exception_init (e3, -20003);
    l_input NUMBER := 3;
BEGIN
    BEGIN
        BEGIN
            IF l_input = 1 THEN
                raise_application_error(-20001,'Exception: the input number is 1');
            ELSIF l_input = 2 THEN
                raise_application_error(-20002,'Exception: the input number is 2');
            ELSE
                raise_application_error(-20003,'Exception: the input number is not 1 or 2');
            END IF;

            EXCEPTION
                WHEN e1 THEN 
                    dbms_output.put_line('Handle exception when the input number is 1');
        END;

        EXCEPTION 
            WHEN e2 THEN
                dbms_output.put_line('Handle exception when the input number is 2');
    END;

    EXCEPTION 
        WHEN e3 THEN
            dbms_output.put_line('Handle exception when the input number is 3');
END;