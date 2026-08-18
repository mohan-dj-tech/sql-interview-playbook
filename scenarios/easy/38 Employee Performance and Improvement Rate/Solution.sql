-- Problem: Employee Performance and Improvement Rate
/*
Solution:
To solve this problem, we need to calculate each employee's performance and improvement rate based on their evaluation scores across different rounds. The approach involves systematically breaking down the problem into manageable steps, utilizing SQL window functions and aggregation techniques to derive the required metrics.

1. **Calculate Performance**: Determine the average ratio of each employee's score to the corresponding evaluation round.
2. **Determine Improvement Rate**: Identify the percentage of evaluations where an employee's score improved compared to the previous round and is greater than 50.
3. **Round the Results**: Ensure that both performance and improvement rate are rounded to two decimal places for precision.
*/

-- SQL Query
WITH LaggedPerformance AS (
    SELECT
        employee_name,
        round,
        score,
        LAG(score) OVER (PARTITION BY employee_name ORDER BY round) AS previous_score
    FROM
        Performance
)
SELECT
    employee_name,
    ROUND(AVG(score * 1.0 / round), 2) AS performance,
    ROUND(
        (SUM(CASE
            WHEN score > 50 AND previous_score IS NOT NULL AND score > previous_score
            THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*)), 2
    ) AS improvement_rate
FROM
    LaggedPerformance
GROUP BY
    employee_name;