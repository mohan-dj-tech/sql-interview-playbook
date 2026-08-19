# Problem: Students Report By Geography

## Table: Student

| Column Name | Type    |
|-------------|---------|
| name        | varchar |
| continent   | varchar |

This table may contain duplicate rows.
Each row of this table indicates the name of a student and the continent they came from.

## Task

A school has students from Asia, Europe, and America.

Write a solution to pivot the continent column in the `Student` table so that each name is sorted alphabetically and displayed underneath its corresponding continent. The output headers should be `America`, `Asia`, and `Europe`, respectively.

## Example

**Input:**

`Student` table:
| name   | continent |
|--------|-----------|
| Jane   | America   |
| Pascal | Europe    |
| Xi     | Asia      |
| Jack   | America   |

**Output:**

| America | Asia | Europe  |
|---------|------|---------|
| Jack    | Xi   | Pascal  |
| Jane    | NULL | NULL    |
