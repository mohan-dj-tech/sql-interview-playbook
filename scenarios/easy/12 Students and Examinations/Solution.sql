-- Problem: Students and Examinations
/* Solution:
 To find the number of times each student attended each exam, this query generates all
 possible student-subject pairs using a `CROSS JOIN`. It then `LEFT JOIN`s this
 combination with the `Examinations` table to bring in the exam attendance data.
 By grouping by `student_id`, `student_name`, and `subject_name`, we can count the
 number of exams for each pair. `COUNT(e.subject_name)` is used to count only the
 non-null values from the `Examinations` table, effectively giving a count of 0 for
 combinations where the student did not attend the exam.
*/
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM
    Students s
    CROSS JOIN Subjects sub
    LEFT JOIN Examinations e ON s.student_id = e.student_id
    AND sub.subject_name = e.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY
    s.student_id,
    sub.subject_name;
