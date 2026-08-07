# Problem: High School Attendance

## Problem Statement

Table: `Students`
```
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| student_name | varchar |
| grade        | int     |
+--------------+---------+
```
`student_id` is the primary key for this table.

Table: `Attendance`
```
+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| student_id      | int     |
| attendance_date | date    |
| status          | enum    |
+-----------------+---------+
```
`(student_id, attendance_date)` is the primary key for this table. `status` is an ENUM of type ('Present', 'Absent').

Write a solution to find students who were absent for **three or more consecutive days**. Return the result table with `student_id` and the `start_date` of the first day of the consecutive absence period. Order the results by `student_id` and `start_date`.

---

## Example

**Input:**

`Students` table:
```
+------------+--------------+-------+
| student_id | student_name | grade |
+------------+--------------+-------+
| 1          | Alice        | 10    |
| 2          | Bob          | 11    |
| 3          | Charlie      | 10    |
+------------+--------------+-------+
```

`Attendance` table:
```
+------------+-----------------+--------+
| student_id | attendance_date | status |
+------------+-----------------+--------+
| 1          | 2020-11-01      | Absent |
| 1          | 2020-11-02      | Absent |
| 1          | 2020-11-03      | Absent |
| 2          | 2020-11-01      | Present|
| 2          | 2020-11-02      | Absent |
| 2          | 2020-11-03      | Absent |
| 2          | 2020-11-04      | Absent |
| 3          | 2020-11-01      | Present|
| 3          | 2020-11-02      | Present|
+------------+-----------------+--------+
```

**Expected Output:**
```
+------------+------------+
| student_id | start_date |
+------------+------------+
| 1          | 2020-11-01 |
| 2          | 2020-11-02 |
+------------+------------+
```

**Explanation:**
- Student 1 was absent for 3 consecutive days starting from 2020-11-01.
- Student 2 was absent for 3 consecutive days starting from 2020-11-02.
- Student 3 had no consecutive absences.
The query identifies these periods of consecutive absences.
