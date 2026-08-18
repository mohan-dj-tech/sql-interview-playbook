-- Problem: Students Who Attended All Courses

/*
Solution:
To identify students who have enrolled in all available courses, we need to compare the number of distinct courses each student has enrolled in with the total number of courses offered. This approach ensures that only those students who have enrolled in every course are selected.

1. **Determine Total Number of Courses**: Calculate the total count of distinct courses available in the Course table.
2. **Count Student Enrollments**: For each student, count the number of distinct courses they have enrolled in from the Enrollment table.
3. **Compare and Select Eligible Students**: Select students whose count of enrolled courses matches the total number of courses, indicating full enrollment.
4. **Order the Results**: Present the final list of student IDs in any order as specified.
*/

-- SQL Query
SELECT student_id
FROM Enrollment
GROUP BY student_id
HAVING COUNT(DISTINCT course_id) = (SELECT COUNT(*) FROM Course)
ORDER BY student_id;
