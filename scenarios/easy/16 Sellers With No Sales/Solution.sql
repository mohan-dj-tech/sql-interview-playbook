-- Problem: Sellers With No Sales
/* Solution:
 To find sellers who made no sales in 2020, this query uses a `LEFT JOIN` from the
 `Seller` table to the `Orders` table. The join condition matches `seller_id` and
 also filters the `Orders` table to include only sales from the year 2020. If a
 seller had no sales in 2020, the columns from the `Orders` table will be `NULL`
 for that seller. The `WHERE O.seller_id IS NULL` clause then filters to select
 only these sellers. The result is ordered by `seller_name`.
*/
SELECT
    S.seller_name
FROM
    Seller AS S
    LEFT JOIN Orders AS O ON S.seller_id = O.seller_id
    AND YEAR(sale_date) = '2020'
WHERE
    O.seller_id IS NULL
ORDER BY
    seller_name;
