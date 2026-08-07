-- Problem: Employee Task Tracking
/* Solution:
 To find employees who completed tasks they assigned to themselves, this query filters
 the `TaskLog` table. The `WHERE` clause selects rows where the `employee_id` (the
 assigner) is the same as the `assignee_id` (the completer). `DISTINCT` is used to
 ensure that each employee ID is listed only once, even if they have completed
 multiple self-assigned tasks. The result is ordered by `employee_id`.
*/
SELECT DISTINCT
    employee_id
FROM
    TaskLog
WHERE
    employee_id = assignee_id
ORDER BY
    employee_id ASC;
