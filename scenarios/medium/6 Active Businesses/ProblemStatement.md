# Problem: Active Businesses

## Problem Statement

Table: `Events`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| business_id   | int     |
| event_type    | varchar |
| occurrences   | int     |
+---------------+---------+
```
`(business_id, event_type)` is the primary key for this table. Each row logs the number of times an event of a certain type occurred for a business.

The **average activity** for a particular `event_type` is the average `occurrences` across all businesses that have that event.

An **active business** is a business that has more than one `event_type` where their `occurrences` is strictly greater than the average activity for that event type.

Write a solution to find all active businesses.

---

## Example

**Input:**

`Events` table:
```
+-------------+------------+-------------+
| business_id | event_type | occurrences |
+-------------+------------+-------------+
| 1           | reviews    | 7           |
| 3           | reviews    | 3           |
| 1           | ads        | 11          |
| 2           | ads        | 7           |
| 3           | ads        | 6           |
| 1           | page views | 3           |
| 2           | page views | 12          |
+-------------+------------+-------------+
```

**Expected Output:**
```
+-------------+
| business_id |
+-------------+
| 1           |
+-------------+
```

**Explanation:**
- **Average 'reviews'**: `(7 + 3) / 2 = 5`. Business 1's 'reviews' (7) is > 5.
- **Average 'ads'**: `(11 + 7 + 6) / 3 = 8`. Business 1's 'ads' (11) is > 8.
- **Average 'page views'**: `(3 + 12) / 2 = 7.5`. Business 1's 'page views' (3) is not > 7.5.

Business 1 has two event types ('reviews' and 'ads') with occurrences greater than the average for those types. Therefore, it is an active business.
