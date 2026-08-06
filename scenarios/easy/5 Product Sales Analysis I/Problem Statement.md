# Problem: Product Sales Analysis I

## Problem Statement

Table: `Sales`
```
+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
```
`(sale_id, year)` is the primary key of this table. `product_id` is a foreign key to the `Product` table. Each row shows a sale of a product in a certain year. The price is per unit.

Table: `Product`
```
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
```
`product_id` is the primary key of this table.

Write a solution to report the `product_name`, `year`, and `price` for each `sale_id` in the `Sales` table. Return the result table ordered by `year`.

---

## Example

**Input:**

`Sales` table:
```
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+
```

`Product` table:
```
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+
```

**Expected Output:**
```
+--------------+------+-------+
| product_name | year | price |
+--------------+------+-------+
| Nokia        | 2008 | 5000  |
| Nokia        | 2009 | 5000  |
| Apple        | 2011 | 9000  |
+--------------+------+-------+
```

**Explanation:**
The query joins the `Sales` and `Product` tables on `product_id` to retrieve the product name for each sale and then selects the required columns. The output is ordered by year.
