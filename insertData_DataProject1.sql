TRUNCATE TABLE retail_sales_dw.customer_dim;
INSERT INTO `retail_sales_dw`.`customer_dim`
(`customer_id`,
`first_name`,
`last_name`,
`phone`,
`credit_limit`)
SELECT `customerNumber`,
	`contactFirstName`,
	`contactLastName`,
	`phone`,
	`creditLimit`
FROM classicmodels.customers;
SELECT * FROM retail_sales_dw.customer_dim;


TRUNCATE TABLE retail_sales_dw.product_dim;
INSERT INTO `retail_sales_dw`.`product_dim`
(`product_id`,
`product_name`,
`product_line`,
`quantity_in_stock`,
`product_price`)
SELECT `productCode`,
	`productName`,
	`productLine`,
	`quantityInStock`,
	`buyPrice`
FROM classicmodels.products;
SELECT * FROM retail_sales_dw.product_dim;


TRUNCATE TABLE `retail_sales_dw`.`sales_fact`;
INSERT INTO `retail_sales_dw`.`sales_fact`
(`sale_id`,
`sale_date`,
`product_id`,
`customer_id`,
`quantity_sold`,
`sales_amount`)
SELECT 
	s.orderNumber AS sale_id,
    s.orderDate AS sale_date,
    sd.productCode AS product_id,
    s.customerNumber AS customer_id,
    sd.quantityOrdered AS quantity_sold,
    sd.priceEach AS sales_amount
FROM classicmodels.orders AS s
INNER JOIN classicmodels.orderdetails AS sd ON s.orderNumber = sd.orderNumber;
SELECT * FROM retail_sales_dw.sales_fact;

SELECT * FROM retail_sales_dw.date_dim;

