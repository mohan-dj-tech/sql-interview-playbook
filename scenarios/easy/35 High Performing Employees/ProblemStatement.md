# High Performing Employees

## Problem Statement

Table: `Employee`

| Column Name | Type    |
|-------------|---------|
| empId       | int     |
| name        | varchar |
| department  | varchar |
| salary      | int     |

`empId` is the primary key for this table. Each row of this table contains information about an employee, including their name, department, and salary.

Table: `Performance`

| Column Name | Type |
|-------------|------|
| empId       | int  |
| rating      | int  |

`empId` is the primary key for this table and a foreign key referencing the `empId` column of the `Employee` table. Each row of this table contains the performance rating (an integer value) of an employee.

Write an SQL query to find the names of employees with a performance rating above 8. Return the result table in any order.

---

## Example

**Input:**

`Employee` table:

| empId | name    | department  | salary |
|-------|---------|-------------|--------|
| 1     | Alice   | HR          | 70000  |
| 2     | Bob     | Engineering | 80000  |
| 3     | Charlie | HR          | 60000  |
| 4     | David   | Engineering | 90000  |

`Performance` table:

| empId | rating |
|-------|--------|
| 1     | 9      |
| 2     | 8      |
| 3     | 7      |
| 4     | 9      |

**Expected Output:**

| name    |
|---------|
| Alice   |
| David   |

<details>
<summary>Explanation</summary>

Only Alice and David have a performance rating above 8.
</details>