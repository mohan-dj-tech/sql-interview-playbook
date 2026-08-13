-- Problem: Evaluate Boolean Expression
/* Solution:
 To evaluate the boolean expressions, this query joins the `Expressions` table with the `Variables` table twice. This is necessary to get the integer values for both the `left_operand` and the `right_operand`.

 1.  **First Join**: Joins `Expressions` with `Variables` (aliased as `v1`) on `left_operand` to get its value.
 2.  **Second Join**: Joins the result with `Variables` again (aliased as `v2`) on `right_operand` to get its value.
 3.  **CASE Statement**: A `CASE` statement is then used to evaluate the expression. It checks the `operator` and compares the values from `v1` and `v2` to determine if the result is 'true' or 'false'.
*/
SELECT e1.left_operand,
       e1.operator,
       e1.right_operand,
       CASE
           WHEN e1.operator = '<' AND v1.value < v2.value THEN 'true'
           WHEN e1.operator = '>' AND v1.value > v2.value THEN 'true'
           WHEN e1.operator = '=' AND v1.value = v2.value THEN 'true'
           ELSE 'false'
       END AS value
FROM   Expressions e1
       JOIN Variables v1 ON e1.left_operand = v1.name
       JOIN Variables v2 ON e1.right_operand = v2.name;
