# Problem: Biggest Single Number

## Problem Statement

Table: `MyNumbers`

```
+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
```
This table may contain duplicates, so there is no primary key. Each row contains an integer.

A **single number** is a number that appears only once in the `MyNumbers` table.

Write a solution to find the largest single number. If there is no single number, report `null`.

---

## Example

**Input:**

`MyNumbers` table:
```
+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+
```

**Expected Output:**
```
+-----+
| num |
+-----+
| 6   |
+-----+
```

**Explanation:**

The single numbers are 1, 4, 5, and 6. The largest of these is 6.
