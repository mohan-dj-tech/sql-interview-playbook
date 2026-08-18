-- Problem: Employee Task Tracking
/*
Solution:
To identify employees who have completed their own tasks, we need to examine records in the TaskLog table where the employee_id matches the assignee_id.

1. Select Employee IDs: Begin with a SELECT statement to fetch all employees from the TaskLog table.
2. Apply Conditions: Use a WHERE clause to filter employees who have completed tasks assigned by themselves.
3. Sort the Results: Finally sort the results
*/

-- SQL Query
SELECT DISTINCT
    employee_id
FROM
    TaskLog
WHERE
    employee_id = assignee_id
ORDER BY
    employee_id ASC;