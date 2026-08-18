# Problem: Departments with High Earning Employees

## Table: Employee

Each row in this table represents an individual employee, detailing their unique ID, name, department, and salary.

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |
| department  | varchar |
| salary      | int     |

`id` is the primary key for this table.

## Task

Develop a solution to find departments with at least two employees who earn more than their department's average salary.

Return the result table in order of `department`.

## Example

**Input:**

`Employee` table:
| id  | name  | department | salary |
|-----|-------|------------|--------|
| 101 | John  | A          | 100    |
| 102 | Dan   | A          | 120    |
| 103 | James | A          | 110    |
| 104 | Amy   | B          | 100    |
| 105 | Anne  | B          | 130    |
| 106 | Ron   | B          | 115    |
| 107 | Bob   | B          | 125    |
| 108 | Kim   | C          | 90     |
| 109 | Lee   | C          | 95     |
| 110 | Sam   | C          | 100    |

**Output:**

| department |
|------------|
| B          |

In this example, department B has at least two employees who earn more than the average salary of their department.
