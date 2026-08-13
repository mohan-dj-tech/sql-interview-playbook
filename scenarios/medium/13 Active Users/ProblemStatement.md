# Problem: Active Users

## Problem Statement

Table: `Accounts`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
```
`id` is the primary key for this table.

Table: `Logins`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| login_date  | date    |
+-------------+---------+
```
This table may contain duplicate rows.

**Active users** are those who logged in to their accounts for **five or more consecutive days**.

Write a solution to find the `id` and `name` of active users. Return the result table ordered by `id`.

---

## Example

**Input:**

`Accounts` table:
```
+----+----------+
| id | name     |
+----+----------+
| 1  | Winston  |
| 7  | Jonathan |
+----+----------+
```

`Logins` table:
```
+----+------------+
| id | login_date |
+----+------------+
| 7  | 2020-05-30 |
| 1  | 2020-05-30 |
| 7  | 2020-05-31 |
| 7  | 2020-06-01 |
| 7  | 2020-06-02 |
| 7  | 2020-06-02 |
| 7  | 2020-06-03 |
| 1  | 2020-06-07 |
| 7  | 2020-06-10 |
+----+------------+
```

**Expected Output:**
```
+----+----------+
| id | name     |
+----+----------+
| 7  | Jonathan |
+----+----------+
```

**Explanation:**
User Winston (id=1) did not log in for 5 consecutive days.
User Jonathan (id=7) logged in for 5 consecutive days from 2020-05-30 to 2020-06-03.
The query identifies Jonathan as the active user.
