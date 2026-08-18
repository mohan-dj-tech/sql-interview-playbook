# Problem: Library Book Checkouts First Year

## Table: Checkouts

This table records the checkouts of books in a library. Each record includes a checkout ID, book ID, the year the book was checked out, the number of times it was checked out that year, and the price per checkout.

| Column Name    | Type  |
|----------------|-------|
| checkout_id    | int   |
| book_id        | int   |
| year           | int   |
| checkouts      | int   |
| price          | int   |

`(checkout_id, year)` is the primary key of this table.
`book_id` is a foreign key to the `Books` table.
Each row of this table shows a checkout record of the book `book_id` in a certain year.
Note that the price is per checkout.

## Table: Books

This table lists all the books available in the library.

| Column Name | Type     |
|-------------|----------|
| book_id     | int      |
| book_title  | varchar  |

`book_id` is the primary key of this table.
Each row of this table indicates the title of each book.

## Task

Develop a solution to select the book id, the first year the book was checked out, the total number of checkouts, and the price for the first year of every book checked out.

Return the resulting table in any order.

## Example

**Input:**

`Checkouts` table:
| checkout_id | book_id | year  | checkouts| price |
|-------------|---------|-------|----------|-------|
| 1           | 100     | 2008  | 40       | 2     |
| 2           | 100     | 2009  | 50       | 2     |
| 3           | 200     | 2011  | 60       | 3     |

`Books` table:
| book_id | book_title      |
|---------|-----------------|
| 100     | War and Peace   |
| 200     | The Great Gatsby|
| 300     | Moby Dick       |

**Output:**

| book_id | first_year | checkouts| price |
|---------|------------|----------|-------|
| 100     | 2008       | 40       | 2     |
| 200     | 2011       | 60       | 3     |
