-- Problem: Game Play Analysis III
/* Solution:
 To report the cumulative number of games each player has played up to each event date, we can utilize SQL's window functions. Specifically, the SUM() window function with appropriate partitioning and ordering allows us to calculate a running total (games_played_so_far) for each player across different dates.

 1.  **Select Relevant Columns**: Retrieve player_id and event_date to identify each player's activity on specific dates.
 2.  **Calculate Cumulative Games Played**: Use the SUM() window function to compute a running total of games_played for each player, ordered by event_date.
 3.  **Order the Results**: Although not required, ordering the results by player_id and event_date can enhance readability.
*/
SELECT player_id,
       event_date,
       SUM(games_played) OVER (
           PARTITION BY player_id
           ORDER BY event_date
       ) AS games_played_so_far
FROM   Activity;
