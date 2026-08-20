# Problem: Find the Quiet Students in All Exams

## Table: Student

| Column Name         | Type    |
|---------------------|---------|
| student_id          | int     |
| student_name        | varchar |

`student_id` is the primary key for this table.
`student_name` is the name of the student.

## Table: Exam

| Column Name   | Type    |
|---------------|---------|
| exam_id       | int     |
| student_id    | int     |
| score         | int     |

`(exam_id, student_id)` is the primary key for this table.
Each row of this table indicates that the student with `student_id` had a `score` in the exam with `exam_id`.

## Task

A "quiet" student is one who took at least one exam and did not score the highest or the lowest score in any of their exams.

Write a solution to report the students (`student_id`, `student_name`) who were "quiet" in all exams they took. Do not return students who have never taken any exam.

Return the result table ordered by `student_id`.

## Example

**Input:**

`Student` table:
| student_id | student_name |
|------------|--------------|
| 1          | Daniel       |
| 2          | Jade         |
| 3          | Stella       |
| 4          | Jonathan     |
| 5          | Will         |

`Exam` table:
| exam_id | student_id | score |
|---------|------------|-------|
| 10      | 1          | 70    |
| 10      | 2          | 80    |
| 10      | 3          | 90    |
| 20      | 1          | 80    |
| 30      | 1          | 70    |
| 30      | 3          | 80    |
| 30      | 4          | 90    |
| 40      | 1          | 60    |
| 40      | 2          | 70    |
| 40      | 4          | 80    |

**Output:**

| student_id | student_name |
|------------|--------------|
| 2          | Jade         |
