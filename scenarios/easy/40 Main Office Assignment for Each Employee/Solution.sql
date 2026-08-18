-- Problem: Main Office Assignment for Each Employee

/*
Solution:
To determine the main office for each employee from the OfficeAssignment table, we can follow a systematic approach that prioritizes the main office flag and handles cases where employees are assigned to only one office.

Approach Overview
1. **Identify Main Office**:
   - For employees with multiple office assignments, select the office marked as main ('Y').
   - For employees with only one office assignment, designate that office as their main office regardless of the main_flag.
2. **Order Results**: Ensure the final output is ordered by employee_id.
*/

-- SQL Query
SELECT employee_id, office_id
FROM (
    SELECT employee_id, office_id,
           ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY main_flag DESC) as rn
    FROM OfficeAssignment
) AS T
WHERE rn = 1
ORDER BY employee_id;