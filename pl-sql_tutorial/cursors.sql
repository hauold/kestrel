create view sales as
   select customer_id,
          sum(unit_price * quantity) total,
          round(sum(unit_price * quantity) * 0.05) credit
     from order_items
    inner join orders
   using ( order_id )
    where status = 'Shipped'
    group by customer_id;

select *
  from sales
 order by customer_id;

declare
   cursor c_revenue (
      in_year        number := 2017,
      in_customer_id number := 1
   ) is
   select sum(quantity * unit_price) revenue
     from order_items
    inner join orders
   using ( order_id )
    where status = 'Shipped'
      and extract(year from order_date) = in_year
    group by customer_id
   having customer_id = in_customer_id;

   r_revenue c_revenue%rowtype;
begin
   open c_revenue;
   loop
      fetch c_revenue into r_revenue;
      exit when c_revenue%notfound;
        -- show the revenue
      dbms_output.put_line(r_revenue.revenue);
   end loop;
   close c_revenue;
end;

declare
   r_product products%rowtype;
   cursor c_product (
      low_price  number,
      high_price number
   ) is
   select *
     from products
    where list_price between low_price and high_price;
begin
    -- show mass products
   dbms_output.put_line('Mass products: ');
   open c_product(
      50,
      100
   );
   loop
      fetch c_product into r_product;
      exit when c_product%notfound;
      dbms_output.put_line(r_product.product_name
                           || ': '
                           || r_product.list_price);
   end loop;
   close c_product;

    -- show luxury products
   dbms_output.put_line('Luxury products: ');
   open c_product(
      800,
      1000
   );
   loop
      fetch c_product into r_product;
      exit when c_product%notfound;
      dbms_output.put_line(r_product.product_name
                           || ': '
                           || r_product.list_price);
   end loop;
   close c_product;
end;