# Problem: Employee Task Tracking

## Problem Statement

Table: `TaskLog`
```
+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| task_id         | int     |
| employee_id     | int     |
| assignee_id     | int     |
| completion_date | date    |
+-----------------+---------+
```
This table does not have a primary key and may contain duplicates. `employee_id` is the person who assigned the task, and `assignee_id` is the person who completed it.

Write a solution to find the IDs of employees who have completed at least one task assigned to themselves. Return the result table sorted by `employee_id` in ascending order.

---

## Example

**Input:**

`TaskLog` table:
```
+---------+-------------+-------------+-----------------+
| task_id | employee_id | assignee_id | completion_date |
+---------+-------------+-------------+-----------------+
| 101     | 10          | 15          | 2022-01-01      |
| 102     | 11          | 16          | 2022-01-02      |
| 103     | 12          | 12          | 2022-01-02      |
| 104     | 13          | 13          | 2022-01-03      |
| 105     | 14          | 18          | 2022-01-04      |
| 106     | 15          | 15          | 2022-01-05      |
| 107     | 16          | 10          | 2022-01-05      |
+---------+-------------+-------------+-----------------+
```

**Expected Output:**
```
+-------------+
| employee_id |
+-------------+
| 12          |
| 13          |
| 15          |
+-------------+
```

**Explanation:**
Employees with IDs 12, 13, and 15 have records where their `employee_id` is the same as their `assignee_id`, indicating they completed a task they assigned to themselves.
