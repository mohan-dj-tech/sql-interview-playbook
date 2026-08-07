-- Problem: Daily User Engagement Levels
/* Solution:
 To find the engagement level for each user in February 2020, this query joins the
 `Users` and `Engagement` tables on `user_id`. It filters the engagement records to
 include only those from February 2020. The results are then grouped by `user_name`
 to calculate the average engagement for each user. A `CASE` statement is used to
 categorize this average into 'Low', 'Medium', or 'High' based on the specified
 thresholds.
*/
SELECT
    u.user_name,
    CASE
        WHEN AVG(e.engagement) < 20 THEN 'Low'
        WHEN AVG(e.engagement) <= 60 THEN 'Medium'
        ELSE 'High'
    END AS engagement_level
FROM
    Users u
    JOIN Engagement e ON u.user_id = e.user_id
WHERE
    YEAR(e.date) = 2020 AND MONTH(e.date) = 2
GROUP BY
    u.user_name;
