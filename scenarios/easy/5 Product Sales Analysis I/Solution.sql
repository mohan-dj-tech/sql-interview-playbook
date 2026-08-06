-- Problem: Product Sales Analysis I
/* Solution:
 To report the product name, year, and price for each sale, this query joins the
 'Sales' and 'Product' tables on their common `product_id` column. An `INNER JOIN`
 is used to combine rows from both tables where the `product_id` matches. The
 final result set includes the product name from the 'Product' table and the
 year and price from the 'Sales' table, ordered by year.
*/
SELECT
    p.product_name,
    s.year,
    s.price
FROM
    Sales AS s
INNER JOIN
    Product AS p ON s.product_id = p.product_id
ORDER BY
    s.year;
