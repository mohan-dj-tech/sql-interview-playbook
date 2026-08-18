-- Problem: Student Course Averages
/*
Solution:
To solve this problem, we need to calculate the average grade obtained by each student in each course. We can achieve this using SQL queries to filter and aggregate the necessary data.

1. **Perform a Cross Join**: Performing a cross join between the Students and Courses tables to generate all possible combinations of students and courses.
2. **Left Join with Grades Table**: Perform a left join with the Grades table to incorporate the grade information for each student-course combination.
3. **Calculate Average Grade**: Utilize the AVG() function and appropriate grouping to compute the average grade obtained by each student in each course.
4. **Handle Null Values**: Use the COALESCE() function to handle cases where a student has no grades for a particular course.
5. **Order the Results**: Arrange the result table by student_id and course_name for clarity.
*/

-- SQL Query
SELECT
    s.student_id,
    s.student_name,
    c.course_name,
    ROUND(COALESCE(AVG(g.grade), NULL), 2) AS average_grade
FROM
    Students s
CROSS JOIN
    Courses c
LEFT JOIN
    Grades g ON s.student_id = g.student_id AND c.course_name = g.course_name
GROUP BY
    s.student_id, s.student_name, c.course_name
ORDER BY
    s.student_id, c.course_name;