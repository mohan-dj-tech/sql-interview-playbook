# Problem: Employee Absences

## Problem Statement

Table: `Employee`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| employee_id   | int     |
| employee_name | varchar |
| start_date    | date    |
| end_date      | date    |
+---------------+---------+
```
`employee_id` is the primary key for this table. Each row indicates an employee's absence period.

Write a solution to find all employees who were absent for **more than three** consecutive days. Return the result table ordered by `employee_name` in ascending order.

---

## Example

**Input:**

`Employee` table:
```
+-------------+---------------+------------+------------+
| employee_id | employee_name | start_date | end_date   |
+-------------+---------------+------------+------------+
| 1           | Alice         | 2020-02-01 | 2020-02-04 |
| 2           | Bob           | 2020-02-05 | 2020-02-09 |
| 3           | Charlie       | 2020-02-10 | 2020-02-11 |
| 4           | David         | 2020-02-15 | 2020-02-20 |
| 5           | Eve           | 2020-02-25 | 2020-02-28 |
+-------------+---------------+------------+------------+
```

**Expected Output:**
```
+---------------+------------+------------+
| employee_name | start_date | end_date   |
+---------------+------------+------------+
| Alice         | 2020-02-01 | 2020-02-04 |
| Bob           | 2020-02-05 | 2020-02-09 |
| David         | 2020-02-15 | 2020-02-20 |
+---------------+------------+------------+
```

**Explanation:**
The query calculates the duration of each absence period.
- Alice's absence: `DATEDIFF('2020-02-04', '2020-02-01') = 3`. The duration is 4 days (inclusive), which is more than 3.
- Bob's absence: `DATEDIFF('2020-02-09', '2020-02-05') = 4`. The duration is 5 days, which is more than 3.
- Charlie's absence: `DATEDIFF('2020-02-11', '2020-02-10') = 1`. The duration is 2 days, which is not more than 3.
- David's absence: `DATEDIFF('2020-02-20', '2020-02-15') = 5`. The duration is 6 days, which is more than 3.
- Eve's absence: `DATEDIFF('2020-02-28', '2020-02-25') = 3`. The duration is 4 days, which is more than 3.
The query returns the records for Alice, Bob, and David.
*Note: The example output in the original prompt was missing Eve. The logic dictates she should be included.*
