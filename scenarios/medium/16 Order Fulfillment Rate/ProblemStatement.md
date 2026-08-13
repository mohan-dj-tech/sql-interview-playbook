# Problem: Order Fulfillment Rate

## Problem Statement

Table: `Orders`
```
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| order_id    | int      |
| customer_id | int      |
| time_stamp  | datetime |
+-------------+----------+
```
`order_id` is the primary key.

Table: `Deliveries`
```
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| order_id    | int      |
| time_stamp  | datetime |
| status      | ENUM     |
+-------------+----------+
```
`(order_id, time_stamp)` is the primary key. `status` is an ENUM ('delivered', 'failed').

The **fulfillment rate** for a customer is the average of the fulfillment rates of all their orders. The fulfillment rate of a single order is the number of 'delivered' attempts divided by the total number of delivery attempts. If an order has no delivery attempts, its fulfillment rate is 0.

Write a solution to calculate the fulfillment rate for each customer, rounded to two decimal places.

---

## Example

**Input:**

`Orders` table:
```
+----------+-------------+---------------------+
| order_id | customer_id | time_stamp          |
+----------+-------------+---------------------+
| 1        | 100         | 2020-03-21 10:16:13 |
| 2        | 200         | 2020-01-04 13:57:59 |
| 3        | 100         | 2020-07-29 23:09:44 |
| 4        | 300         | 2020-12-09 10:39:37 |
+----------+-------------+---------------------+
```

`Deliveries` table:
```
+----------+---------------------+-----------+
| order_id | time_stamp          | status    |
+----------+---------------------+-----------+
| 1        | 2020-03-22 09:00:00 | delivered |
| 1        | 2020-03-22 15:00:00 | failed    |
| 2        | 2020-01-05 14:00:00 | delivered |
| 3        | 2020-08-01 00:00:00 | delivered |
| 3        | 2020-08-01 12:00:00 | delivered |
| 4        | 2020-12-10 11:00:00 | failed    |
+----------+---------------------+-----------+
```

**Expected Output:**
```
+-------------+------------------+
| customer_id | fulfillment_rate |
+-------------+------------------+
| 100         | 0.75             |
| 200         | 1.00             |
| 300         | 0.00             |
+-------------+------------------+
```

**Explanation:**
- **Customer 100**:
  - Order 1: 1 'delivered' / 2 attempts = 0.5
  - Order 3: 2 'delivered' / 2 attempts = 1.0
  - Avg Fulfillment Rate: `(0.5 + 1.0) / 2 = 0.75`
- **Customer 200**:
  - Order 2: 1 'delivered' / 1 attempt = 1.0
  - Avg Fulfillment Rate: `1.00`
- **Customer 300**:
  - Order 4: 0 'delivered' / 1 attempt = 0.0
  - Avg Fulfillment Rate: `0.00`
