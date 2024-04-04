# DROP database `retail_sales_dw`;
CREATE DATABASE `retail_sales_dw` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE retail_sales_dw;

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
