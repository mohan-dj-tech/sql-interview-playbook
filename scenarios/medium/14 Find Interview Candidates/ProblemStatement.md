# Problem: Find Interview Candidates

## Problem Statement

Table: `Contests`
```
+--------------+------+
| Column Name  | Type |
+--------------+------+
| contest_id   | int  |
| gold_medal   | int  |
| silver_medal | int  |
| bronze_medal | int  |
+--------------+------+
```
`contest_id` is the primary key.

Table: `Users`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| mail        | varchar |
| name        | varchar |
+-------------+---------+
```
`user_id` is the primary key.

Write a solution to report the `name` and `mail` of all interview candidates. A user is an interview candidate if at least one of these two conditions is true:
1.  The user won any medal in **three or more consecutive contests**.
2.  The user won the gold medal in **three or more different contests** (not necessarily consecutive).

Return the result table in any order.

---

## Example

**Input:**

`Contests` table:
```
+------------+------------+--------------+--------------+
| contest_id | gold_medal | silver_medal | bronze_medal |
+------------+------------+--------------+--------------+
| 190        | 1          | 5            | 2            |
| 191        | 2          | 3            | 5            |
| 192        | 5          | 2            | 3            |
| 193        | 1          | 3            | 5            |
| 194        | 4          | 5            | 2            |
| 195        | 4          | 2            | 1            |
| 196        | 1          | 5            | 2            |
+------------+------------+--------------+--------------+
```

`Users` table:
```
+---------+----------------------+-------+
| user_id | mail                 | name  |
+---------+----------------------+-------+
| 1       | sarah@designguru.com | Sarah |
| 2       | bob@designguru.com   | Bob   |
| 3       | alice@designguru.com | Alice |
| 4       | hercy@designguru.com | Hercy |
| 5       | quarz@designguru.com | Quarz |
+---------+----------------------+-------+
```

**Expected Output:**
```
+-------+----------------------+
| name  | mail                 |
+-------+----------------------+
| Sarah | sarah@designguru.com |
| Bob   | bob@designguru.com   |
| Alice | alice@designguru.com |
| Quarz | quarz@designguru.com |
+-------+----------------------+
```
