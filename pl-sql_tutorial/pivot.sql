CREATE VIEW order_stats AS
SELECT 
    category_name, 
    status, 
    order_id
FROM 
    order_items
INNER JOIN orders USING (order_id)
INNER JOIN products USING (product_id)
INNER JOIN product_categories USING (category_id);

SELECT * FROM order_stats;

SELECT * FROM order_stats
PIVOT(
    COUNT(order_id) order_count,
    SUM(order_value) sales
    FOR category_name
    IN ( 
        'CPU' CPU,
        'Video Card' VideoCard,
        'Mother Board' MotherBoard,
        'Storage' Storage
    )
)
ORDER BY status;

SELECT * FROM order_stats
PIVOT(
    COUNT(order_id) order_count,
    SUM(order_value) sales
    FOR status
    IN ( 
        'Canceled' Canceled,
        'Pending' Pending,
        'Shipped' Shipped
    )
)
ORDER BY category_name;

-- ORA-00936: missing expression
SELECT * FROM order_stats
PIVOT(
    COUNT(order_id) orders,
    SUM(order_value) sales
    FOR category_name
    IN ( 
       SELECT category_name 
       FROM product_categories
    )
)
ORDER BY status;

SELECT * FROM order_stats
PIVOT XML (
    COUNT(order_id) orders,
    SUM(order_value) sales
    FOR category_name
    IN ( 
       SELECT category_name 
       FROM product_categories
    )
)
ORDER BY status;    
