# Problem: Library Book Checkouts by Date

## Table: Checkouts

This table logs each book checkout from a library, including the date of the checkout and the title of the book.

| Column Name    | Type      |
|----------------|-----------|
| checkout_date  | date      |
| book_title     | varchar   |

There is no primary key for this table, and it may contain duplicate rows.

## Task

Develop a solution to report the number of distinct book titles checked out and a lexicographically sorted list of these titles for each date.

## Example

**Input:**

`Checkouts` table:
| checkout_date | book_title            |
|---------------|-----------------------|
| 2020-07-01    | The Hobbit            |
| 2020-07-01    | 1984                  |
| 2020-07-02    | War and Peace         |
| 2020-07-01    | The Hobbit            |
| 2020-07-02    | Crime and Punishment  |
| 2020-07-03    | Brave New World       |

**Output:**

| checkout_date | num_checkouts | book_titles                      |
|---------------|---------------|----------------------------------|
| 2020-07-01    | 2             | 1984,The Hobbit                  |
| 2020-07-02    | 2             | Crime and Punishment,War and Peace|
| 2020-07-03    | 1             | Brave New World                  |

In this example, the report shows the number of distinct titles checked out on each date and the sorted list of these titles.
