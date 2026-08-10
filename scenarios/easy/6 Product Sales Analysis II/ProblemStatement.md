# Problem: Product Sales Analysis II

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

Write a solution to report the total quantity sold for every `product_id`.

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
+------------+----------------+
| product_id | total_quantity |
+------------+----------------+
| 100        | 22             |
| 200        | 15             |
+------------+----------------+
```

**Explanation:**
- For `product_id` 100, the total quantity is the sum of quantities from sale_id 1 (10) and 2 (12), which is 22.
- For `product_id` 200, the total quantity is from sale_id 7, which is 15.
The query groups the sales by `product_id` and calculates the sum of `quantity` for each product.
