# Problem: Evaluate Boolean Expression

## Problem Statement

Table: `Variables`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| name        | varchar |
| value       | int     |
+-------------+---------+
```
`name` is the primary key for this table. It stores variable names and their integer values.

Table: `Expressions`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| left_operand  | varchar |
| operator      | enum    |
| right_operand | varchar |
+---------------+---------+
```
`(left_operand, operator, right_operand)` is the primary key. `operator` is an ENUM of type ('<', '>', '='). The operands are guaranteed to be existing variable names from the `Variables` table.

Write a solution to evaluate the boolean expressions in the `Expressions` table. Return the result table with the expression and its evaluated `value` ('true' or 'false').

---

## Example

**Input:**

`Variables` table:
```
+------+-------+
| name | value |
+------+-------+
| x    | 66    |
| y    | 77    |
+------+-------+
```

`Expressions` table:
```
+--------------+----------+---------------+
| left_operand | operator | right_operand |
+--------------+----------+---------------+
| x            | >        | y             |
| x            | <        | y             |
| x            | =        | y             |
| y            | >        | x             |
| y            | <        | x             |
| x            | =        | x             |
+--------------+----------+---------------+
```

**Expected Output:**
```
+--------------+----------+---------------+-------+
| left_operand | operator | right_operand | value |
+--------------+----------+---------------+-------+
| x            | >        | y             | false |
| x            | <        | y             | true  |
| x            | =        | y             | false |
| y            | >        | x             | true  |
| y            | <        | x             | false |
| x            | =        | x             | true  |
+--------------+----------+---------------+-------+
```

**Explanation:**
The query substitutes the variable names in the `Expressions` table with their corresponding values from the `Variables` table and then evaluates each boolean expression.
- `x > y` (66 > 77) is false.
- `x < y` (66 < 77) is true.
- `x = y` (66 = 77) is false.
- `y > x` (77 > 66) is true.
- `y < x` (77 < 66) is false.
- `x = x` (66 = 66) is true.
