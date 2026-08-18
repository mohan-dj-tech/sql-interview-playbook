-- Problem: Departments with High Earning Employees

/*
Solution:
To identify departments with at least two employees earning above their department's average salary, we can follow a structured approach that involves calculating averages, filtering high earners, and aggregating the results accordingly.

Approach Overview
1. **Calculate Department Average Salary**: Determine the average salary for each department.
2. **Identify High Earners**: Find employees whose salaries exceed their department's average.
3. **Aggregate High Earners by Department**: Count the number of high earners in each department.
4. **Select Eligible Departments**: Retrieve departments that have at least two high earners.
5. **Order the Results**: Sort the final output by department name.
*/

-- SQL Query
SELECT department
FROM (
    SELECT department, COUNT(*) AS high_earners
    FROM (
        SELECT e.id, e.name, e.department, e.salary, AVG(e2.salary) AS avg_salary
        FROM Employee e
        JOIN Employee e2 ON e.department = e2.department
        GROUP BY e.id, e.name, e.department, e.salary
        HAVING e.salary > AVG(e2.salary)
    ) AS subquery
    GROUP BY department
    HAVING COUNT(*) >= 2
) AS result
ORDER BY department;
