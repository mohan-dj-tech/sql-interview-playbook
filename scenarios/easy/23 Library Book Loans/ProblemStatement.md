# Problem: Library Book Loans

## Problem Statement

Table: `Books`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| book_id     | int     |
| title       | varchar |
+-------------+---------+
```
`book_id` is the primary key for this table.

Table: `Loans`
```
+-----------+---------+
| Column Name | Type  |
+-----------+---------+
| loan_id   | int     |
| book_id   | int     |
| user_id   | int     |
| loan_date | date    |
+-----------+---------+
```
`loan_id` is the primary key for this table.

The **Loan Frequency (LF)** of a book is defined as:
`LF = (Total number of times a book was loaned) / (Total number of all books loaned)`

Write a solution to find the LF of each book, rounded to two decimal places. Return the result table ordered by `LF` in descending order and by `book_id` in ascending order in case of a tie.

---

## Example

**Input:**

`Books` table:
```
+---------+-------------+
| book_id | title       |
+---------+-------------+
| 1       | Moby Dick   |
| 2       | Hamlet      |
| 3       | Don Quixote |
+---------+-------------+
```

`Loans` table:
```
+---------+---------+---------+------------+
| loan_id | book_id | user_id | loan_date  |
+---------+---------+---------+------------+
| 1       | 1       | 1       | 2020-07-01 |
| 2       | 1       | 2       | 2020-07-02 |
| 3       | 2       | 1       | 2020-07-01 |
| 4       | 3       | 3       | 2020-07-04 |
| 5       | 1       | 4       | 2020-07-03 |
| 6       | 2       | 2       | 2020-07-05 |
| 7       | 1       | 5       | 2020-07-06 |
+---------+---------+---------+------------+
```

**Expected Output:**
```
+---------+------+
| book_id | LF   |
+---------+------+
| 1       | 0.57 |
| 2       | 0.29 |
| 3       | 0.14 |
+---------+------+
```

**Explanation:**
- Total loans = 7
- Book 1 was loaned 4 times. LF = `4 / 7 = 0.57`
- Book 2 was loaned 2 times. LF = `2 / 7 = 0.29`
- Book 3 was loaned 1 time. LF = `1 / 7 = 0.14`
The query calculates this frequency for each book and orders the results.
