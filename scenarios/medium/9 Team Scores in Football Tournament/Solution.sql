-- Problem: Team Scores in Football Tournament
/* Solution:
 To calculate the total points for each team, we need to consider both host and guest matches. This solution uses a `UNION ALL` to create a unified list of all match results from the perspective of each participating team.

 1.  **First SELECT (Host Teams)**: Calculates the points for each team when they were the host. A `CASE` statement awards 3 points for a win, 1 for a draw, and 0 for a loss.
 2.  **Second SELECT (Guest Teams)**: Does the same for each team when they were the guest.
 3.  **UNION ALL**: Combines these two sets of results into a temporary table `p`.
 4.  **Outer Query**: This query joins the `Teams` table with the aggregated points table `p`. A `LEFT JOIN` ensures that even teams with zero matches (and thus 0 points) are included. It then groups by `team_id` and `team_name` and uses `SUM()` to get the total `num_points`. `COALESCE` handles the `NULL` case for teams with no points.
 5.  **Ordering**: The final result is ordered by `num_points` descending and then by `team_id` ascending.
*/
SELECT
    t.team_id,
    t.team_name,
    COALESCE(SUM(p.num_points), 0) AS num_points
FROM
    Teams t
LEFT JOIN (
    SELECT
        host_team AS team_id,
        CASE
            WHEN host_goals > guest_goals THEN 3
            WHEN host_goals = guest_goals THEN 1
            ELSE 0
        END AS num_points
    FROM
        Matches
    UNION ALL
    SELECT
        guest_team AS team_id,
        CASE
            WHEN guest_goals > host_goals THEN 3
            WHEN guest_goals = host_goals THEN 1
            ELSE 0
        END AS num_points
    FROM
        Matches
) p ON t.team_id = p.team_id
GROUP BY
    t.team_id,
    t.team_name
ORDER BY
    num_points DESC,
    t.team_id ASC;
