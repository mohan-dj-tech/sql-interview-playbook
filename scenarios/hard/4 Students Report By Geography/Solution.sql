-- Problem: Students Report By Geography

/*
Solution:
To pivot the Student table such that each student's name is displayed under their respective continent (America, Asia, Europe) and sorted alphabetically, we can follow a systematic approach. This involves assigning row numbers to each student within their continent based on alphabetical order and then aggregating the names accordingly.

Approach Overview
1. **Assign Row Numbers to Students Within Each Continent**:
   - For each continent, sort the students' names alphabetically and assign a sequential row number. This helps in aligning students from different continents side by side in the pivoted result.
2. **Pivot the Data Based on Row Numbers**:
   - Transform the sorted list into a pivoted format where each row corresponds to a specific row number, and each column represents a continent. This aligns students from different continents based on their row numbers.
3. **Select and Order the Final Results**:
   - Retrieve the pivoted data, ensuring that the continents are displayed as separate columns (America, Asia, Europe). Sort the results based on the row numbers to maintain the alphabetical order.
*/

-- SQL Query
SELECT  MAX(CASE WHEN continent = 'America' THEN name END) AS America,
        MAX(CASE WHEN continent = 'Asia' THEN name END) AS Asia,
        MAX(CASE WHEN continent = 'Europe' THEN name END) AS Europe
FROM
(SELECT continent,
       name,
       ROW_NUMBER() OVER(
        PARTITION BY continent
        ORDER BY name)  rn
FROM Student
) ranked_students
GROUP BY rn;
