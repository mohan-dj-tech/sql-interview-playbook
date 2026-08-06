# Problem: Major Cities

## Problem Statement

Table: `World`

Each row in this table represents a city, detailing its name, the country it's in, its area in square kilometers, and its population.

```
+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| city_name       | varchar |
| country         | varchar |
| area            | int     |  -- in square kilometers
| population      | int     |
+-----------------+---------+
```
`city_name` is the primary key for this table.

Develop a solution to identify the names of major cities that either have an area greater than 3000 square kilometers or a population exceeding 5 million people. The output should be sorted in any order.

---

## Example

**Input:**

`World` table:
```
+-----------+---------+-------+------------+
| city_name | country | area  | population |
+-----------+---------+-------+------------+
| Tokyo     | Japan   | 6223  | 13929286   |
| Delhi     | India   | 1484  | 11034555   |
| Shanghai  | China   | 6341  | 24256800   |
| New York  | USA     | 783   | 8336817    |
| Paris     | France  | 105   | 2148271    |
+-----------+---------+-------+------------+
```

**Expected Output:**
```
+-----------+
| city_name |
+-----------+
| Tokyo     |
| Delhi     |
| Shanghai  |
| New York  |
+-----------+
```

**Explanation:**

Tokyo, Shanghai, and New York are identified as major cities either due to their large area or high population. Delhi is included due to its high population.
