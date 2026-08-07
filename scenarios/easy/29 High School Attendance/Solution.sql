-- Problem: High School Attendance
/* Solution:
 This query identifies students with three or more consecutive absences using a common
 table expression (CTE) and window functions. This is a classic "gaps and islands"
 problem.

 1.  `RankedAttendance` CTE: First, it filters for 'Absent' records and assigns a
     row number to each absence for each student, ordered by date.
 2.  `ConsecutiveAttendance` CTE: This is the core of the logic. It creates a
     grouping key (`grouping_col`) by subtracting a new row number (based on the
     filtered absent dates) from the rank calculated in the first CTE. This difference
     will be constant for any consecutive sequence of dates.
 3.  The query then groups by this `grouping_col` to count the number of consecutive
     absences in each sequence.
 4.  `HAVING COUNT(*) >= 3`: This filters for groups with 3 or more consecutive days.
 5.  Final `SELECT`: Selects the `student_id` and the minimum date (`start_date`)
     from the qualifying groups.
*/
WITH RankedAttendance AS (
    SELECT
        student_id,
        attendance_date,
        ROW_NUMBER() OVER (
            PARTITION BY
                student_id
            ORDER BY
                attendance_date
        ) AS rn
    FROM
        Attendance
    WHERE
        status = 'Absent'
),
ConsecutiveGroups AS (
    SELECT
        student_id,
        attendance_date,
        DATE_SUB(attendance_date, INTERVAL rn DAY) AS group_start
    FROM
        RankedAttendance
)
SELECT
    student_id,
    MIN(attendance_date) AS start_date
FROM
    ConsecutiveGroups
GROUP BY
    student_id,
    group_start
HAVING
    COUNT(*) >= 3
ORDER BY
    student_id,
    start_date;
