# Student Course Averages

## Problem Statement

Table: `Students`

| Column Name   | Type    |
|---------------|---------|
| student_id    | int     |
| student_name  | varchar |

`student_id` serves as the primary key for this table.

Table: `Courses`

| Column Name  | Type    |
|--------------|---------|
| course_name  | varchar |

`course_name` acts as the primary key for this table.

Table: `Grades`

| Column Name  | Type    |
|--------------|---------|
| student_id   | int     |
| course_name  | varchar |
| grade        | int     |

Write a SQL query to calculate the average grade obtained by each student in each course they are enrolled in.

Return the result table sorted by `student_id` and `course_name`.

---

## Example

**Input:**

`Students` table:

| student_id | student_name |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |

`Courses` table:

| course_name  |
|--------------|
| Math         |
| Physics      |
| Programming  |

`Grades` table:

| student_id | course_name  | grade |
|------------|--------------|-------|
| 1          | Math         | 90    |
| 1          | Physics      | 85    |
| 1          | Programming  | 95    |
| 2          | Programming  | 88    |
| 1          | Physics      | 82    |
| 1          | Math         | 88    |
| 13         | Math         | 78    |
| 13         | Programming  | 92    |
| 13         | Physics      | 80    |
| 2          | Math         | 85    |
| 1          | Math         | 91    |

**Expected Output:**

| student_id | student_name | course_name  | average_grade  |
|------------|--------------|--------------|----------------|
| 1          | Alice        | Math         | 89.67          |
| 1          | Alice        | Physics      | 83.50          |
| 1          | Alice        | Programming  | 95.00          |
| 2          | Bob          | Math         | 85.00          |
| 2          | Bob          | Physics      | null           |
| 2          | Bob          | Programming  | 88.00          |
| 6          | Alex         | Math         | null           |
| 6          | Alex         | Physics      | null           |
| 6          | Alex         | Programming  | null           |
| 13         | John         | Math         | 78.00          |
| 13         | John         | Physics      | 80.00          |
| 13         | John         | Programming  | 92.00          |

<details>
<summary>Explanation</summary>

In this example, Alice's average grade in Math is (90 + 88 + 91) / 3 = 89.67, in Physics it's (85 + 82) / 2 = 83.5, and in Programming it's (95) / 1 = 95. Bob's average grade in Math is (85) / 1 = 85.00, in Physics it's null since he has no grades in Physics, and in Programming it's (88) / 1 = 88.00. Alex had no grades, so his average grades are null for all subjects. John's average grade in Math is (78) / 1 = 78.00, in Physics it's (80) / 1 = 80.00, and in Programming it's (92) / 1 = 92.00.
</details>