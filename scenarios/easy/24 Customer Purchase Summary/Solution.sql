-- Problem: Customer Purchase Summary
/* Solution:
 To create a purchase summary for each customer, this query groups the `Purchases`
 table by `customer_id`. For each customer, it uses `COUNT(DISTINCT product)` to
 count the number of unique products they bought. The `GROUP_CONCAT` function is
 used to aggregate the distinct product names into a single comma-separated string,
 with the names sorted lexicographically. The final result is ordered by `customer_id`.
*/
SELECT
    customer_id,
    COUNT(DISTINCT product) AS num_products,
    GROUP_CONCAT(
        DISTINCT product
        ORDER BY
            product ASC SEPARATOR ','
    ) AS products
FROM
    Purchases
GROUP BY
    customer_id
ORDER BY
    customer_id ASC;
