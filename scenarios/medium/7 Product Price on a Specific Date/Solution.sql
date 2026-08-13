-- Problem: Product Price on a Specific Date
/* Solution:
 To determine the prices of all products on a specific date (2019-08-16), considering that the default price before any changes is 10, we can follow a systematic approach. This involves identifying the most recent price change for each product up to the specified date and handling cases where no price changes have occurred by assigning the default price.

 1.  **Identify Distinct Products**: Retrieve all unique product_ids from the PriceChanges table.
 2.  **Determine the Latest Price Before or On the Specified Date**: For each product, find the most recent new_price that became effective on or before 2019-08-16 using a correlated subquery.
 3.  **Assign Default Price Where Applicable**: If a product has no price changes before or on 2019-08-16, the subquery returns NULL. `COALESCE` is used to assign the default price of 10 in this case.
 4.  **Order the Results**: Sort the final output by product_id in ascending order.
*/
SELECT p.product_id,
       COALESCE(
           (SELECT new_price
            FROM PriceChanges pc
            WHERE pc.product_id = p.product_id AND pc.effective_date <= '2019-08-16'
            ORDER BY pc.effective_date DESC LIMIT 1),
           10
       ) AS price
FROM (SELECT DISTINCT product_id FROM PriceChanges) p
ORDER BY p.product_id;
