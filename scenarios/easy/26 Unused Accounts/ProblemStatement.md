# Problem: Unused Accounts

## Problem Statement

Table: `Accounts`
```
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| account_id   | int     |
| account_name | varchar |
+--------------+---------+
```
`account_id` is the primary key for this table.

Table: `Transactions`
```
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| transaction_id   | int     |
| account_id       | int     |
| transaction_date | date    |
+------------------+---------+
```
`transaction_id` is the primary key for this table.

Write a solution to find all accounts that did not make any transactions in **2020**. Return the result table ordered by `account_name` in ascending order.

---

## Example

**Input:**

`Accounts` table:
```
+------------+--------------+
| account_id | account_name |
+------------+--------------+
| 1          | Alice        |
| 2          | Bob          |
| 3          | Charlie      |
+------------+--------------+
```

`Transactions` table:
```
+----------------+------------+------------------+
| transaction_id | account_id | transaction_date |
+----------------+------------+------------------+
| 1              | 1          | 2020-09-01       |
| 2              | 2          | 2020-09-02       |
| 3              | 1          | 2020-09-03       |
| 4              | 3          | 2019-08-21       |
| 5              | 2          | 2021-07-03       |
+----------------+------------+------------------+
```

**Expected Output:**
```
+--------------+
| account_name |
+--------------+
| Charlie      |
+--------------+
```

**Explanation:**
- Alice and Bob both made transactions in 2020.
- Charlie made a transaction in 2019 but not in 2020.
The query identifies accounts whose `account_id` does not appear in the `Transactions` table for the year 2020.
