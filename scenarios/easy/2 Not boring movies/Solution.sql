-- Problem: Not Boring Movies
/* Solution:
 To identify movies that are not "boring" and have an odd-numbered ID, this query
 filters the 'Cinema' table based on two conditions. It uses the modulo operator (`%`)
 to check for an odd `id` and the `!=` operator to exclude movies with the description
 'boring'. The final result set is ordered by the `rating` column in descending
 order, presenting the most highly-rated movies first.
*/
SELECT
    *
FROM
    Cinema
WHERE
    id % 2 = 1 AND description != 'boring'
ORDER BY
    rating DESC;
