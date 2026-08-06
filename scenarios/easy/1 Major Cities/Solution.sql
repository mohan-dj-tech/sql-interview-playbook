-- Problem: Major Cities
/* Solution:
 To identify major cities from the 'World' dataset, this query evaluates each city
 against two distinct criteria: a geographical area exceeding 3000 square kilometers
 or a population of more than 5 million people. The SQL query utilizes the `OR`
 logical operator within the `WHERE` clause to filter for records that satisfy
 either of these conditions. The result set contains the names of all cities
 that meet the criteria for being classified as "major."
*/
SELECT
    city_name
FROM
    World
WHERE
    area > 3000 OR population > 5000000;
