-- Problem: Triangle Judgement
/* Solution:
 To assess the validity of triangles, this query uses a CASE statement to evaluate
 the triangle inequality theorem, which states that the sum of any two sides
 must be greater than the third side. The result is a clear classification
 of each set of sides as either a valid ('Yes') or invalid ('No') triangle.
*/
SELECT
    x,
    y,
    z,
    CASE
        WHEN x + y > z AND y + z > x AND x + z > y THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM
    Triangle;
