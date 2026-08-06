# Problem: Triangle Judgement

## Problem Statement

Table: `Triangle`

```
+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
```
`(x, y, z)` is the primary key for this table. Each row of this table contains the lengths of three line segments.

Write a solution to report whether every three line segments can form a triangle.

Return the result table in any order.

---

## Example

**Input:**

`Triangle` table:
```
+----+----+----+
| x  | y  | z  |
+----+----+----+
| 13 | 15 | 30 |
| 10 | 20 | 15 |
+----+----+----+
```

**Expected Output:**
```
+----+----+----+----------+
| x  | y  | z  | triangle |
+----+----+----+----------+
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
+----+----+----+----------+
```

## Explanation

To assess the validity of a triangle from three side lengths, we use the **triangle inequality theorem**. This theorem states that the sum of the lengths of any two sides of a triangle must be greater than the length of the third side.

The SQL query employs a `CASE` statement to evaluate if all three conditions (`x + y > z`, `y + z > x`, and `x + z > y`) are met. If they are, the sides can form a valid triangle ('Yes'). Otherwise, they cannot ('No').

**Applying this to the example:**

- **Row 1 (13, 15, 30):** The condition `13 + 15 > 30` (which simplifies to `28 > 30`) is false. Therefore, it cannot form a triangle.
- **Row 2 (10, 20, 15):** All three conditions are true: `10 + 20 > 15`, `20 + 15 > 10`, and `10 + 15 > 20`. Therefore, it can form a triangle.
