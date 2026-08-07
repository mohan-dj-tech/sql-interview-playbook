-- Problem: Green Product Identification
/* Solution:
 To find products that are both organic and have biodegradable packaging, this query
 filters the `Inventory` table. The `WHERE` clause checks for rows where the `organic`
 column is 'Y' AND the `biodegradable` column is also 'Y'. It then returns the
 `product_id` for all matching rows.
*/
SELECT
    product_id
FROM
    Inventory
WHERE
    organic = 'Y' AND biodegradable = 'Y';
