# Problem: Retail Expansion Analysis

## Problem Statement

Table: `StorePerformance`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| store_id    | int     |
| rev_2020    | float   |
| rev_2021    | float   |
| lat         | float   |
| lon         | float   |
+-------------+---------+
```
`store_id` is the primary key.

Write a solution to calculate the total potential revenue for 2021 from stores that meet two conditions:
1.  Their `rev_2020` is the same as at least one other store.
2.  They are located at unique geographical coordinates (i.e., no other store shares their `lat` and `lon`).

---

## Example

**Input:**

`StorePerformance` table:
```
+----------+----------+----------+------+------+
| store_id | rev_2020 | rev_2021 | lat  | lon  |
+----------+----------+----------+------+------+
| 1        | 100      | 150      | 10.0 | 10.0 |
| 2        | 200      | 250      | 20.0 | 20.0 |
| 3        | 100      | 300      | 20.0 | 20.0 |
| 4        | 100      | 400      | 40.0 | 40.0 |
+----------+----------+----------+------+------+
```

**Expected Output:**
```
+-----------------+
| total_rev_2021  |
+-----------------+
| 550.00          |
+-----------------+
```

**Explanation:**
- **Stores with non-unique `rev_2020`**: Stores 1, 3, and 4 all had a `rev_2020` of 100.
- **Stores with unique locations**:
  - Store 1 (10.0, 10.0) is unique.
  - Store 2 and 3 share a location (20.0, 20.0), so they are not unique.
  - Store 4 (40.0, 40.0) is unique.
- **Qualifying stores**:
  - Store 1 meets both conditions.
  - Store 4 meets both conditions.
- **Total `rev_2021`**: `150 (from store 1) + 400 (from store 4) = 550`.
