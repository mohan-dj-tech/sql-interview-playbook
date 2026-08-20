# Problem: First and Last Call On the Same Day

## Table: Calls

| Column Name  | Type     |
|--------------|----------|
| caller_id    | int      |
| recipient_id | int      |
| call_time    | datetime |

`(caller_id, recipient_id, call_time)` is the primary key for this table.
Each row contains information about the time of a phone call between `caller_id` and `recipient_id`.

## Task

Write a solution to report the IDs of the users whose first and last calls on any day were with the same person. Calls are counted regardless of being the caller or the recipient.

## Example

**Input:**

`Calls` table:
| caller_id | recipient_id | call_time           |
|-----------|--------------|---------------------|
| 8         | 4            | 2021-08-24 17:46:07 |
| 4         | 8            | 2021-08-24 19:57:13 |
| 5         | 1            | 2021-08-11 05:28:44 |
| 8         | 3            | 2021-08-17 04:04:15 |
| 11        | 3            | 2021-08-17 13:07:00 |
| 8         | 11           | 2021-08-17 22:22:22 |

**Output:**

| user_id |
|---------|
| 1       |
| 4       |
| 5       |
| 8       |
