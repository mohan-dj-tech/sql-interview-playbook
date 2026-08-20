-- Problem: First and Last Call On the Same Day

/*
Solution:
To identify users whose first and last calls on any day were with the same person, we need to analyze the Calls table meticulously. This involves determining the first and last call times for each user on each day and then verifying if both calls were with the same individual. The provided SQL query effectively accomplishes this task through a series of logical steps involving Common Table Expressions (CTEs) and joins.

Approach Overview
1. **Extract Unique User IDs**:
   - Compile a list of all unique users involved in calls, whether as callers or recipients.
2. **Determine First and Last Call Times per User per Day**:
   - For each user and each day, identify the earliest (first) and latest (last) call times.
3. **Identify Call Partners for First and Last Calls**:
   - For the first and last calls determined in the previous step, ascertain who the other party was in each call.
4. **Filter Users Based on Call Partner Consistency**:
   - Select users where the call partner in the first call of the day is the same as that in the last call of the same day.
5. **Retrieve Distinct User Details**:
   - Extract and present the unique user_ids that meet the criteria.
*/

-- SQL Query
WITH cte AS (
    SELECT caller_id AS id
    FROM Calls
    UNION
    SELECT recipient_id AS id
    FROM Calls
)

SELECT DISTINCT t.id AS user_id
FROM (
    SELECT a.id, DATE(call_time) AS call_date, MIN(call_time) AS first_call, MAX(call_time) AS last_call
    FROM cte a
    JOIN Calls c ON a.id = c.caller_id OR a.id = c.recipient_id
    GROUP BY a.id, DATE(call_time)
) t
LEFT JOIN Calls c1
    ON c1.call_time = t.first_call
LEFT JOIN Calls c2
    ON c2.call_time = t.last_call
WHERE
    IF(t.id = c1.caller_id, c1.recipient_id, c1.caller_id) =
    IF(t.id = c2.caller_id, c2.recipient_id, c2.caller_id)
ORDER BY t.id;
