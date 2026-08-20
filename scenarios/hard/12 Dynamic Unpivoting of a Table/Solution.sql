-- Problem: Dynamic Unpivoting of a Table

/*
Solution:
To transform the Products table from a wide format—where each store has its own column—to a long format—where each row represents a product's price in a specific store—we implement the stored procedure UnpivotProducts. This procedure dynamically reorganizes the data, ensuring flexibility regardless of the number or names of stores involved. Below is a comprehensive breakdown of the approach, step-by-step execution, and detailed explanations for each component of the provided SQL query.

Approach Overview
1. **Understand the Data Structure**:
   - Wide Format: The Products table has multiple columns for each store (store_name1, store_name2, ..., store_namen), each representing the price of the product in that store.
   - Long Format: The desired output has three columns: product_id, store, and price, with each row representing a product's price in a specific store.
2. **Identify Store Columns Dynamically**:
   - Since the number and names of stores can vary across different test cases (up to 30 stores), the procedure must dynamically identify all store columns in the Products table.
3. **Construct Dynamic SQL for Unpivoting**:
   - Use SQL string functions to build a dynamic SELECT statement that unpivots the data by converting each store column into separate rows.
4. **Execute the Dynamic SQL**:
   - Prepare and execute the dynamically constructed SQL statement to generate the final unpivoted table.
*/

-- SQL Query
CREATE PROCEDURE UnpivotProducts()
BEGIN
	# Write your MySQL query statement below.
	set group_concat_max_len = 1000000;
	set @sql = null;
	with stores as (
	    SELECT COLUMN_NAME store
	    FROM INFORMATION_SCHEMA.COLUMNS
	    WHERE TABLE_NAME='products'
	      and COLUMN_NAME<>'product_id'
	)
	select group_concat(
	    concat(
	        'select product_id, "', store, '" ',
	        'as store, ', store, ' ',
	        'as price from products where ', store, ' is not null union'
	    )
	    order by store
	    separator ' '
	) into @sql
	from stores;

	/*select SUBSTRING(@sql, 1, LENGTH(@sql)-6);*/
	set @sql = SUBSTRING(@sql, 1, LENGTH(@sql)-6);
	prepare stmt from @sql;
	execute stmt;
END;
