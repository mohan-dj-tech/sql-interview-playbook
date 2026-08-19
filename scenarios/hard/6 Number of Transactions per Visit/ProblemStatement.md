# Problem: Number of Transactions per Visit

## Table: Visits

| Column Name   | Type    |
|---------------|---------|
| user_id       | int     |
| visit_date    | date    |

`(user_id, visit_date)` is the primary key for this table.
Each row of this table indicates that `user_id` has visited the bank on `visit_date`.

## Table: Transactions

| Column Name      | Type    |
|------------------|---------|
| user_id          | int     |
| transaction_date | date    |
| amount           | int     |

This table may contain duplicate rows.
Each row of this table indicates that `user_id` has made a transaction of the `amount` on `transaction_date`.
It is guaranteed that the user has visited the bank on the `transaction_date`.

## Task

A bank wants to draw a chart of the number of transactions bank visitors did in one visit to the bank and the corresponding number of visitors who have done this number of transactions in one visit.

Write a solution to find how many users visited the bank and didn't do any transactions, how many visited the bank and did one transaction, and so on.

The result table will contain two columns:

- `transactions_count`: the number of transactions done in one visit.
- `visits_count`: the corresponding number of users who did `transactions_count` in one visit to the bank.

`transactions_count` should take all values from 0 to `max(transactions_count)` done by one or more users.

Return the result table ordered by `transactions_count`.

## Example

**Input:**

`Visits` table:
| user_id | visit_date |
|---------|------------|
| 1       | 2020-01-01 |
| 2       | 2020-01-02 |
| 12      | 2020-01-01 |
| 19      | 2020-01-03 |
| 1       | 2020-01-02 |
| 2       | 2020-01-03 |
| 1       | 2020-01-04 |
| 7       | 2020-01-11 |
| 9       | 2020-01-25 |
| 8       | 2020-01-28 |

`Transactions` table:
| user_id | transaction_date | amount |
|---------|------------------|--------|
| 1       | 2020-01-02       | 120    |
| 2       | 2020-01-03       | 22     |
| 7       | 2020-01-11       | 232    |
| 1       | 2020-01-04       | 7      |
| 9       | 2020-01-25       | 33     |
| 9       | 2020-01-25       | 66     |
| 8       | 2020-01-28       | 1      |
| 9       | 2020-01-25       | 99     |

**Output:**

| Transactions_count | visits_count |
|--------------------|--------------|
| 0                  | 4            |
| 1                  | 5            |
| 2                  | 0            |
| 3                  | 1            |
