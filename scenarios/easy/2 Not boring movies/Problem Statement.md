# Problem: Not Boring Movies

## Problem Statement

Table: `Cinema`

```
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+
```
`id` is the primary key for this table. Each row contains information about the name of a movie, its description, and its rating. `rating` is a 2-decimal-place float in the range [0, 10].

Write a solution to report the movies with an **odd-numbered ID** and a description that is **not "boring"**.

Return the result table ordered by `rating` in descending order.

---

## Example

**Input:**

`Cinema` table:
```
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | boring      | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |
+----+------------+-------------+--------+
```

**Expected Output:**
```
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |
+----+------------+-------------+--------+
```

**Explanation:**

- Movie with ID `1` is selected because it's an odd number and its description is not "boring".
- Movie with ID `5` is selected because it's an odd number and its description is not "boring".
- The result is ordered by rating in descending order.
