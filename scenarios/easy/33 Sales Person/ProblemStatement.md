# Problem: Sales Person

## Problem Statement

Table: `SalesPerson`
```
+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| sales_id        | int     |
| name            | varchar |
| salary          | int     |
| commission_rate | int     |
| hire_date       | date    |
+-----------------+---------+
```
`sales_id` is the primary key for this table.

Table: `Company`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| com_id      | int     |
| name        | varchar |
| city        | varchar |
+-------------+---------+
```
`com_id` is the primary key for this table.

Table: `Orders`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| order_id    | int  |
| order_date  | date |
| com_id      | int  |
| sales_id    | int  |
| amount      | int  |
+-------------+------+
```
`order_id` is the primary key for this table. `com_id` and `sales_id` are foreign keys.

Write a solution to find the names of all salespersons who did not have any orders related to the company with the name **"RED"**.

---

## Example

**Input:**

`SalesPerson` table:
```
+----------+------+--------+-----------------+------------+
| sales_id | name | salary | commission_rate | hire_date  |
+----------+------+--------+-----------------+------------+
| 1        | John | 100000 | 6               | 2006-04-01 |
| 2        | Amy  | 12000  | 5               | 2010-05-01 |
| 3        | Mark | 65000  | 12              | 2008-12-25 |
| 4        | Pam  | 25000  | 25              | 2005-01-01 |
| 5        | Alex | 5000   | 10              | 2007-02-03 |
+----------+------+--------+-----------------+------------+
```

`Company` table:
```
+--------+--------+----------+
| com_id | name   | city     |
+--------+--------+----------+
| 1      | RED    | Boston   |
| 2      | ORANGE | New York |
| 3      | YELLOW | Boston   |
| 4      | GREEN  | Austin   |
+--------+--------+----------+
```

`Orders` table:
```
+----------+------------+--------+----------+--------+
| order_id | order_date | com_id | sales_id | amount |
+----------+------------+--------+----------+--------+
| 1        | 2014-01-01 | 3      | 4        | 10000  |
| 2        | 2014-02-01 | 4      | 5        | 5000   |
| 3        | 2014-03-01 | 1      | 1        | 50000  |
| 4        | 2014-04-01 | 1      | 4        | 25000  |
+----------+------------+--------+----------+--------+
```

**Expected Output:**
```
+------+
| name |
+------+
| Amy  |
| Mark |
| Alex |
+------+
```

**Explanation:**
- John and Pam had orders with the company "RED".
- Amy, Mark, and Alex did not have any orders with the company "RED".
The query identifies and returns the names of these salespersons.
