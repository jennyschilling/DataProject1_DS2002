# Data Project 1
## DS 2002
## Jenny Schilling (xdj3kg)

Functionality:

In MySQL:
1. First, run the sql source database in located in data/mysampledatabase.sql (this was downloaded from MySQL's list of sample databases). This will create the classicmodels database that we will use to populate some of our data with.
2. Next, run the 1_create_tables.sql file to create the retail_sales_dw database, the sales fact table, and the customer dimension. Data from classicmodels will also be used during this step to populate the sales fact table and customer dimension with data.
3. Next, run the 2_create_dateDim.sql file to add the date dimension to our retail sales datawarehouse.

Using python (in Google Colab or Jupyter Notebooks):
1. Run the 3_ETL_processing.ipynb notebook to create the product dimension and populate it with data from our local classicmodels database.
2. Run 4_convert_csv_to_sql.ipynb to add in 'is_vip' data from data/customer_vip_info.csv, which will align it with the first and last names in our customer dimension table.
3. To integrate data from a NoSQL database, run 5_noSQL_database.ipynb, which will generate fake reviews of products in a local MongoDB database, and then connect to our datawarehouse and load in that data to the product dimension by the product key.

Testing:
1. Run the 6_SQL_query.sql file to demonstrate proper functionality
   - This file calculates the total sales quantity (using SUM), grouping by is_vip and product_name to see sales quantities for each product broken down by VIP status. We sort by total_quantity_sold in descending order to find out the top-selling products.
2. If desired, the file in end results/SQL_query_getalldata.sql will display all the final tables (sales_fact, customer_dim, date_dim, product_dim) created in retail_sales_dw.

Notes:
- The folder 'end results' in this repository contains the final tables I got after completion of this assignment. Replicated tables should be the same with the expection of the reviews in product_dim, whic are randomly generated.
- Similarly, the random review data I generated can be found in data/example.product_reviews.json, which was downloaded from the MongoDB platform itself.
