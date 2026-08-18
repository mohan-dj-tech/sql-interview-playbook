-- Problem: Library Book Checkout Percentage
/*
Solution:
To solve this problem, we need to calculate the unique number of patrons who have checked out each book and divide this by the total number of patrons in the library, then multiply by 100 to get the percentage.

1. **Count Unique Checkouts**: Count the unique number of patrons who have checked out each book.
2. **Calculate Total Number of Patrons**: Determine the total number of patrons in the library.
3. **Calculate Percentage**: Divide the unique checkout count by the total number of patrons and multiply by 100 to get the percentage. We also round the resulting percentage to two decimal places.
4. **Order the Result**: by percentage in descending order and by book_id in ascending order in case of a tie.
*/

-- SQL Query
SELECT
    book_id,
    ROUND((COUNT(DISTINCT patron_id) * 100.0 / (SELECT COUNT(*) FROM Patrons)), 2) AS percentage
FROM
    Checkouts
GROUP BY
    book_id
ORDER BY
    percentage DESC,
    book_id;