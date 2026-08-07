-- Problem: Group Sold Products By The Date
/* Solution:
 To find the number of different products sold and their names for each date, this
 query groups the `Activities` table by `sell_date`. It uses `COUNT(DISTINCT product)`
 to count the unique products for each day. The `GROUP_CONCAT` function is used to
 aggregate the distinct product names into a single comma-separated string, with the
 names sorted lexicographically. The final result is ordered by `sell_date`.
*/
SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(
        DISTINCT product
        ORDER BY
            product ASC SEPARATOR ','
    ) AS products
FROM
    Activities
GROUP BY
    sell_date
ORDER BY
    sell_date ASC;
