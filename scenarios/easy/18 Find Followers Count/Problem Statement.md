# Problem: Find Followers Count

## Problem Statement

Table: `Followers`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| follower_id | int  |
+-------------+------+
```
`(user_id, follower_id)` is the primary key for this table. This table contains the IDs of a user and a follower in a social media app where the follower follows the user.

Write a solution that will, for each user, return the number of their followers. Return the result table ordered by `user_id` in ascending order.

---

## Example

**Input:**

`Followers` table:
```
+---------+-------------+
| user_id | follower_id |
+---------+-------------+
| 0       | 1           |
| 1       | 0           |
| 2       | 0           |
| 2       | 1           |
+---------+-------------+
```

**Expected Output:**
```
+---------+-----------------+
| user_id | followers_count |
+---------+-----------------+
| 0       | 1               |
| 1       | 1               |
| 2       | 2               |
+---------+-----------------+
```

**Explanation:**
- User 0 has one follower (follower_id 1).
- User 1 has one follower (follower_id 0).
- User 2 has two followers (follower_id 0 and 1).
The query groups the data by `user_id` and counts the number of `follower_id`s for each user.
