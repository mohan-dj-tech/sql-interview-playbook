-- Problem: Library Book Loans
/* Solution:
 To calculate the Loan Frequency (LF) for each book, this query first determines the
 total number of loans using a subquery `(SELECT COUNT(*) FROM Loans)`. It then joins
 the `Books` and `Loans` tables and groups by `book_id` to count the loans for each
 individual book. The LF is calculated by dividing the count of loans for each book
 by the total number of loans. The result is rounded to two decimal places and
 ordered as specified. A `LEFT JOIN` is used to include books that may have never
 been loaned.
*/
SELECT
    b.book_id,
    ROUND(
        COUNT(l.loan_id) / (
            SELECT
                COUNT(*)
            FROM
                Loans
        ),
        2
    ) AS LF
FROM
    Books b
    LEFT JOIN Loans l ON b.book_id = l.book_id
GROUP BY
    b.book_id
ORDER BY
    LF DESC,
    b.book_id ASC;
