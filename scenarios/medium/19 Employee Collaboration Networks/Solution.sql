-- Problem: Employee Collaboration Networks
/* Solution:
 To identify the employee(s) who have collaborated on the most unique projects, this query uses two Common Table Expressions (CTEs).

 1.  **`AllCollaborations` CTE**: This CTE first unifies all collaboration participants. It uses `UNION` to create a single list of employee IDs (`id`) and their associated `project_id`. `UNION` is used instead of `UNION ALL` to automatically handle cases where an employee might be both an inviter and invitee on the same project, ensuring each employee-project pair is unique.
 2.  **`ProjectCounts` CTE**: This CTE groups the results from `AllCollaborations` by employee `id` and counts the number of distinct projects (`num_projects`) for each employee.
 3.  **Final `SELECT`**:
     - The main query selects the `id` and `num_projects` from the `ProjectCounts` CTE.
     - The `WHERE` clause filters these results to include only those employees whose `num_projects` is equal to the maximum number of projects found in the `ProjectCounts` CTE (determined by a subquery). This handles ties correctly.
*/
WITH AllCollaborations AS (
    -- Combine inviter and invitee collaborations
    SELECT inviter_id AS id, project_id
    FROM CollaborationAccepted
    UNION
    SELECT invitee_id AS id, project_id
    FROM CollaborationAccepted
),
ProjectCounts AS (
    -- Count unique projects per employee
    SELECT id, COUNT(DISTINCT project_id) AS num_projects
    FROM AllCollaborations
    GROUP BY id
)
-- Select employees with the maximum number of projects
SELECT id, num_projects
FROM ProjectCounts
WHERE num_projects = (
    SELECT MAX(num_projects)
    FROM ProjectCounts
)
ORDER BY id;
