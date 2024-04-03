# DataProject1_DS2002
## Jenny Schilling (xdj3kg)

Functionality:

In MySQL:
1. First, run the sql source database in data/mysampledatabase.sql (this was downloaded from MySQL's list of sample databases)
2. Then, run the DataProject1.sql file to create the retail_sales_dw database and populate it with the sales fact table, as well as the customer and sales dimensions.
3. Next, run the createDateDim.sql file to add the date dimension
4. Finally, run the insertData_DataProject1.sql to insert the data from the classicmodels source database into our retail_sales datawarehouse

Using python:
1. Run the ETL_Processing.ipynb notebook to create the product dimension and populate it with data from the local classicmodels database
2. Run the convert_csv_to_sql.ipynb to load in the is_vip data from a csv file, and align it with the first and last names in our customer dimension table

Testing:
1. Run the SQL_queries.sql file to demonstrate proper functionality
   - This file calculates the total sales quantity, grouping by is_vip and product_name to see sales quantities for each product broken down by VIP status. We sort by total_quantity_sold in descending order to find out the top-selling products
