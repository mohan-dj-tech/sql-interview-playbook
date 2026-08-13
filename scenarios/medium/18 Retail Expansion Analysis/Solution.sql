-- Problem: Retail Expansion Analysis
/* Solution:
 To calculate the total potential revenue for 2021 from qualifying stores, this query uses two subqueries to filter the `StorePerformance` table based on the specified conditions.

 1.  **`dup_rev` Subquery**: This subquery identifies all `rev_2020` values that appear more than once in the table, indicating stores with non-unique 2020 revenues.
 2.  **`unique_loc` Subquery**: This subquery identifies all `(lat, lon)` pairs that are unique, meaning they appear only once.
 3.  **Main Query**:
     - It starts with the main `StorePerformance` table (`sp`).
     - An `INNER JOIN` with `dup_rev` filters for stores whose `rev_2020` is in the list of duplicate revenues.
     - Another `INNER JOIN` with `unique_loc` further filters for stores whose location is in the list of unique locations.
     - Finally, `SUM(sp.rev_2021)` calculates the total 2021 revenue from the stores that meet both conditions, and `FORMAT()` is used to present the result with two decimal places.
*/
SELECT FORMAT(SUM(sp.rev_2021), 2) AS rev_2021
FROM StorePerformance sp
INNER JOIN (
    -- Identify rev_2020 values that are duplicated
    SELECT rev_2020
    FROM StorePerformance
    GROUP BY rev_2020
    HAVING COUNT(*) > 1
) dup_rev ON sp.rev_2020 = dup_rev.rev_2020
INNER JOIN (
    -- Identify unique (lat, lon) pairs across all stores
    SELECT lat, lon
    FROM StorePerformance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
) unique_loc ON sp.lat = unique_loc.lat AND sp.lon = unique_loc.lon;
