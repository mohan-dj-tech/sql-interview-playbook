-- Problem: Ad-Free Sessions
/* Solution:
 To find sessions that had no ads, this query first identifies all sessions that *did*
 have ads. This is done in a subquery that joins `Playback` and `Ads` on `customer_id`
 and checks if the ad's `timestamp` falls within the session's `start_time` and
 `end_time`. The main query then selects all `session_id`s from the `Playback` table
 that are `NOT IN` the set of sessions with ads returned by the subquery.
*/
SELECT
    session_id
FROM
    Playback
WHERE
    session_id NOT IN (
        SELECT DISTINCT
            p.session_id
        FROM
            Playback p
            JOIN Ads a ON p.customer_id = a.customer_id
        WHERE
            a.timestamp BETWEEN p.start_time AND p.end_time
    );
