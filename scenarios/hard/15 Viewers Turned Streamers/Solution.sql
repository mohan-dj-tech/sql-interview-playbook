-- Problem: Viewers Turned Streamers

/*
Solution:
To identify the number of streaming sessions for users whose first session was as a viewer, we analyze the Sessions table. We can efficiently accomplishes this by leveraging Common Table Expressions (CTEs), window functions, and conditional aggregations. Below is a comprehensive breakdown of the approach, step-by-step execution, and detailed explanations for each line of the SQL query.

Approach Overview
1. **Determine the First Session of Each User**:
   - Use a window function to rank sessions based on the session_start time for each user.
   - Identify users whose first session (rank = 1) was as a viewer.
2. **Count Streaming Sessions for Qualified Users**:
   - For users identified in the first step, count the number of sessions where session_type is Streamer.
3. **Filter and Order the Results**:
   - Ensure that only users who have both Viewer and Streamer session types are considered.
   - Order the final results by the count of streaming sessions in descending order and by user_id in descending order in case of ties.
*/

-- SQL Query
WITH cte AS (
    SELECT
        user_id,
        session_type,
        RANK() OVER (
            PARTITION BY user_id
            ORDER BY session_start
        ) AS rnk
    FROM Sessions
)
SELECT
    user_id,
    SUM(CASE WHEN session_type = 'Streamer' THEN 1 ELSE 0 END) AS sessions_count
FROM Sessions
WHERE user_id IN (
    SELECT user_id
    FROM cte
    WHERE rnk = 1 AND session_type = 'Viewer'
)
GROUP BY user_id
HAVING COUNT(DISTINCT session_type) = 2
ORDER BY sessions_count DESC, user_id DESC;
