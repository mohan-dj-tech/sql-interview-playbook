-- Problem: Library Book Checkouts First Year

/*
Solution:
To identify each book's first year of checkout, along with the total number of checkouts and the price per checkout for that year, we can follow a systematic approach using SQL's aggregation and join capabilities. This ensures accurate retrieval of the desired information by leveraging Common Table Expressions (CTEs) and appropriate filtering.

1. **Determine the First Year of Checkout for Each Book**: Identify the earliest year each book was checked out by finding the minimum year associated with each book_id.
2. **Retrieve Checkout Details for the First Year**: Obtain the number of checkouts and the price per checkout for each book in its first year of checkout.
3. **Order the Results**: Sort the final output by book_id to present the data in an organized manner.
*/

-- SQL Query
WITH FirstYear AS (
    SELECT book_id, MIN(year) AS first_year
    FROM Checkouts
    GROUP BY book_id
)
SELECT f.book_id, f.first_year, c.checkouts, c.price
FROM FirstYear f
JOIN Checkouts c ON f.book_id = c.book_id AND f.first_year = c.year
ORDER BY f.book_id;
