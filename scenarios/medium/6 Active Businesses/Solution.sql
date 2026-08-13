-- Problem: Active Businesses
/* Solution:
 In tackling this challenge, our strategy involves two key steps using MySQL. First, within a subquery, we calculate the average occurrences for each event type by employing the AVG function over a window partitioned by event type. Subsequently, in the main query, we filter records to select only those where the occurrences surpass the calculated average.

 The final step includes grouping the results by business_id and applying additional filters to ensure inclusion only for businesses with occurrences consistently exceeding the average across multiple events.
 */
SELECT business_id
FROM   (SELECT *,
               Avg(occurrences)
                 OVER(
                   partition BY event_type) AS avgo
        FROM   Events) x
WHERE  occurrences > avgo
GROUP  BY business_id
HAVING Count(business_id) > 1;
