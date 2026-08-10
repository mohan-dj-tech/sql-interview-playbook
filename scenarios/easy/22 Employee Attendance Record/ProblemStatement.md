# Problem: Employee Attendance Record

## Problem Statement

Table: `Employees`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| employee_id   | int     |
| employee_name | varchar |
+---------------+---------+
```
`employee_id` is the primary key for this table.

Table: `Attendance`
```
+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| employee_id     | int     |
| attendance_date | date    |
| status          | varchar |
+-----------------+---------+
```
There is no primary key for this table. `status` can be 'Present', 'Absent', or 'Late'.

Write a solution to find the attendance record for each employee, counting the number of days they were present, absent, and late. Return the result table ordered by `employee_id`.

---

## Example

**Input:**

`Employees` table:
```
+-------------+---------------+
| employee_id | employee_name |
+-------------+---------------+
| 101         | Alice         |
| 102         | Bob           |
| 103         | Charlie       |
+-------------+---------------+
```

`Attendance` table:
```
+-------------+-----------------+---------+
| employee_id | attendance_date | status  |
+-------------+-----------------+---------+
| 101         | 2020-11-01      | Present |
| 101         | 2020-11-02      | Absent  |
| 102         | 2020-11-01      | Late    |
| 102         | 2020-11-02      | Present |
| 103         | 2020-11-01      | Present |
| 103         | 2020-11-02      | Present |
+-------------+-----------------+---------+
```

**Expected Output:**
```
+-------------+---------------+--------------+-------------+-----------+
| employee_id | employee_name | days_present | days_absent | days_late |
+-------------+---------------+--------------+-------------+-----------+
| 101         | Alice         | 1            | 1           | 0         |
| 102         | Bob           | 1            | 0           | 1         |
| 103         | Charlie       | 2            | 0           | 0         |
+-------------+---------------+--------------+-------------+-----------+
```

**Explanation:**
The query joins the `Employees` and `Attendance` tables and then uses conditional aggregation to count the occurrences of each status for each employee.
- Alice was present 1 day and absent 1 day.
- Bob was present 1 day and late 1 day.
- Charlie was present 2 days.
The results are grouped by employee and ordered by `employee_id`.
