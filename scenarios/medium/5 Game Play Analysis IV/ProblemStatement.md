# Problem: Game Play Analysis IV

## Problem Statement

Table: `Activity`
```
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
```
`(player_id, event_date)` is the primary key of this table.

Write a solution to report the **fraction of players** that logged in again on the day after their first login, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

---

## Example

**Input:**

`Activity` table:
```
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+
```

**Expected Output:**
```
+----------+
| fraction |
+----------+
| 0.33     |
+----------+
```

**Explanation:**
- There are 3 unique players: 1, 2, and 3.
- Player 1's first login is 2016-03-01, and they logged in again on 2016-03-02. This player counts.
- Player 2's first login is 2017-06-25, but they did not log in on 2017-06-26.
- Player 3's first login is 2016-03-02, but they did not log in on 2016-03-03.
- Only 1 out of 3 players logged in consecutively after their first login.
- The fraction is `1 / 3 = 0.33`.
The query calculates this fraction.
