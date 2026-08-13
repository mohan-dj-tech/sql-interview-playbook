# Problem: Product Price on a Specific Date

## Problem Statement

Table: `PriceChanges`
```
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| product_id     | int     |
| new_price      | int     |
| effective_date | date    |
+----------------+---------+
```
`(product_id, effective_date)` is the primary key for this table. Each row indicates a price change for a product on a specific date.

Write a solution to find the prices of all products on **2019-08-16**. Assume the price of all products before any price change was **10**.

Return the result table ordered by `product_id`.

---

## Example

**Input:**

`PriceChanges` table:
```
+------------+-----------+----------------+
| product_id | new_price | effective_date |
+------------+-----------+----------------+
| 1          | 20        | 2019-08-14     |
| 2          | 50        | 2019-08-14     |
| 1          | 30        | 2019-08-15     |
| 1          | 35        | 2019-08-16     |
| 2          | 65        | 2019-08-17     |
| 3          | 20        | 2019-08-18     |
+------------+-----------+----------------+
```

**Expected Output:**
```
+------------+-------+
| product_id | price |
+------------+-------+
| 1          | 35    |
| 2          | 50    |
| 3          | 10    |
+------------+-------+
```

**Explanation:**
- **Product 1**: The price changed to 35 on 2019-08-16.
- **Product 2**: The last price change before 2019-08-16 was to 50 on 2019-08-14.
- **Product 3**: There were no price changes on or before 2019-08-16, so its price is the default 10.
The query needs to find the most recent price for each product on or before the target date.
