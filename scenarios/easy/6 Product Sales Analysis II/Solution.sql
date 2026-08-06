-- Problem: Product Sales Analysis II
/* Solution:
 To calculate the total quantity sold for each product, this query groups the `Sales`
 table by `product_id`. It then uses the `SUM` aggregate function to compute the
 total quantity for each group. The result set contains the `product_id` and the
 corresponding calculated `total_quantity`.
*/
SELECT
    product_id,
    SUM(quantity) AS total_quantity
FROM
    Sales
GROUP BY
    product_id;
