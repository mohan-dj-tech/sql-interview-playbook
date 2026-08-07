# Problem: Employee Department Exclusion

## Problem Statement

Table: `Employee`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
| department_id | int     |
+---------------+---------+
```
`id` is the primary key for this table.

Write a solution to find the names of employees who do not work in the department with `id = 3`. Return the result table in any order.

---

## Example

**Input:**

`Employee` table:
```
+----+-------+---------------+
| id | name  | department_id |
+----+-------+---------------+
| 1  | Alice | 1             |
| 2  | Bob   | 3             |
| 3  | Cindy | 2             |
| 4  | Dave  | 3             |
| 5  | Eve   | 1             |
+----+-------+---------------+
```

**Expected Output:**
```
+-------+
| name  |
+-------+
| Alice |
| Cindy |
| Eve   |
+-------+
```

**Explanation:**
Alice, Cindy, and Eve work in departments 1 and 2, so their names are returned. Bob and Dave work in department 3 and are excluded.
