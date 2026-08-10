# Problem: Average Selling Price

## Problem Statement

Table: `Prices`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| start_date    | date    |
| end_date      | date    |
| price         | int     |
+---------------+---------+
```
`(product_id, start_date, end_date)` is the primary key for this table. Each row indicates the price of a product during a specified period. There are no overlapping periods for the same `product_id`.

Table: `UnitsSold`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| purchase_date | date    |
| units         | int     |
+---------------+---------+
```
This table may contain duplicate rows. Each row indicates the number of units of a product sold on a specific date.

Write a solution to find the **average selling price** for each product. `average_price` should be rounded to 2 decimal places.

---

## Example

**Input:**

`Prices` table:
```
+------------+------------+------------+-------+
| product_id | start_date | end_date   | price |
+------------+------------+------------+-------+
| 1          | 2019-02-17 | 2019-02-28 | 5     |
| 1          | 2019-03-01 | 2019-03-22 | 20    |
| 2          | 2019-02-01 | 2019-02-20 | 15    |
| 2          | 2019-02-21 | 2019-03-31 | 30    |
+------------+------------+------------+-------+
```

`UnitsSold` table:
```
+------------+---------------+-------+
| product_id | purchase_date | units |
+------------+---------------+-------+
| 1          | 2019-02-25    | 100   |
| 1          | 2019-03-01    | 15    |
| 2          | 2019-02-10    | 200   |
| 2          | 2019-03-22    | 30    |
+------------+---------------+-------+
```

**Expected Output:**
```
+------------+---------------+
| product_id | average_price |
+------------+---------------+
| 1          | 6.96          |
| 2          | 16.96         |
+------------+---------------+
```

**Explanation:**
- **Product 1:** 100 units were sold at $5, and 15 units were sold at $20. Average price: `((100 * 5) + (15 * 20)) / (100 + 15) = 800 / 115 = 6.96`
- **Product 2:** 200 units were sold at $15, and 30 units were sold at $30. Average price: `((200 * 15) + (30 * 30)) / (200 + 30) = 3900 / 230 = 16.96`
The query calculates the total revenue for each product and divides it by the total units sold.
