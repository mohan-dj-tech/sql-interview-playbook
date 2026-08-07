# Problem: Customer Purchase Summary

## Problem Statement

Table: `Purchases`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| purchase_date | date    |
| customer_id   | int     |
| product       | varchar |
+---------------+---------+
```
There is no primary key for this table; it may contain duplicates.

Write a solution to find, for each customer, the total number of distinct products purchased and a lexicographically sorted, comma-separated list of the distinct products they bought.

Return the result table ordered by `customer_id`.

---

## Example

**Input:**

`Purchases` table:
```
+---------------+-------------+---------+
| purchase_date | customer_id | product |
+---------------+-------------+---------+
| 2020-05-01    | 1           | Milk    |
| 2020-05-01    | 2           | Eggs    |
| 2020-06-01    | 2           | Milk    |
| 2020-06-01    | 3           | Bread   |
| 2020-06-02    | 1           | Water   |
| 2020-07-01    | 2           | Eggs    |
| 2020-07-01    | 3           | Milk    |
+---------------+-------------+---------+
```

**Expected Output:**
```
+-------------+--------------+-------------+
| customer_id | num_products | products    |
+-------------+--------------+-------------+
| 1           | 2            | Milk,Water  |
| 2           | 2            | Eggs,Milk   |
| 3           | 2            | Bread,Milk  |
+-------------+--------------+-------------+
```

**Explanation:**
- **Customer 1:** Purchased "Milk" and "Water" (2 distinct products).
- **Customer 2:** Purchased "Eggs" and "Milk" (2 distinct products).
- **Customer 3:** Purchased "Bread" and "Milk" (2 distinct products).
The query groups the purchases by `customer_id`, counts the distinct products, and aggregates their names.
