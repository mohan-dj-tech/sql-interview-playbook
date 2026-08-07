-- Problem: Books and Authors
/* Solution:
 To count the number of fiction books for each author, this query joins the `Authors`
 and `Books` tables on `book_id`. It filters the results to include only books where
 the `genre` is 'Fiction'. The query then groups the results by `author_name` and
 uses `COUNT()` to find the number of fiction books for each author. The final
 result is ordered by the count of fiction books in descending order and then by
 `author_name` in ascending order.
*/
SELECT
    A.author_name,
    COUNT(B.book_id) AS fiction_books_count
FROM
    Authors A
    JOIN Books B ON A.book_id = B.book_id
WHERE
    B.genre = 'Fiction'
GROUP BY
    A.author_name
ORDER BY
    fiction_books_count DESC,
    A.author_name ASC;
