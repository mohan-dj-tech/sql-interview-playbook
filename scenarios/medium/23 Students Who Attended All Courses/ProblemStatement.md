# Problem: Students Who Attended All Courses

## Table: Enrollment

This table records the enrollments of students in various courses. Each record includes a student ID and a course ID.

| Column Name  | Type    |
|--------------|---------|
| student_id   | int     |
| course_id    | int     |

This table may contain duplicate rows.
`student_id` is not NULL.
`course_id` is a foreign key to the `Course` table.

## Table: Course

This table lists all the courses available.

| Column Name  | Type    |
|--------------|---------|
| course_id    | int     |

`course_id` is the primary key for this table.

## Task

Develop a solution to identify the student IDs from the `Enrollment` table who have enrolled in all the courses listed in the `Course` table.

Return the result table in any order.

## Example

**Input:**

`Enrollment` table:
| student_id | course_id |
|------------|-----------|
| 100        | 200       |
| 200        | 300       |
| 300        | 200       |
| 300        | 300       |
| 100        | 300       |

`Course` table:
| course_id |
|-----------|
| 200       |
| 300       |

**Output:**

| student_id |
|------------|
| 100        |
| 300        |
