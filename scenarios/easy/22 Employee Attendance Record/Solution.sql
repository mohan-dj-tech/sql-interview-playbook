-- Problem: Employee Attendance Record
/* Solution:
 To create an attendance summary for each employee, this query uses a `LEFT JOIN` from
 the `Employees` table to the `Attendance` table. This ensures all employees are
 included, even if they have no attendance records. The query then groups by employee
 to aggregate the results. Conditional aggregation (`SUM` with `CASE`) is used to
 count the number of occurrences for each status ('Present', 'Absent', 'Late') for
 each employee. The final result is ordered by `employee_id`.
*/
SELECT
    e.employee_id,
    e.employee_name,
    SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS days_present,
    SUM(CASE WHEN a.status = 'Absent' THEN 1 ELSE 0 END) AS days_absent,
    SUM(CASE WHEN a.status = 'Late' THEN 1 ELSE 0 END) AS days_late
FROM
    Employees e
    LEFT JOIN Attendance a ON e.employee_id = a.employee_id
GROUP BY
    e.employee_id,
    e.employee_name
ORDER BY
    e.employee_id;
