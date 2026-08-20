-- Problem: Find the Quiet Students in All Exams

/*
Solution:
To identify quiet students—those who have taken at least one exam and never scored the highest or the lowest in any of their exams—we can follow a structured approach using SQL's window functions and subqueries. This involves ranking students within each exam, filtering out those who achieved top or bottom ranks, and finally selecting the remaining students who meet the quiet student criteria.

Approach Overview
1. **Rank Students' Scores Within Each Exam**:
   - Assign ranks to students based on their scores in each exam to identify the highest and lowest scorers.
2. **Identify Students with Highest or Lowest Scores**:
   - Extract students who have ever ranked first (highest score) or last (lowest score) in any exam.
3. **Determine Quiet Students**:
   - Exclude students identified in the previous step from the list of all students who have taken at least one exam. The remaining students are the quiet students.
4. **Retrieve Quiet Students' Details**:
   - Fetch the student_id and student_name of the quiet students from the Student table.
5. **Finalize the Results**:
   - Select distinct candidate details and present them in the desired format, ordered by student_id.
*/

-- SQL Query
WITH ExamRanks AS (
  SELECT exam_id,
         student_id,
        RANK() OVER (PARTITION BY exam_id ORDER By score DESC) AS high_score,
        RANK() OVER (PARTITION BY exam_id ORDER By score) AS low_score
  FROM Exam
)
SELECT DISTINCT e.student_id, s.student_name
FROM Exam e LEFT JOIN Student s
ON e.student_id = s.student_id
WHERE e.student_id NOT IN (
  SELECT student_id
  FROM ExamRanks
  WHERE high_score = 1 OR low_score = 1
)
ORDER BY e.student_id ASC;
