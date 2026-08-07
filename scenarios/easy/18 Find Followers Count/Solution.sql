-- Problem: Find Followers Count
/* Solution:
 To count the number of followers for each user, this query groups the `Followers`
 table by `user_id`. For each `user_id`, it counts the number of rows, which
 corresponds to the number of followers. The result is then ordered by `user_id`
 in ascending order.
*/
SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM
    Followers
GROUP BY
    user_id
ORDER BY
    user_id;
