-- Problem: Game Play Analysis IV
/* Solution:
 To determine the fraction of players who logged in again on the day after their first login, we can follow a systematic approach that involves identifying players with consecutive logins and calculating the required fraction. This solution leverages SQL's window functions and subqueries to efficiently perform the necessary computations.

 1.  **Identify Players with Consecutive Logins**: Find players who have at least one login event where they logged in on the day immediately following another login event.
 2.  **Calculate Total Number of Players**: Determine the total count of unique players in the Activity table.
 3.  **Compute the Fraction**: Divide the number of players with consecutive logins by the total number of players and round the result to two decimal places.
*/
SELECT
    ROUND(
        COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM
    Activity a
WHERE
    EXISTS (
        SELECT 1
        FROM Activity b
        WHERE
            b.player_id = a.player_id
            AND b.event_date = DATE_SUB(a.event_date, INTERVAL 1 DAY)
    );
