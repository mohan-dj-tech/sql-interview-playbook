# Game Play Analysis III

## Problem Statement

Table: `Activity`

| Column Name  | Type |
|--------------|------|
| player_id    | int  |
| device_id    | int  |
| event_date   | date |
| games_played | int  |

`(player_id, event_date)` is the primary key of this table.

Write a solution to report for each player and date, how many games they have **played so far**. That is, the total number of games played by the player *until* that date.

---

## Example

**Input:**

`Activity` table:

| player_id | device_id | event_date | games_played |
|-----------|-----------|------------|--------------|
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-05-02 | 6            |
| 1         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |

**Expected Output:**

| player_id | event_date | games_played_so_far |
|-----------|------------|---------------------|
| 1         | 2016-03-01 | 5                   |
| 1         | 2016-05-02 | 11                  |
| 1         | 2017-06-25 | 12                  |
| 3         | 2016-03-02 | 0                   |
| 3         | 2018-07-03 | 5                   |

<details>
<summary>Explanation</summary>

- For player 1, on 2016-03-01, the total games played so far is 5.
- On 2016-05-02, the total is `5 + 6 = 11`.
- On 2017-06-25, the total is `11 + 1 = 12`.
- For player 3, on 2016-03-02, the total is 0.
- On 2018-07-03, the total is `0 + 5 = 5`.

The query calculates a running total of games played for each player.
</details>