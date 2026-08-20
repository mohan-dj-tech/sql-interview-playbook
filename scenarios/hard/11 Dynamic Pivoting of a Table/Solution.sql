-- Problem: Dynamic Pivoting of a Table

/*
Solution:
To transform the Products table into a pivoted format where each row represents a unique product_id with its corresponding prices across various stores, we need to dynamically generate SQL statements. This is essential because the number of stores can vary, and SQL doesn't inherently support dynamic column generation in static queries. The provided stored procedure PivotProducts accomplishes this using dynamic SQL, window functions, and conditional aggregation. Below is a comprehensive breakdown of the approach, step-by-step execution, and detailed explanations for each component of the SQL query.

Approach Overview
1. **Understand the Data Structure**:
   - Each row in the Products table represents the price of a specific product in a particular store.
   - The combination of (product_id, store) is unique, ensuring that each product-store pair appears only once.
2. **Identify Unique Stores**:
   - Since the number of stores can vary (up to 30 as per the problem statement), we need a dynamic way to handle each store as a separate column in the pivoted result.
3. **Construct Dynamic SQL for Pivoting**:
   - Use GROUP_CONCAT to dynamically generate the SQL segments required for each store.
   - Aggregate the prices using conditional logic to place them under their respective store columns.
4. **Execute the Dynamic SQL**:
   - Prepare, execute, and deallocate the dynamically constructed SQL statement to produce the final pivoted table.
*/

-- SQL Query
CREATE PROCEDURE PivotProducts()
BEGIN
	# Write your MySQL query statement below.
    SET group_concat_max_len = 1000000; #This is tricky. There's a length limit on GROUP_CONCAT.
    SET @sql = NULL;
    SELECT
    GROUP_CONCAT(DISTINCT CONCAT(
      'SUM(IF(store = "', store, '", price, null)) AS ', store) ORDER BY store ASC)
    INTO @sql
    FROM Products;

    SET @sql = CONCAT('SELECT product_id, ', @sql, ' FROM Products GROUP BY product_id');


    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
