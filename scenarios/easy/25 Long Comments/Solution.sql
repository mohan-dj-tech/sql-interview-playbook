-- Problem: Long Comments
/* Solution:
 To identify comments that are longer than 100 characters, this query uses the
 `LENGTH()` function. It filters the `Comments` table in the `WHERE` clause,
 selecting only the rows where the length of the `text` column is greater than 100.
*/
SELECT
    comment_id
FROM
    Comments
WHERE
    LENGTH(text) > 100;
