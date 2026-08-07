# Problem: Sellers With No Sales

## Problem Statement

Table: `Customer`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| customer_name | varchar |
+---------------+---------+
```
`customer_id` is the primary key for this table.

Table: `Orders`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| sale_date     | date    |
| order_cost    | int     |
| customer_id   | int     |
| seller_id     | int     |
+---------------+---------+
```
`order_id` is the primary key for this table.

Table: `Seller`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| seller_id   | int     |
| seller_name | varchar |
+-------------+---------+
```
`seller_id` is the primary key for this table.

Write a solution to report the names of all sellers who did not make any sales in **2020**. Return the result table ordered by `seller_name` in ascending order.

---

## Example

**Input:**

`Customer` table:
```
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 101         | Alice         |
| 102         | Bob           |
| 103         | Charlie       |
+-------------+---------------+
```

`Orders` table:
```
+----------+------------+------------+-------------+-----------+
| order_id | sale_date  | order_cost | customer_id | seller_id |
+----------+------------+------------+-------------+-----------+
| 1        | 2020-03-01 | 1500       | 101         | 1         |
| 2        | 2020-05-25 | 2400       | 102         | 2         |
| 3        | 2019-05-25 | 800        | 101         | 3         |
| 4        | 2020-09-13 | 1000       | 103         | 2         |
| 5        | 2019-02-11 | 700        | 101         | 2         |
+----------+------------+------------+-------------+-----------+
```

`Seller` table:
```
+-----------+-------------+
| seller_id | seller_name |
+-----------+-------------+
| 1         | Daniel      |
| 2         | Elizabeth   |
| 3         | Frank       |
+-----------+-------------+
```

**Expected Output:**
```
+-------------+
| seller_name |
+-------------+
| Frank       |
+-------------+
```

**Explanation:**
- Daniel and Elizabeth both made sales in 2020.
- Frank made a sale in 2019 but not in 2020.
The query identifies sellers whose `seller_id` does not appear in the `Orders` table for the year 2020.
