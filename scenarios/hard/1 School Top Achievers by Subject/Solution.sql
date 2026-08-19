-- Problem: School Top Achievers by Subject

/*
Solution:
To identify the top achievers in each subject, defined as students with scores in the top three unique scores for that subject, we can utilize SQL's window functions, specifically DENSE_RANK(). This approach allows us to rank students based on their scores within each subject and then filter out those who fall within the top three ranks.

1. **Join Tables**: Combine the Student and Subject tables to associate each student's performance with the corresponding subject name.
2. **Rank Scores Within Each Subject**: Use the DENSE_RANK() window function to assign ranks to students based on their scores in descending order within each subject.
3. **Filter Top Achievers**: Select students whose ranks are within the top three for their respective subjects.
4. **Order the Results**: Sort the final output by subject name and rank for organized presentation.
*/

-- SQL Query
WITH RankedScores AS (
    SELECT st.name AS Student, su.name AS Subject, st.score,
           DENSE_RANK() OVER (PARTITION BY st.subjectId ORDER BY st.score DESC) AS s_rank
    FROM Student st
    JOIN Subject su ON st.subjectId = su.id
)
SELECT Subject, Student, score AS Score
FROM RankedScores
WHERE s_rank <= 3
ORDER BY Subject, s_rank