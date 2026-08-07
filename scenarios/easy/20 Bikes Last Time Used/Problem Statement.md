# Problem: Bikes Last Time Used

## Problem Statement

Table: `Bikes`
```
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| ride_id     | int      |
| bike_number | varchar  |
| start_time  | datetime |
| end_time    | datetime |
+-------------+----------+
```
`ride_id` is the primary key for this table.

Write a solution to find the last time each bike was used. Return the result table ordered by the bikes that were most recently used (i.e., by `end_time` in descending order).

---

## Example

**Input:**

`Bikes` table:
```
+---------+-------------+---------------------+---------------------+
| ride_id | bike_number | start_time          | end_time            |
+---------+-------------+---------------------+---------------------+
| 1       | W00576      | 2012-03-25 11:30:00 | 2012-03-25 12:40:00 |
| 2       | W00300      | 2012-03-25 10:30:00 | 2012-03-25 10:50:00 |
| 3       | W00455      | 2012-03-26 14:30:00 | 2012-03-26 17:40:00 |
| 4       | W00455      | 2012-03-25 12:30:00 | 2012-03-25 13:40:00 |
| 5       | W00576      | 2012-03-25 08:10:00 | 2012-03-25 09:10:00 |
| 6       | W00576      | 2012-03-28 02:30:00 | 2012-03-28 02:50:00 |
+---------+-------------+---------------------+---------------------+
```

**Expected Output:**
```
+-------------+---------------------+
| bike_number | end_time            |
+-------------+---------------------+
| W00576      | 2012-03-28 02:50:00 |
| W00455      | 2012-03-26 17:40:00 |
| W00300      | 2012-03-25 10:50:00 |
+-------------+---------------------+
```

**Explanation:**
The query groups the rides by `bike_number` and finds the maximum `end_time` for each bike, which represents the last time it was used. The results are then sorted by this `end_time` in descending order.
