set serveroutput on;

declare
    r_product_a products%rowtype;
    cursor c_product_a (low_price number, high_price number) is
        select product_name, list_price from products
        where list_price between low_price and high_price;
    
    cursor c_product_b (low_price number, high_price number) is
        select product_name, list_price from products
        where list_price between low_price and high_price;
begin
    open c_product_a(0, 3000);

    loop
        fetch c_product_a into r_product_a;
        exit when c_product_a%notfound;
        dbms_output.put_line(r_product_a.product_name || ' : ' || r_product_a.list_price );
    end loop;

    close c_product_a;

    dbms_output.put_line('-------------------');

    for r_product_b in c_product_b(3001,8000) loop
        dbms_output.put_line(r_product_b.product_name || ' : ' || r_product_b.list_price );
    end loop;
end;