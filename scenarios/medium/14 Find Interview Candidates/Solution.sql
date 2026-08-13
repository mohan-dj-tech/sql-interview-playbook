-- Problem: Find Interview Candidates
/* Solution:
 To identify interview candidates, we evaluate two conditions using Common Table Expressions (CTEs).

 1.  **`t0` CTE (All Medalists)**: This CTE unpivots the `Contests` table using `UNION ALL` to create a single list of all medal winners (`USER`) for each `contest_id`.
 2.  **`t1` CTE (Ranked Contests)**: This CTE assigns a row number (`rn`) to each user's contest participation, ordered by `contest_id`. This is a key step for identifying consecutive contests.
 3.  **`t2` CTE (Candidate Groups)**: This CTE combines the results from two separate queries using `UNION ALL`:
     - **Consecutive Winners**: This part identifies users who won medals in three or more consecutive contests. It groups by the user and the expression `contest_id - rn`. This difference will be constant for any sequence of consecutive contest IDs, allowing us to count the length of these streaks.
     - **Gold Medal Winners**: This part simply counts the number of gold medals for each user and filters for those with three or more.
 4.  **Final `SELECT`**: The final query joins the list of candidate IDs from `t2` with the `Users` table to get their name and email. `DISTINCT` is used to ensure each candidate appears only once.
*/
WITH t0 AS (
    SELECT gold_medal AS USER, contest_id
    FROM Contests
    UNION ALL
    SELECT silver_medal AS USER, contest_id
    FROM Contests
    UNION ALL
    SELECT bronze_medal AS USER, contest_id
    FROM Contests
),
t1 AS (
    SELECT USER,
           contest_id,
           ROW_NUMBER() OVER (PARTITION BY USER ORDER BY contest_id) AS rn
    FROM t0
),
t2 AS (
    -- Users who won any medal in three or more consecutive contests
    SELECT USER AS user_id
    FROM t1
    GROUP BY USER, contest_id - rn
    HAVING COUNT(*) >= 3
    UNION ALL
    -- Users who won the gold medal in three or more contests
    SELECT gold_medal AS user_id
    FROM Contests
    GROUP BY gold_medal
    HAVING COUNT(*) >= 3
)
SELECT DISTINCT u.name AS NAME,
                u.mail AS mail
FROM t2
JOIN Users u ON t2.user_id = u.user_id;
