-- Problem: Employee Absences
/* Solution:
 To find employees who were absent for more than three consecutive days, this query
 filters the `Employee` table. It uses the `DATEDIFF` function to calculate the
 number of days between the `end_date` and `start_date`. Since `DATEDIFF` calculates
 the difference, we add 1 to make the duration inclusive. The `WHERE` clause then
 keeps only the records where this duration is greater than 3. The result is
 ordered by `employee_name`.
*/
SELECT
    employee_name,
    start_date,
    end_date
FROM
    Employee
WHERE
    DATEDIFF(end_date, start_date) + 1 > 3
ORDER BY
    employee_name ASC;
