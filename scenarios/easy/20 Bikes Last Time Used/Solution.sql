-- Problem: Bikes Last Time Used
/* Solution:
 To find the last time each bike was used, this query groups the `Bikes` table by
 `bike_number`. For each bike, it uses the `MAX` aggregate function on the `end_time`
 column to find the most recent usage time. The results are then ordered by this
 maximum `end_time` in descending order to show the most recently used bikes first.
*/
SELECT
    bike_number,
    MAX(end_time) AS end_time
FROM
    Bikes
GROUP BY
    bike_number
ORDER BY
    end_time DESC;
