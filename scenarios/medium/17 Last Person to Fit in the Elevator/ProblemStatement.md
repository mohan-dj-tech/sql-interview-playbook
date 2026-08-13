# Problem: Last Person to Fit in the Elevator

## Problem Statement

Table: `ElevatorQueue`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| person_id   | int     |
| name        | varchar |
| weight      | int     |
| position    | int     |
+-------------+---------+
```
`person_id` and `position` are unique. `position` determines the boarding order. The elevator has a maximum weight capacity of **800** kilograms.

Write a solution to find the name of the **last** person who can board the elevator without the total weight exceeding the 800 kg limit. It's guaranteed that the first person in the queue can fit.

---

## Example

**Input:**

`ElevatorQueue` table:
```
+-----------+---------+--------+----------+
| person_id | name    | weight | position |
+-----------+---------+--------+----------+
| 1         | Alice   | 200    | 1        |
| 2         | Bob     | 150    | 4        |
| 3         | Charlie | 300    | 2        |
| 4         | Dave    | 225    | 5        |
| 5         | Eve     | 175    | 3        |
| 6         | Fiona   | 350    | 6        |
+-----------+---------+--------+----------+
```

**Expected Output:**
```
+------+
| name |
+------+
| Eve  |
+------+
```

**Explanation:**
The people board in order of their `position`:
1.  Alice (200 kg). Total weight: 200.
2.  Charlie (300 kg). Total weight: 200 + 300 = 500.
3.  Eve (175 kg). Total weight: 500 + 175 = 675.
4.  Bob (150 kg). Total weight: 675 + 150 = 825. This exceeds the 800 kg limit.

Eve was the last person to board without exceeding the weight limit.
