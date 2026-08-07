# Problem: Group Sold Products By The Date

## Problem Statement

Table: `Activities`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
```
There is no primary key for this table; it may contain duplicates. Each row contains the product name and the date it was sold.

Write a solution to find, for each date, the number of different products sold and their names. The names of the sold products should be sorted lexicographically and concatenated into a single string.

Return the result table ordered by `sell_date`.

---

## Example

**Input:**

`Activities` table:
```
+------------+------------+
| sell_date  | product    |
+------------+------------+
| 2020-05-30 | Headphone  |
| 2020-06-01 | Pencil     |
| 2020-06-02 | Mask       |
| 2020-05-30 | Basketball |
| 2020-06-01 | Bible      |
| 2020-06-02 | Mask       |
| 2020-05-30 | T-Shirt    |
+------------+------------+
```

**Expected Output:**
```
+------------+----------+------------------------------+
| sell_date  | num_sold | products                     |
+------------+----------+------------------------------+
| 2020-05-30 | 3        | Basketball,Headphone,T-Shirt |
| 2020-06-01 | 2        | Bible,Pencil                 |
| 2020-06-02 | 1        | Mask                         |
+------------+----------+------------------------------+
```

**Explanation:**
- **2020-05-30:** 3 distinct products were sold: "Basketball", "Headphone", and "T-Shirt".
- **2020-06-01:** 2 distinct products were sold: "Bible" and "Pencil".
- **2020-06-02:** 1 distinct product was sold: "Mask".
The query groups the data by `sell_date`, counts the distinct products, and aggregates their names.
