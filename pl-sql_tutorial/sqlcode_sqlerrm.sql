DECLARE
    l_first_name contacts.first_name%TYPE := 'Test';
    l_last_name contacts.last_name%TYPE := 'Record';
    l_email contacts.email%TYPE := 'test@email.com';
    l_phone contacts.phone%TYPE := '+63123456789';
    l_customer_id contacts.customer_id%TYPE := -1;
BEGIN
    INSERT INTO contacts(first_name, last_name, email, phone, customer_id)
    VALUES(l_first_name, l_last_name, l_email, l_phone, l_customer_id);

    EXCEPTION
        WHEN OTHERS THEN
            DECLARE
                l_error PLS_INTEGER := SQLCODE;
                l_msg VARCHAR2(255) := SQLERRM;
                BEGIN
                    CASE l_error
                        WHEN -1 THEN
                            DBMS_OUTPUT.PUT_LINE('Duplicate email found ' || l_email);
                            DBMS_OUTPUT.PUT_LINE(l_msg);
                        WHEN -2291 THEN
                            DBMS_OUTPUT.PUT_LINE('Invalid customer ID: ' || l_customer_id);
                            DBMS_OUTPUT.PUT_LINE(l_msg);
                        END CASE;
                        
                        RAISE;
                END;
END;