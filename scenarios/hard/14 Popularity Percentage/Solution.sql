-- Problem: Popularity Percentage

/*
Solution:
To determine the popularity percentage of each user on Meta/Facebook, we need to calculate the proportion of friends each user has relative to the total number of users on the platform. The popularity percentage is defined as:

(Number of Friends of a User / Total Number of Users on the Platform) * 100

The final result should display each user’s user1 and their corresponding percentage_popularity, rounded to two decimal places. The results must be ordered by user1 in ascending order.

Approach Overview
1. **Transform Friendships to Bidirectional Relationships**:
   - Ensure that each friendship is represented in both directions (i.e., if User A is friends with User B, then User B is also friends with User A). This facilitates accurate counting of friends for each user.
2. **Identify All Unique Users**:
   - Extract all unique users from both user1 and user2 columns to determine the total number of users on the platform.
3. **Calculate the Number of Friends per User**:
   - For each user, count the number of unique friends they have.
4. **Compute Popularity Percentage**:
   - For each user, divide the number of friends by the total number of unique users and multiply by 100. Round the result to two decimal places.
5. **Finalize the Results**:
   - Present the user1 and their corresponding percentage_popularity in ascending order of user1.
*/

-- SQL Query
WITH two_way_friendships AS (
    SELECT user1, user2 FROM Friends
    UNION ALL
    SELECT user2 AS user1, user1 AS user2 FROM Friends
),
unique_users AS (
    SELECT user1 AS user_id FROM two_way_friendships
    UNION
    SELECT user2 AS user_id FROM two_way_friendships
),
total_users AS (
    SELECT COUNT(*) AS total_count FROM unique_users
)
SELECT
    T.user1,
    ROUND(100.00 * (COUNT(DISTINCT T.user2) / TU.total_count), 2) AS percentage_popularity
FROM
    two_way_friendships T
CROSS JOIN
    total_users TU
GROUP BY
    T.user1, TU.total_count
ORDER BY
    T.user1;
