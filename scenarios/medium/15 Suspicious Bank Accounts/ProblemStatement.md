# Problem: Suspicious Bank Accounts

## Problem Statement

Table: `Accounts`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| account_id  | int  |
| max_income  | int  |
+-------------+------+
```
`account_id` is the primary key.

Table: `Transactions`
```
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| transaction_id | int      |
| account_id     | int      |
| type           | ENUM     |
| amount         | int      |
| day            | datetime |
+----------------+----------+
```
`transaction_id` is the primary key. `type` is an ENUM ('Creditor', 'Debtor').

A bank account is **suspicious** if the total income ('Creditor' transactions) exceeds the `max_income` for that account for **two or more consecutive months**.

Write a solution to report the IDs of all suspicious bank accounts. Return the result table in any order.

---

## Example

**Input:**

`Accounts` table:
```
+------------+------------+
| account_id | max_income |
+------------+------------+
| 3          | 21000      |
| 4          | 10400      |
+------------+------------+
```

`Transactions` table:
```
+----------------+------------+----------+--------+---------------------+
| transaction_id | account_id | type     | amount | day                 |
+----------------+------------+----------+--------+---------------------+
| 2              | 3          | Creditor | 107100 | 2021-06-02 11:38:14 |
| 4              | 4          | Creditor | 10400  | 2021-06-20 12:39:18 |
| 11             | 4          | Debtor   | 58800  | 2021-07-23 12:41:55 |
| 1              | 4          | Creditor | 49300  | 2021-05-03 16:11:04 |
| 15             | 3          | Debtor   | 75500  | 2021-05-23 14:40:20 |
| 10             | 3          | Creditor | 102100 | 2021-06-15 10:37:16 |
| 19             | 4          | Creditor | 56300  | 2021-07-21 12:12:25 |
| 9              | 4          | Debtor   | 101100 | 2021-05-09 15:21:49 |
| 8              | 3          | Creditor | 64900  | 2021-07-26 15:09:56 |
| 7              | 3          | Creditor | 90900  | 2021-06-14 11:23:07 |
+----------------+------------+----------+--------+---------------------+
```

**Expected Output:**
```
+------------+
| account_id |
+------------+
| 3          |
+------------+
```

**Explanation:**
- **Account 3**:
  - May 2021: Income = 0.
  - June 2021: Income = 107100 + 102100 + 90900 = 300100. Exceeds max_income (21000).
  - July 2021: Income = 64900. Exceeds max_income (21000).
  Since the income exceeded the max for two consecutive months (June and July), account 3 is suspicious.
- **Account 4**:
  - May 2021: Income = 49300. Exceeds max_income (10400).
  - June 2021: Income = 10400. Does not exceed max_income.
  - July 2021: Income = 56300. Exceeds max_income.
  The months where income exceeded the max were not consecutive. Account 4 is not suspicious.
