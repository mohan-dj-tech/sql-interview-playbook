-- Problem: Second Highest Salary
/* Solution:
 To determine the second highest salary from the Employee table, we analyze the provided SQL query, which effectively retrieves the desired result by leveraging SQL's DISTINCT, ORDER BY, LIMIT, and OFFSET clauses. Below is a comprehensive breakdown of the approach, step-by-step execution, and detailed explanations for each component of the SQL query.

 1.  **Eliminate Duplicate Salaries**: Use the DISTINCT keyword to ensure each salary is unique, preventing multiple entries of the same salary from affecting the ranking.
 2.  **Order Salaries in Descending Order**: Sort the salaries from highest to lowest using the ORDER BY clause with DESC (descending) order.
 3.  **Retrieve the Second Entry**: Utilize the LIMIT and OFFSET clauses to skip the highest salary and retrieve the next one, which represents the second highest salary.
 4.  **Handle Cases with Fewer Than Two Salaries**: If there is no second distinct salary (i.e., all employees have the same salary or there's only one employee), the query will return null.
*/
SELECT DISTINCT salary
FROM   Employee
ORDER  BY salary DESC
LIMIT  1 OFFSET 1;


Alternative Approaches:
1. Using Subqueries with MAX:

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);


2. Using ROW_NUMBER():

   SELECT salary AS SecondHighestSalary
   FROM (
       SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
       FROM (
           SELECT DISTINCT salary
           FROM Employee
       ) AS distinct_salaries
   ) AS ranked_salaries
   WHERE rn = 2;


3. Using DENSE_RANK():

   SELECT salary AS SecondHighestSalary
   FROM (
       SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS dr
       FROM Employee
   ) AS ranked_salaries
   WHERE dr = 2;
