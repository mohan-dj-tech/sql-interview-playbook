-- Problem: Longest Winning Streak

/*
Solution:
To determine the longest winning streak for each player, we need to analyze the Matches table to identify consecutive wins without any interruptions by draws or losses. Below is a comprehensive breakdown of the approach, step-by-step execution, and detailed explanations for each line of the SQL query.

Approach Overview
1. **Transform Match Results**:
   - Convert the categorical result into numerical indicators to facilitate streak calculations.
2. **Calculate Cumulative Non-Win Counts (se)**:
   - For each player, compute a running total of non-win results to identify streak segments.
3. **Determine Streak Lengths**:
   - Group matches based on the cumulative non-win counts to isolate winning streaks.
4. **Compute Longest Streak per Player**:
   - For each player, identify the maximum streak length from the grouped data.
5. **Present the Final Results**:
   - Display each player's ID alongside their longest winning streak.
*/

-- SQL Query
SELECT player_id,
       Max(streak) AS longest_streak
FROM   (SELECT player_id,
               se,
               CASE
                 WHEN se = 0 THEN Count(se)
                 ELSE Count(se) - 1
               END AS streak
        FROM   (SELECT player_id,
                       match_day,
                       Sum(r)
                         OVER (
                           partition BY player_id
                           ORDER BY match_day) AS se
                FROM   (SELECT player_id,
                               match_day,
                               CASE
                                 WHEN result = 'win' THEN 0
                                 ELSE 1
                               END r
                        FROM   Matches) a)b
        GROUP  BY player_id,
                  se) c
GROUP  BY player_id;
