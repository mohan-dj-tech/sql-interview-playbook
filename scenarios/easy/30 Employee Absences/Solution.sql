-- Problem: Employee Absences
/* Solution:
 To find employees who were absent for more than three consecutive days, this query
 filters the `Employee` table. It uses the `DATEDIFF` function to calculate the
 number of days between the `end_date` and `start_date`. The `WHERE` clause then
 keeps only the records where this duration is greater than or equal to 3. The result is
 ordered by `employee_name`.
*/
SELECT employee_name,
       start_date,
       end_date
FROM   Employee
WHERE  DATEDIFF(end_date, start_date) >= 3
ORDER  BY employee_name ASC;
