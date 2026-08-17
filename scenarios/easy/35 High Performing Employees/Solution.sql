-- Problem: High Performing Employees

/*
Solution:
To solve this problem, we need to identify employees in the Employee table who have a performance rating higher than 8. We will use SQL query to join the Employee table with the Performance table and filter the employees based on their performance rating.

1. **Join Employee and Performance tables**: Begin by executing a SELECT statement to join the Employee and Performance tables on the empId column.
2. **Filter by Performance Rating**: Introduce a WHERE clause to filter out employees with a performance rating higher than 8.
*/

-- SQL Query
SELECT
    e.name
FROM
    Employee e
JOIN
    Performance p ON e.empId = p.empId
WHERE
    p.rating > 8;