# Problem: Team Scores in Football Tournament

## Problem Statement

Table: `Teams`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| team_id     | int     |
| team_name   | varchar |
+-------------+---------+
```
`team_id` is the primary key for this table.

Table: `Matches`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| match_id      | int     |
| host_team     | int     |
| guest_team    | int     |
| host_goals    | int     |
| guest_goals   | int     |
+---------------+---------+
```
`match_id` is the primary key for this table.

Points are awarded as follows:
- **Win**: 3 points
- **Draw**: 1 point
- **Loss**: 0 points

Write a solution to calculate the points for each team. Return the result table with `team_id`, `team_name`, and `num_points`, ordered by `num_points` in descending order. In case of a tie, order by `team_id` in ascending order.

---

## Example

**Input:**

`Teams` table:
```
+---------+---------------+
| team_id | team_name     |
+---------+---------------+
| 10      | Leetcode FC   |
| 20      | Ahly SC       |
| 30      | Real Madrid   |
| 40      | Al-Nassr FC   |
| 50      | Zamalek SC    |
+---------+---------------+
```

`Matches` table:
```
+----------+-----------+------------+------------+-------------+
| match_id | host_team | guest_team | host_goals | guest_goals |
+----------+-----------+------------+------------+-------------+
| 1        | 10        | 20         | 3          | 0           |
| 2        | 30        | 10         | 2          | 2           |
| 3        | 10        | 50         | 5          | 1           |
| 4        | 20        | 30         | 1          | 0           |
| 5        | 50        | 30         | 1          | 0           |
+----------+-----------+------------+------------+-------------+
```

**Expected Output:**
```
+---------+---------------+------------+
| team_id | team_name     | num_points |
+---------+---------------+------------+
| 10      | Leetcode FC   | 7          |
| 20      | Ahly SC       | 3          |
| 50      | Zamalek SC    | 3          |
| 30      | Real Madrid   | 1          |
| 40      | Al-Nassr FC   | 0          |
+---------+---------------+------------+
```
