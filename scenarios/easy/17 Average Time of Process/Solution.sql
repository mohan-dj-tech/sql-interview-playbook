-- Problem: Average Time of Process per Machine
/* Solution:
 To find the average processing time for each machine, this query uses a self-join on
 the `Activity` table. It joins the table with itself (`a1` for 'start' and `a2` for
 'end') on the same `machine_id` and `process_id`. This pairs the start and end
 timestamps for each process. The query then calculates the duration for each process
 (`a2.timestamp - a1.timestamp`), groups the results by `machine_id`, and computes
 the average duration, rounding it to three decimal places.
*/
SELECT
    a1.machine_id,
    ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM
    Activity a1
    JOIN Activity a2 ON a1.machine_id = a2.machine_id
    AND a1.process_id = a2.process_id
    AND a1.activity_type = 'start'
    AND a2.activity_type = 'end'
GROUP BY
    a1.machine_id;
