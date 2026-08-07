# Problem: Daily User Engagement Levels

## Problem Statement

Table: `Users`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| user_name   | varchar |
+-------------+---------+
```
`user_id` is the primary key for this table.

Table: `Engagement`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| engagement  | int  |
| date        | date |
+-------------+------+
```
`(user_id, date)` is the primary key for this table.

Write a solution to find the engagement level of each user for **February 2020**. The engagement levels are defined as:
- **Low**: average engagement < 20
- **Medium**: average engagement is between 20 and 60 (inclusive)
- **High**: average engagement > 60

Return the result table in any order.

---

## Example

**Input:**

`Users` table:
```
+---------+-----------+
| user_id | user_name |
+---------+-----------+
| 1       | Alice     |
| 2       | Bob       |
| 3       | Charlie   |
| 4       | David     |
| 5       | Eve       |
+---------+-----------+
```

`Engagement` table:
```
+---------+------------+------------+
| user_id | engagement | date       |
+---------+------------+------------+
| 1       | 10         | 2020-02-01 |
| 1       | 25         | 2020-02-02 |
| 2       | 30         | 2020-02-01 |
| 2       | 40         | 2020-02-03 |
| 3       | 65         | 2020-02-05 |
| 3       | 70         | 2020-02-06 |
| 4       | 23         | 2020-02-07 |
| 4       | 24         | 2020-02-08 |
| 5       | 55         | 2020-02-09 |
| 5       | 60         | 2020-02-10 |
+---------+------------+------------+
```

**Expected Output:**
```
+-----------+------------------+
| user_name | engagement_level |
+-----------+------------------+
| Alice     | Low              |
| Bob       | Medium           |
| Charlie   | High             |
| David     | Medium           |
| Eve       | Medium           |
+-----------+------------------+
```

**Explanation:**
The query calculates the average engagement for each user in February 2020 and then categorizes it based on the defined levels.
- Alice: `(10 + 25) / 2 = 17.5` (Low)
- Bob: `(30 + 40) / 2 = 35` (Medium)
- Charlie: `(65 + 70) / 2 = 67.5` (High)
- David: `(23 + 24) / 2 = 23.5` (Medium)
- Eve: `(55 + 60) / 2 = 57.5` (Medium)
