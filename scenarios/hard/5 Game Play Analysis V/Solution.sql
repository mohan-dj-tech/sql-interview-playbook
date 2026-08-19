-- Problem: Game Play Analysis V

/*
Solution:
To determine the day one retention for each install date in the Activity table, we need to analyze player login patterns. Specifically, we want to identify players who installed the game on a particular day (their first login day) and then check if they returned to log in the day immediately following their install date. We can efficiently accomplishes this by leveraging window functions and aggregation techniques. Below is a comprehensive breakdown of the approach, step-by-step execution, and detailed explanations for each line of the SQL query.

Approach Overview
1. **Identify Install Dates**:
   - Determine the first login day (install_dt) for each player.
2. **Calculate Installations per Date**:
   - Count the number of players who installed the game on each install_dt.
3. **Determine Day One Retention**:
   - For each install_dt, calculate the proportion of players who logged in again on the day immediately after their install date (install_dt + 1 day).
4. **Present the Results**:
   - Display each install_dt alongside the number of installations and the corresponding day one retention rate, rounded to two decimal places.
*/

-- SQL Query
SELECT
    install_dt,
    COUNT(DISTINCT player_id) AS installs,
    ROUND(SUM(CASE WHEN event_date = install_dt + INTERVAL 1 DAY THEN 1 ELSE 0 END) / COUNT(DISTINCT player_id), 2) AS Day1_retention
FROM (
    SELECT
        *,
        MIN(event_date) OVER (PARTITION BY player_id) AS install_dt
    FROM Activity
) TEMP
GROUP BY install_dt;
