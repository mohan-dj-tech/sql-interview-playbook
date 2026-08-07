-- Problem: Weather Type in Each Country
/* Solution:
 To find the weather type for each country in November 2019, this query first joins
 the `Countries` and `Weather` tables on `country_id`. It filters the `Weather` records
 to include only dates in November 2019. Then, it groups the results by `country_name`
 and calculates the average `weather_state`. A `CASE` statement is used to classify
 this average as 'Cold', 'Hot', or 'Warm' based on the specified thresholds.
*/
SELECT
    c.country_name,
    CASE
        WHEN AVG(w.weather_state) <= 15 THEN 'Cold'
        WHEN AVG(w.weather_state) >= 25 THEN 'Hot'
        ELSE 'Warm'
    END AS weather_type
FROM
    Countries c
JOIN
    Weather w ON c.country_id = w.country_id
WHERE
    YEAR(w.day) = 2019 AND MONTH(w.day) = 11
GROUP BY
    c.country_name;
