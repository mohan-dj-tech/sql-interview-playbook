# Library Book Checkout Percentage

## Problem Statement

Table: `Patrons`

| Column Name | Type    |
|-------------|---------|
| patron_id   | int     |
| patron_name | varchar |

`patron_id` is the primary key for this table. Each row contains the name and the ID of a library patron.

Table: `Checkouts`

| Column Name | Type |
|-------------|------|
| book_id     | int  |
| patron_id   | int  |

`(book_id, patron_id)` is the primary key for this table. Each row contains the ID of a book and the ID of the patron who checked it out.

Develop a solution to calculate the percentage of patrons who have checked out each book, rounded to two decimals.

Return the result table ordered by `percentage` in descending order. In case of a tie, order it by `book_id` in ascending order.

---

## Example

**Input:**

`Patrons` table:

| patron_id | patron_name |
|-----------|-------------|
| 1         | Alice       |
| 2         | Bob         |
| 3         | Alex        |

`Checkouts` table:

| book_id | patron_id |
|---------|-----------|
| 101     | 1         |
| 102     | 2         |
| 101     | 2         |
| 103     | 1         |
| 101     | 3         |
| 102     | 3         |
| 103     | 2         |
| 104     | 1         |
| 105     | 2         |

**Expected Output:**

| book_id | percentage |
|---------|------------|
| 101     | 100.00     |
| 102     | 66.67      |
| 103     | 66.67      |
| 104     | 33.33      |
| 105     | 33.33      |