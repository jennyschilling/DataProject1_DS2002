# DROP database `retail_sales_dw`;
CREATE DATABASE `retail_sales_dw` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE retail_sales_dw;


###############
# create tables
###############
  
# DROP TABLE `sales_fact`;
CREATE TABLE sales_fact (
sale_id int NOT NULL,
sale_date date NOT NULL,
product_id varchar(15) NOT NULL,
customer_id int NOT NULL,
quantity_sold int NOT NULL,
sales_amount int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# DROP TABLE `customer_dim`;
CREATE TABLE `customer_dim` (
  `customer_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `credit_limit` decimal(10,2) NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `phone` (`phone`),
  KEY `credit_limit` (`credit_limit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



#############
# insert data
#############
  
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

