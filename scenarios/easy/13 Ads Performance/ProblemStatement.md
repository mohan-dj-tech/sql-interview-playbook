# Problem: Ads Performance

## Problem Statement

Table: `Ads`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| ad_id         | int     |
| user_id       | int     |
| action        | enum    |
+---------------+---------+
```
`(ad_id, user_id)` is the primary key for this table. The `action` column is an ENUM of type ('Clicked', 'Viewed', 'Ignored').

The performance of an ad is measured by its **Click-Through Rate (CTR)**, calculated as:
`CTR = (Total Clicks / (Total Clicks + Total Views)) * 100`

If an ad has 0 clicks and 0 views, its CTR is 0.

Write a solution to find the CTR of each ad, rounded to two decimal places. Return the result table ordered by `ctr` in descending order and by `ad_id` in ascending order in case of a tie.

---

## Example

**Input:**

`Ads` table:
```
+-------+---------+---------+
| ad_id | user_id | action  |
+-------+---------+---------+
| 1     | 1       | Clicked |
| 2     | 2       | Clicked |
| 3     | 3       | Viewed  |
| 5     | 5       | Ignored |
| 1     | 7       | Ignored |
| 2     | 7       | Viewed  |
| 3     | 5       | Clicked |
| 1     | 4       | Viewed  |
| 2     | 11      | Viewed  |
| 1     | 2       | Clicked |
+-------+---------+---------+
```

**Expected Output:**
```
+-------+-------+
| ad_id | ctr   |
+-------+-------+
| 1     | 66.67 |
| 3     | 50.00 |
| 2     | 33.33 |
| 5     | 0.00  |
+-------+-------+
```

**Explanation:**
- **Ad 1:** 2 Clicks, 1 View. CTR = `(2 / (2 + 1)) * 100 = 66.67`
- **Ad 2:** 1 Click, 2 Views. CTR = `(1 / (1 + 2)) * 100 = 33.33`
- **Ad 3:** 1 Click, 1 View. CTR = `(1 / (1 + 1)) * 100 = 50.00`
- **Ad 5:** 0 Clicks, 0 Views. CTR = `0.00`
The results are ordered by CTR descending, then by ad_id ascending.
