-- Problem: Find Popular Posts

/*
Solution:
To determine the number of likes each post has received, we analyze the Posts table. Each row in the Posts table represents a like made by a user (user_id) on a specific post (post_id). By aggregating this data, we can count how many users have liked each post, effectively determining the total number of likes per post.

Here are the steps for the solution.

1. **Aggregate Likes per Post**: Count the number of user_ids associated with each post_id to determine the total likes per post.
2. **Order the Results**: Present the final count of likes in ascending order of post_id for clarity and organization.
*/

-- SQL Query
SELECT
    post_id,
    COUNT(user_id) AS post_likes
FROM
    Posts
GROUP BY
    post_id
ORDER BY
    post_id ASC;