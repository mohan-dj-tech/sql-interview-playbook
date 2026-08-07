# Problem: Ad-Free Sessions

## Problem Statement

Table: `Playback`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| session_id  | int  |
| customer_id | int  |
| start_time  | int  |
| end_time    | int  |
+-------------+------+
```
`session_id` is the primary key for this table. The session runs during the inclusive interval `[start_time, end_time]`.

Table: `Ads`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| ad_id       | int  |
| customer_id | int  |
| timestamp   | int  |
+-------------+------+
```
`ad_id` is the primary key for this table.

Write a solution to report all the sessions that did not get shown any ads. An ad is shown to a customer if its timestamp is within the session's `start_time` and `end_time`.

Return the result table in any order.

---

## Example

**Input:**

`Playback` table:
```
+------------+-------------+------------+----------+
| session_id | customer_id | start_time | end_time |
+------------+-------------+------------+----------+
| 1          | 1           | 1          | 5        |
| 2          | 1           | 15         | 23       |
| 3          | 2           | 10         | 12       |
| 4          | 2           | 17         | 28       |
| 5          | 2           | 2          | 8        |
+------------+-------------+------------+----------+
```

`Ads` table:
```
+-------+-------------+-----------+
| ad_id | customer_id | timestamp |
+-------+-------------+-----------+
| 1     | 1           | 5         |
| 2     | 2           | 17        |
| 3     | 2           | 20        |
+-------+-------------+-----------+
```

**Expected Output:**
```
+------------+
| session_id |
+------------+
| 2          |
| 3          |
| 5          |
+------------+
```

**Explanation:**
- Session 1 (customer 1) had an ad at timestamp 5, which is within its time range [1, 5].
- Session 4 (customer 2) had ads at timestamps 17 and 20, which are within its time range [17, 28].
- Sessions 2, 3, and 5 had no ads shown during their respective time ranges.
The query identifies and returns the `session_id`s of these ad-free sessions.
