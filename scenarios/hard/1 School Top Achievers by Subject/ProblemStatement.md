# Problem: School Top Achievers by Subject

## Table: Student

Each row in this table represents a student's performance in a specific subject, including their unique ID, name, score, and the subject ID they were evaluated in.

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |
| score       | int     |
| subjectId   | int     |

`id` is the primary key for this table.
`subjectId` is a foreign key referencing the `id` from the `Subject` table.

## Table: Subject

This table lists all subjects offered, each with a unique ID and name.

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

`id` is the primary key for this table.

## Task

Develop a solution to identify the top achievers in each subject, defined as students with scores in the top three unique scores for that subject.

## Example

**Input:**

`Student` table:
| id | name   | score | subjectId |
|----|--------|-------|-----------|
| 1  | Alice  | 92    | 1         |
| 2  | Bob    | 85    | 2         |
| 3  | Carol  | 87    | 2         |
| 4  | Derek  | 95    | 1         |
| 5  | Elisa  | 88    | 1         |
| 6  | Fiona  | 92    | 1         |
| 7  | George | 90    | 1         |

`Subject` table:
| id | name    |
|----|---------|
| 1  | Math    |
| 2  | Science |

**Output:**

| Subject | Student | Score |
|---------|---------|-------|
| Math    | Derek   | 95    |
| Math    | Alice   | 92    |
| Math    | Fiona   | 92    |
| Math    | George  | 90    |
| Science | Carol   | 87    |
| Science | Bob     | 85    |

In this example, the top achievers in each subject are determined based on their scores, with a maximum of three students recognized per subject if there are at least three unique scores.
