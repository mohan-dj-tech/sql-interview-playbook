-- Problem: Game Play Analysis I
/* Solution:
 To find the first login date for each player, this query groups the `Activity` table
 by `player_id`. It then uses the `MIN` aggregate function on the `event_date` column
 to find the earliest date for each player. This date represents the first time
 the player logged in. The result set contains the `player_id` and their
 corresponding `first_login` date.
*/
SELECT
    player_id,
    MIN(event_date) AS first_login
FROM
    Activity
GROUP BY
    player_id;
