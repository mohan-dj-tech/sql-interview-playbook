# Problem: Game Play Analysis II

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
`(player_id, event_date)` is the primary key of this table. This table shows the activity of players of some game. Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on a certain day using some device.

Write a solution to report the **device_id** that is first used by each player.

---

## Example

**Input:**

`Activity` table:
```
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-05-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+
```

**Expected Output:**
```
+-----------+-----------+
| player_id | device_id |
+-----------+-----------+
| 1         | 2         |
| 2         | 3         |
| 3         | 1         |
+-----------+-----------+
```

**Explanation:**
The query needs to find the first login for each player and then report the device they used on that specific date.
- Player 1's first login was on 2016-03-01 with device 2.
- Player 2's first login was on 2017-06-25 with device 3.
- Player 3's first login was on 2016-03-02 with device 1.
