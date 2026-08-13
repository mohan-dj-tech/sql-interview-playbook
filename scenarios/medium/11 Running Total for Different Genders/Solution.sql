-- Problem: Running Total for Different Genders
/* Solution:
 To determine the total score for each gender on each day in the competition, we need to aggregate the score_points earned by players of each gender on each specific day. This involves summing up the scores of all players belonging to the same gender for each day.

 Approach 1 uses a self-join to compute the cumulative scores. For each row (`s1`), it joins all rows of the same gender (`s2`) that occurred on or before that day and sums their scores.

 Approach 2 uses a window function, which is more efficient. `SUM() OVER (...)` calculates the running total (`total`) for `score_points`, partitioned by `gender` and ordered by `day`.
*/

-- Approach 1: Using self join
SELECT s1.gender,
       s1.day,
       Sum(s2.score_points) AS total
FROM   Scores s1
       LEFT JOIN Scores s2
              ON s1.gender = s2.gender
                 AND s1.day >= s2.day
GROUP  BY 1,
          2
ORDER  BY 1,
          2;


-- Approach 2: Using Window Functions
SELECT gender,
      day,
      SUM(score_points) OVER (
        PARTITION BY gender
        ORDER BY day
      ) AS total
FROM Scores
ORDER BY gender, day;
