DECLARE
    l_customer_name customers.name%TYPE;
BEGIN
    SELECT name INTO l_customer_name
    FROM customers
    WHERE customer_id = 100;
    
    dbms_output.put_line( 'Name : ' || l_customer_name );
END;

DECLARE
    r_customer customers%ROWTYPE;
BEGIN
    SELECT * INTO r_customer
    FROM customers
    WHERE customer_id = 100;
    
    dbms_output.put_line( 'Name : ' || r_customer.name );
    dbms_output.put_line( 'Website : ' || r_customer.website );
END;

DECLARE
    l_customer_name customers.name%TYPE;
    l_contact_first_name contacts.first_name%TYPE;
    l_contact_last_name contacts.last_name%TYPE;
BEGIN
    SELECT
        NAME,
        FIRST_NAME,
        LAST_NAME
    INTO
        l_customer_name,
        l_contact_first_name,
        l_contact_last_name
    FROM
        customers
    INNER JOIN
        contacts USING (customer_id)
    WHERE
        customer_id = 100;
        
    dbms_output.put_line( l_customer_name || ', Contact: ' || l_contact_first_name || ' ' || l_contact_last_name );
END;