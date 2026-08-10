# Problem: Queries Quality and Percentage

## Problem Statement

Table: `Queries`

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+
```
This table may have duplicate rows. It contains information collected from some queries on a database. The `position` column has a value from 1 to 500. The `rating` column has a value from 1 to 5. A query with a `rating` less than 3 is considered a poor query.

We define **query quality** as: The average of the ratio between query `rating` and its `position`.
We also define **poor query percentage** as: The percentage of all queries with a `rating` less than 3.

Write a solution to find each `query_name`, the `quality`, and `poor_query_percentage`. Both `quality` and `poor_query_percentage` should be rounded to 2 decimal places.

---

## Example

**Input:**

`Queries` table:
```
+------------+-----------------+----------+--------+
| query_name | result          | position | rating |
+------------+-----------------+----------+--------+
| Dog        | Golden Retriever| 1        | 5      |
| Dog        | German Shepherd | 2        | 5      |
| Dog        | Mule            | 200      | 1      |
| Cat        | Shirazi         | 5        | 2      |
| Cat        | Siamese         | 3        | 3      |
| Cat        | Sphynx          | 7        | 4      |
+------------+-----------------+----------+--------+
```

**Expected Output:**
```
+------------+---------+-----------------------+
| query_name | quality | poor_query_percentage |
+------------+---------+-----------------------+
| Dog        | 2.50    | 33.33                 |
| Cat        | 0.66    | 33.33                 |
+------------+---------+-----------------------+
```

**Explanation:**
- **Dog** quality: `(5/1 + 5/2 + 1/200) / 3 = 2.50`
- **Dog** poor query percentage: `(1/3) * 100 = 33.33`
- **Cat** quality: `(2/5 + 3/3 + 4/7) / 3 = 0.66`
- **Cat** poor query percentage: `(1/3) * 100 = 33.33`
The query calculates these metrics for each `query_name`.
