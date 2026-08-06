-- Problem: Queries Quality and Percentage
/* Solution:
 This query calculates two key metrics for each `query_name`: quality and the percentage
 of poor queries. It groups the results by `query_name` to perform these calculations.
 - `quality` is the average of the ratio of `rating` to `position`.
 - `poor_query_percentage` is the percentage of queries with a `rating` less than 3.
 Both metrics are rounded to two decimal places for clarity.
*/
SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(
        SUM(
            CASE
                WHEN rating < 3 THEN 1
                ELSE 0
            END
        ) * 100 / COUNT(*),
        2
    ) AS poor_query_percentage
FROM
    Queries
GROUP BY
    query_name;
