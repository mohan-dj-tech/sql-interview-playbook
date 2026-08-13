# Problem: Second Fastest Time in Races

## Problem Statement

Table: `RaceResults`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| time        | int  |
+-------------+------+
```
`id` is the primary key for this table. `time` is recorded in seconds.

Write a solution to find the **second fastest time** (i.e., the second smallest time) from the `RaceResults` table. If there is no second fastest time, the query should report `null`.

---

## Example 1

**Input:**

`RaceResults` table:
```
+----+------+
| id | time |
+----+------+
| 1  | 60   |
| 2  | 55   |
| 3  | 58   |
| 4  | 59   |
+----+------+
```

**Expected Output:**
```
+-------------------+
| SecondFastestTime |
+-------------------+
| 58                |
+-------------------+
```

## Example 2

**Input:**

`RaceResults` table:
```
+----+------+
| id | time |
+----+------+
| 1  | 55   |
+----+------+
```

**Expected Output:**
```
+-------------------+
| SecondFastestTime |
+-------------------+
| null              |
+-------------------+
```

**Explanation:**
The query needs to find the second smallest `time`. A common approach is to find the minimum time that is greater than the overall minimum time.
