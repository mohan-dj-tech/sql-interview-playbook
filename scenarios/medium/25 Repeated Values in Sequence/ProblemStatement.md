# Problem: Repeated Values in Sequence

## Table: Sequence

Each row in this table represents a sequence of numbers with a unique ID and a value for each position in the sequence.

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| value       | int     |

`id` is the primary key for this table.
This table may contain duplicate values in the 'value' column.

## Task

Develop a solution to find all values that appear at least three times consecutively in the sequence.

Return the result table in any order.

## Example

**Input:**

`Sequence` table:
| id | value |
|----|-------|
| 1  | 100   |
| 2  | 100   |
| 3  | 100   |
| 4  | 200   |
| 5  | 100   |
| 6  | 200   |
| 7  | 200   |

**Output:**

| RepeatedValues  |
|-----------------|
| 100             |
