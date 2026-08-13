-- Problem: Last Person to Fit in the Elevator
/* Solution:
 To determine the last individual who can board the elevator without exceeding the 800-kilogram weight limit, we'll follow a streamlined approach that aligns directly with the SQL query provided.

 1.  **`CumulativeWeight` CTE**: This Common Table Expression calculates a running total of the weight.
     - `SUM(weight) OVER (ORDER BY position)`: This window function calculates the cumulative sum of `weight` based on the queue `position`.

 2.  **Final `SELECT`**:
     - It selects the `name` from the `CumulativeWeight` CTE.
     - `WHERE total_weight <= 800`: This filters to include only the people who can fit in the elevator.
     - `ORDER BY total_weight DESC`: By ordering the eligible people by their cumulative weight in descending order...
     - `LIMIT 1`: ...we can easily select the last person who fit.
*/
WITH CumulativeWeight AS (
    SELECT name, weight, SUM(weight) OVER (ORDER BY position) AS total_weight
    FROM ElevatorQueue
)
SELECT name
FROM CumulativeWeight
WHERE total_weight <= 800
ORDER BY total_weight DESC
LIMIT 1;
