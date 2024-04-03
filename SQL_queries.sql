USE retail_sales_dw;

SELECT
    c.is_vip,
    p.product_name,
    SUM(sales_fact.quantity_sold) AS total_quantity_sold
FROM sales_fact
JOIN customer_dim AS c ON sales_fact.customer_id = customer.customer_id
JOIN product_dim AS p ON sales_fact.product_id = p.product_id
GROUP BY c.is_vip, p.product_name
ORDER BY total_quantity_sold DESC; 
