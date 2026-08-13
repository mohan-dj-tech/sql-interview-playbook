# Problem: Monthly Transactions II

## Problem Statement

Table: `Transactions`
```
+------------+---------+
| Column Name| Type    |
+------------+---------+
| id         | int     |
| country    | varchar |
| state      | enum    |
| amount     | int     |
| trans_date | date    |
+------------+---------+
```
`id` is the primary key. `state` is an ENUM of type ('approved', 'declined').

Table: `Chargebacks`
```
+------------+---------+
| Column Name| Type    |
+------------+---------+
| trans_id   | int     |
| trans_date | date    |
+------------+---------+
```
`trans_id` is a foreign key to the `id` column of the `Transactions` table.

Write a solution to find the number of approved transactions and their total amount, and the number of chargebacks and their total amount, for each month and country. Ignore rows where all four metrics are zero.

Return the result table ordered by month and country.

---

## Example

**Input:**

`Transactions` table:
```
+-----+---------+----------+--------+------------+
| id  | country | state    | amount | trans_date |
+-----+---------+----------+--------+------------+
| 101 | US      | approved | 1000   | 2019-05-18 |
| 102 | US      | declined | 2000   | 2019-05-19 |
| 103 | US      | approved | 3000   | 2019-06-10 |
| 104 | US      | declined | 4000   | 2019-06-13 |
| 105 | US      | approved | 5000   | 2019-06-15 |
+-----+---------+----------+--------+------------+
```

`Chargebacks` table:
```
+----------+------------+
| trans_id | trans_date |
+----------+------------+
| 102      | 2019-05-29 |
| 101      | 2019-06-30 |
| 105      | 2019-09-18 |
+----------+------------+
```

**Expected Output:**
```
+---------+---------+----------------+-----------------+------------------+-------------------+
| month   | country | approved_count | approved_amount | chargeback_count | chargeback_amount |
+---------+---------+----------------+-----------------+------------------+-------------------+
| 2019-05 | US      | 1              | 1000            | 1                | 2000              |
| 2019-06 | US      | 2              | 8000            | 1                | 1000              |
| 2019-09 | US      | 0              | 0               | 1                | 5000              |
+---------+---------+----------------+-----------------+------------------+-------------------+
```
