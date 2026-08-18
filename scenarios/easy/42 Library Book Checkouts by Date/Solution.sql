-- Problem: Library Book Checkouts by Date

/*
Solution:
To generate a report of distinct book titles checked out each day in a lexicographically sorted list, along with the number of distinct checkouts, we can utilize SQL's aggregation functions and window functions. The solution involves grouping the data by checkout dates, counting distinct book titles, and concatenating these titles in a sorted manner.

1. **Group by Checkout Date**: Aggregate data based on each checkout_date to analyze daily checkouts.
2. **Count Distinct Book Titles**: Determine the number of unique book titles checked out each day.
3. **Concatenate Sorted Book Titles**: Combine the distinct book titles into a comma-separated, lexicographically sorted string.
4. **Order the Results**: Present the final report ordered by checkout_date for clarity.
*/

-- SQL Query
SELECT checkout_date,
       COUNT(DISTINCT book_title) AS num_checkouts,
       GROUP_CONCAT(DISTINCT book_title ORDER BY book_title ASC SEPARATOR ',') AS book_titles
FROM Checkouts
GROUP BY checkout_date
ORDER BY checkout_date;