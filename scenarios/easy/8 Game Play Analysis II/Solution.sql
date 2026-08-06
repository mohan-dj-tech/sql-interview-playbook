-- Problem: Game Play Analysis II
/* Solution:
To identify the first device each player logged in with, we can leverage SQL's window functions, specifically FIRST_VALUE(). This function allows us to retrieve the first occurrence of a value within a specified window partition. By partitioning the data by player_id and ordering it by event_date, we can effectively determine the initial device used by each player.
Partition Data by Player: Group the records based on player_id to analyze each player's activity individually.
Order Events Chronologically: Within each player group, order the records by event_date to identify the sequence of device usage.
Retrieve the First Device: Use the FIRST_VALUE() window function to extract the device ID from the earliest event for each player.
Eliminate Duplicate Entries: Apply DISTINCT to ensure each player appears only once in the final result.
*/
SELECT DISTINCT
    player_id,
    FIRST_VALUE(device_id) OVER (
        PARTITION BY player_id
        ORDER BY
            event_date
    ) AS device_id
FROM
    Activity;
