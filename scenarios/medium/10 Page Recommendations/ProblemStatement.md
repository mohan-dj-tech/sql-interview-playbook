# Problem: Page Recommendations

## Problem Statement

Table: `Friendship`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user1_id    | int     |
| user2_id    | int     |
+-------------+---------+
```
`(user1_id, user2_id)` is the primary key for this table. Each row indicates a friendship relationship.

Table: `Likes`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| page_id     | int     |
+-------------+---------+
```
`(user_id, page_id)` is the primary key for this table.

Write a solution to recommend pages to the user with `user_id = 1`. A page should be recommended if it is liked by at least one of user 1's friends, but it should **not** be a page that user 1 already likes.

Return the result table of `recommended_page` in any order, without duplicates.

---

## Example

**Input:**

`Friendship` table:
```
+----------+----------+
| user1_id | user2_id |
+----------+----------+
| 1        | 2        |
| 1        | 3        |
| 1        | 4        |
| 2        | 3        |
| 2        | 4        |
| 2        | 5        |
| 6        | 1        |
+----------+----------+
```

`Likes` table:
```
+---------+---------+
| user_id | page_id |
+---------+---------+
| 1       | 88      |
| 2       | 23      |
| 3       | 24      |
| 4       | 56      |
| 5       | 11      |
| 6       | 33      |
| 2       | 77      |
| 3       | 77      |
| 6       | 88      |
+---------+---------+
```

**Expected Output:**
```
+------------------+
| recommended_page |
+------------------+
| 23               |
| 24               |
| 56               |
| 33               |
| 77               |
+------------------+
```

**Explanation:**
- User 1's friends are users 2, 3, 4, and 6.
- These friends liked pages 23, 24, 56, 11, 33, 77, and 88.
- User 1 already likes page 88.
- The recommended pages are the distinct pages liked by friends, excluding the ones user 1 already likes.
