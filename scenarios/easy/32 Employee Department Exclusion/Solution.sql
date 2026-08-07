-- Problem: Employee Department Exclusion
/* Solution:
 To find the names of employees who do not work in department 3, this query filters
 the `Employee` table. The `WHERE` clause selects all rows where the `department_id`
 is not equal to 3. It then returns the `name` for each of these employees.
*/
SELECT
    name
FROM
    Employee
WHERE
    department_id <> 3;
