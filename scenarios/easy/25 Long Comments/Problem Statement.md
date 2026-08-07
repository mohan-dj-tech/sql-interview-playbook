# Problem: Long Comments

## Problem Statement

Table: `Comments`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| comment_id  | int     |
| text        | varchar |
+-------------+---------+
```
`comment_id` is the primary key for this table.

Write a solution to identify comments that are considered "too long." A comment is too long if its length is greater than 100 characters. Return the `comment_id`s of such comments in any order.

---

## Example

**Input:**

`Comments` table:
```
+------------+----------------------------------------------------------------------------------------------------+
| comment_id | text                                                                                               |
+------------+----------------------------------------------------------------------------------------------------+
| 1          | I absolutely love this!                                                                            |
| 2          | This is a very, very, very, very, very, very, very, very, very, very, very, very, very long comment. |
| 3          | Short and sweet.                                                                                   |
+------------+----------------------------------------------------------------------------------------------------+
```

**Expected Output:**
```
+------------+
| comment_id |
+------------+
| 2          |
+------------+
```

**Explanation:**
Comment 2 is the only comment with a length greater than 100 characters. The query filters the `Comments` table based on the length of the `text` column.
