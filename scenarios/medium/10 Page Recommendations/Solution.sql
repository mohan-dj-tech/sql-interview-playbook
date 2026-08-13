-- Problem: Page Recommendations
/* Solution:
 To recommend pages to user 1 based on their friends' likes, this query follows a multi-step process using a Common Table Expression (CTE) and subqueries.

 1.  **`friends` CTE**: This CTE identifies all friends of user 1. Since friendship is bidirectional in the table, it uses a `UNION ALL` to select `user2_id` where `user1_id` is 1, and `user1_id` where `user2_id` is 1.
 2.  **Main Query**:
     - It selects distinct `page_id`s from the `Likes` table.
     - The first `WHERE` clause filters for pages liked by users who are in the `friends` CTE.
     - The second `WHERE` clause (`AND page_id NOT IN ...`) filters out any pages that user 1 has already liked.
*/
WITH friends AS (
    (SELECT user2_id AS friend
     FROM Friendship
     WHERE user1_id = 1)
    UNION ALL
    (SELECT user1_id AS friend
     FROM Friendship
     WHERE user2_id = 1)
)
SELECT DISTINCT page_id AS recommended_page
FROM Likes
WHERE user_id IN (SELECT friend FROM friends)
  AND page_id NOT IN (
      SELECT page_id
      FROM Likes
      WHERE user_id = 1
  );
