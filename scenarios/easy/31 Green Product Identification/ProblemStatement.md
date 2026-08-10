# Problem: Green Product Identification

## Problem Statement

Table: `Inventory`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| organic       | enum    |
| biodegradable | enum    |
+---------------+---------+
```
`product_id` is the primary key for this table. `organic` and `biodegradable` are ENUMs of type ('Y', 'N').

Write a solution to identify the `product_id`s of products that are both **organic** ('Y') and have **biodegradable** packaging ('Y').

---

## Example

**Input:**

`Inventory` table:
```
+------------+---------+---------------+
| product_id | organic | biodegradable |
+------------+---------+---------------+
| 10         | Y       | N             |
| 11         | Y       | Y             |
| 12         | N       | Y             |
| 13         | Y       | Y             |
| 14         | N       | N             |
+------------+---------+---------------+
```

**Expected Output:**
```
+------------+
| product_id |
+------------+
| 11         |
| 13         |
+------------+
```

**Explanation:**
Products with `product_id` 11 and 13 are the only ones that are both organic ('Y') and have biodegradable packaging ('Y').
