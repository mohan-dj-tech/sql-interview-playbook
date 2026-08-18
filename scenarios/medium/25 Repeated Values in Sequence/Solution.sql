-- Problem: Repeated Values in Sequence

/*
Solution:
To identify all values that appear at least three times consecutively in the Sequence table, we can utilize SQL window functions such as LAG and LEAD. This approach allows us to examine adjacent rows efficiently and determine if a value repeats consecutively across the desired number of positions.

Approach Overview
1. **Use Window Functions to Access Adjacent Rows**: Employ LAG to retrieve the previous value and LEAD to retrieve the next value for each row.
2. **Identify Values with Three Consecutive Repetitions**: Select values where the current value matches both the previous and next values, indicating three consecutive occurrences.
3. **Eliminate Duplicate Results**: Use DISTINCT to ensure each repeated value appears only once in the final output.
*/

-- SQL Query
WITH Consecutive AS (
    SELECT value,
           LAG(value, 1) OVER (ORDER BY id) AS prev_value,
           LEAD(value, 1) OVER (ORDER BY id) AS next_value
    FROM Sequence
)
SELECT DISTINCT value AS RepeatedValues
FROM Consecutive
WHERE value = prev_value AND value = next_value;
