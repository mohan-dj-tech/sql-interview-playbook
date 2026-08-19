-- Problem: Human Traffic of Stadium

/*
Solution:
To identify and display records from the Stadium table where three or more consecutive id's have a number of people greater than or equal to 100, we can utilize SQL's window functions and Common Table Expressions (CTEs). This approach allows us to group consecutive qualifying records efficiently and filter out those groups that meet the specified criteria. The final results will be ordered by visit_date in ascending order.

Approach Overview
1. **Filter Records with people ≥ 100**:
   - Select only those records where the number of people is greater than or equal to 100. These are the records of interest for identifying consecutive groups.
2. **Assign Group Identifiers for Consecutive id's**:
   - Use the difference between the id and a sequential row number to assign a unique group identifier (grp) for consecutive records. This technique ensures that consecutive id's share the same grp value.
3. **Identify Groups with Three or More Consecutive Records**:
   - Group the filtered records by the calculated grp and count the number of records in each group. Retain only those groups that have three or more records.
4. **Retrieve the Desired Records**:
   - Join the qualifying groups back to the filtered records to extract the complete details (id, visit_date, people) of each record within these groups.
5. **Order the Results**:
   - Sort the final output by visit_date in ascending order to present the data chronologically.
*/

-- SQL Query
WITH ConsecutiveGroups AS (
    -- Step 1: Assign groups where `people` >= 100 and `id`'s are consecutive
    SELECT
        id,
        visit_date,
        people,
        id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM
        Stadium
    WHERE
        people >= 100
),
GroupedCounts AS (
    -- Step 2: Count the number of rows in each group
    SELECT
        grp,
        COUNT(*) AS group_size
    FROM
        ConsecutiveGroups
    GROUP BY
        grp
    HAVING
        COUNT(*) >= 3
)
-- Step 3: Retrieve rows from groups with 3 or more consecutive rows
SELECT
    c.id,
    c.visit_date,
    c.people
FROM
    ConsecutiveGroups c
JOIN
    GroupedCounts g
ON
    c.grp = g.grp
ORDER BY
    c.visit_date;