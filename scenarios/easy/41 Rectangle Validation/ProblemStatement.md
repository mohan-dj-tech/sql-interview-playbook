# Problem: Rectangle Validation

## Table: Rectangle

This table stores the dimensions of rectangles. Each row contains the lengths of four sides of a rectangle.

| Column Name   | Type |
|---------------|------|
| a             | int  |
| b             | int  |
| c             | int  |
| d             | int  |

`(a, b, c, d)` is the primary key for this table.
Each row of this table contains the lengths of four sides of a rectangle.

## Task

Determine for each set of four line segments whether they can form a rectangle. A set of line segments can form a rectangle if opposite sides are equal.

Return the result table in any order.

## Example

**Input:**

`Rectangle` table:
| a  | b  | c  | d  |
|----|----|----|----|
| 15 | 10 | 15 | 10 |
| 15 | 10 | 15 | 20 |

**Output:**

| a  | b  | c  | d  | rectangle |
|----|----|----|----|-----------|
| 15 | 10 | 15 | 10 | Yes       |
| 15 | 10 | 15 | 20 | No        |

In this example, the first set of sides (15, 10, 15, 10) can form a rectangle because the opposite sides are equal. The second set of sides (15, 10, 15, 20) cannot form a rectangle because not all opposite sides are equal.
