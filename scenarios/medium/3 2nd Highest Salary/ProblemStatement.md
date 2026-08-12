# Problem: Second Highest Salary

## Problem Statement

Table: `Employee`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
```
`id` is the primary key for this table.

Write a solution to find the second highest salary from the `Employee` table. If there is no second highest salary, the query should report `null`.

---

## Example 1

**Input:**

`Employee` table:
```
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
```

**Expected Output:**
```
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
```

## Example 2

**Input:**

`Employee` table:
```
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
```

**Expected Output:**
```
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
```

**Explanation:**
The query needs to handle cases where a second highest salary may not exist. This is typically done by finding the maximum salary that is less than the overall maximum salary.
