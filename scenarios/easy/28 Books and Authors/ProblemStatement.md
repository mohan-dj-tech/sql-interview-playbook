# Problem: Books and Authors

## Problem Statement

Table: `Books`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| book_id     | int     |
| title       | varchar |
| genre       | varchar |
+-------------+---------+
```
`book_id` is the primary key for this table.

Table: `Authors`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| author_id   | int     |
| book_id     | int     |
| author_name | varchar |
+-------------+---------+
```
`(author_id, book_id)` is the primary key for this table.

Write a solution to find the number of books each author has written in the **'Fiction'** genre. The result should include `author_name` and the count of their fiction books as `fiction_books_count`. Authors who have not written any fiction books should not appear in the output.

Return the result table ordered by `fiction_books_count` in descending order, and then by `author_name` in ascending order in case of a tie.

---

## Example

**Input:**

`Books` table:
```
+---------+----------------------+---------+
| book_id | title                | genre   |
+---------+----------------------+---------+
| 1       | War and Peace        | Fiction |
| 2       | Anna Karenina        | Fiction |
| 3       | Crime and Punishment | Fiction |
| 4       | The Great Gatsby     | Fiction |
| 5       | Pride and Prejudice  | Romance |
+---------+----------------------+---------+
```

`Authors` table:
```
+-----------+---------+---------------------+
| author_id | book_id | author_name         |
+-----------+---------+---------------------+
| 101       | 1       | Leo Tolstoy         |
| 101       | 2       | Leo Tolstoy         |
| 102       | 3       | Fyodor Dostoevsky   |
| 103       | 4       | F. Scott Fitzgerald |
| 104       | 5       | Jane Austen         |
+-----------+---------+---------------------+
```

**Expected Output:**
```
+---------------------+---------------------+
| author_name         | fiction_books_count |
+---------------------+---------------------+
| Leo Tolstoy         | 2                   |
| F. Scott Fitzgerald | 1                   |
| Fyodor Dostoevsky   | 1                   |
+---------------------+---------------------+
```

**Explanation:**
- Leo Tolstoy wrote 2 fiction books.
- F. Scott Fitzgerald and Fyodor Dostoevsky each wrote 1 fiction book.
- Jane Austen wrote a romance book and is not included in the output.
The results are ordered by the count of fiction books descending, then by author name ascending.
