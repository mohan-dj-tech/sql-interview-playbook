# Problem: Employee Collaboration Networks

## Problem Statement

Table: `CollaborationAccepted`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| inviter_id  | int     |
| invitee_id  | int     |
| project_id  | int     |
| accept_date | date    |
+-------------+---------+
```
`(inviter_id, invitee_id, project_id)` is the primary key.

Write a solution to find the employee(s) who have collaborated on the **most** number of unique projects. In case of a tie, list all such employees.

---

## Example

**Input:**

`CollaborationAccepted` table:
```
+------------+------------+------------+-------------+
| inviter_id | invitee_id | project_id | accept_date |
+------------+------------+------------+-------------+
| 1          | 2          | 100        | 2020-05-01  |
| 1          | 3          | 101        | 2020-05-02  |
| 2          | 3          | 102        | 2020-05-03  |
| 3          | 4          | 103        | 2020-05-04  |
| 2          | 4          | 104        | 2020-05-05  |
+------------+------------+------------+-------------+
```

**Expected Output:**
```
+----+--------------+
| id | num_projects |
+----+--------------+
| 2  | 3            |
| 3  | 3            |
+----+--------------+
```

**Explanation:**
- Employee 1: Projects 100, 101 (2 projects)
- Employee 2: Projects 100, 102, 104 (3 projects)
- Employee 3: Projects 101, 102, 103 (3 projects)
- Employee 4: Projects 103, 104 (2 projects)

Employees 2 and 3 have both collaborated on 3 unique projects, which is the maximum.
