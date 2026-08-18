-- Problem: Rectangle Validation

/*
Solution:
To solve this problem, we need to check each row in the Rectangle table to determine if the given sides can form a rectangle based on the condition that opposite sides must be equal.

1. **Check Opposite Sides**: Verify if sides (a, c) and (b, d) are equal for each row.
2. **Return Result**: Based on the equality of opposite sides, return 'Yes' if the sides can form a rectangle, otherwise return 'No'.
*/

-- SQL Query
SELECT a, b, c, d,
       CASE
           WHEN a = c AND b = d THEN 'Yes'
           ELSE 'No'
       END as rectangle
FROM Rectangle;