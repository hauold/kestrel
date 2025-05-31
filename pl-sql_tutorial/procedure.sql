create or replace procedure print_contact(
    p_customer_id NUMBER
)
is
    r_contact contacts%rowtype;
begin
    select *
    into r_contact
    from contacts
    where customer_id = p_customer_id;

    dbms_output.put_line( r_contact.first_name || ' ' || r_contact.last_name || ' < ' ||
    r_contact.email || ' >');

exception
    when others then
        dbms_output.put_line( sqlerrm );
end;

exec print_contact(100);

create or replace procedure get_customer_by_credit(
    min_credit NUMBER
)
as 
    c_customers sys_refcursor;
begin
    -- open the cursor
    open c_customers for
        select customer_id, credit_limit, name
        from customers
        where credit_limit > min_credit
        order by credit_limit;
    -- return the result set
    dbms_sql.return_result(c_customers);
end;

exec get_customer_by_credit(5000);

create or replace procedure get_customers(
    page_no NUMBER,
    page_size NUMBER
)
as 
    c_customers sys_refcursor;
    c_total_row sys_refcursor;
begin
    open c_total_row for
        select count(*)
        from customers;
    dbms_sql.return_result(c_total_row);

    open c_customers for
        select customer_id, name
        from customers
        order by name
        offset page_size * (page_no - 1) rows
        fetch next page_size rows only;
    dbms_sql.return_result(c_customers);
end;

exec get_customers (1,10);

CREATE OR REPLACE PROCEDURE get_customer_by_credit(
    min_credit NUMBER
)
AS 
    c_customers SYS_REFCURSOR;
BEGIN
    -- open the cursor
    OPEN c_customers FOR
        SELECT customer_id, credit_limit, name
        FROM customers
        WHERE credit_limit > min_credit
        ORDER BY credit_limit;
    -- return the result set
    dbms_sql.return_result(c_customers);
END;

exec get_customer_by_credit(5000);