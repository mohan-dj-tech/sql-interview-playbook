-- Problem: Second Fastest Time in Races
/* Solution:
 To solve this problem, we will identify the second fastest time from the RaceResults table using SQL queries, handling cases where a second fastest time may not exist.

 Uses a subquery to first find the top two fastest (smallest) unique times. The outer query then selects the `MAX()` of these two times, which will be the second fastest time. If there is only one time, this will correctly return `NULL` after the `MAX` aggregation.
*/

SELECT MAX(time) AS SecondFastestTime
FROM (
    SELECT time
    FROM RaceResults
    GROUP BY time
    ORDER BY time ASC
    LIMIT 2
) AS TopTwoTimes;