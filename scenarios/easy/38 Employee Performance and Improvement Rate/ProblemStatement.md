# Employee Performance and Improvement Rate

## Problem Statement

Table: `Performance`

| Column Name   | Type    |
|---------------|---------|
| employee_name | varchar |
| evaluation    | varchar |
| round         | int     |
| score         | int     |

This table may have duplicate rows and contains information collected from performance evaluations of employees. The `round` column has a value from 1 to 10, and the `score` column has a value from 1 to 100. An evaluation with a score less than 50 is considered a poor evaluation.

Develop a solution to find each `employee_name`, their `performance`, and `improvement_rate`.

We define employee `performance` as:
- The average of the ratio between employee evaluation `score` and its `round`.

We also define `improvement_rate` as:
- The percentage of all evaluations with a `score` improvement over the previous rounds, and are greater than 50.

Both `performance` and `improvement_rate` should be rounded to 2 decimal places.

Return the result table in any order.

---

## Example

**Input:**

`Performance` table:

| employee_name | evaluation   | round | score |
|---------------|--------------|-------|-------|
| Alice         | Efficiency   | 1     | 80    |
| Alice         | Productivity | 2     | 90    |
| Alice         | Creativity   | 3     | 60    |
| Bob           | Efficiency   | 1     | 40    |
| Bob           | Productivity | 2     | 60    |
| Bob           | Creativity   | 3     | 70    |

**Expected Output:**

| employee_name | performance | improvement_rate |
|---------------|-------------|------------------|
| Alice         | 48.33       | 33.33            |
| Bob           | 31.11       | 66.67            |