# Problem: Average Time of Process per Machine

## Problem Statement

Table: `Activity`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| machine_id    | int     |
| process_id    | int     |
| activity_type | enum    |
| timestamp     | float   |
+---------------+---------+
```
`(machine_id, process_id, activity_type)` is the primary key for this table. `activity_type` is an ENUM of type ('start', 'end'). The 'start' timestamp is always before the 'end' timestamp for any given process.

Write a solution to find the **average time** each machine takes to complete a process. The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is the total time for all processes on a machine divided by the number of processes.

Return the result table with `machine_id` and `processing_time` (rounded to 3 decimal places), in any order.

---

## Example

**Input:**

`Activity` table:
```
+------------+------------+---------------+-----------+
| machine_id | process_id | activity_type | timestamp |
+------------+------------+---------------+-----------+
| 0          | 0          | start         | 0.712     |
| 0          | 0          | end           | 1.520     |
| 0          | 1          | start         | 3.140     |
| 0          | 1          | end           | 4.120     |
| 1          | 0          | start         | 0.550     |
| 1          | 0          | end           | 1.550     |
| 1          | 1          | start         | 0.430     |
| 1          | 1          | end           | 1.420     |
| 2          | 0          | start         | 4.100     |
| 2          | 0          | end           | 4.512     |
| 2          | 1          | start         | 2.500     |
| 2          | 1          | end           | 5.000     |
+------------+------------+---------------+-----------+
```

**Expected Output:**
```
+------------+-----------------+
| machine_id | processing_time |
+------------+-----------------+
| 0          | 0.894           |
| 1          | 0.995           |
| 2          | 1.456           |
+------------+-----------------+
```

**Explanation:**
- **Machine 0:**
  - Process 0: `1.520 - 0.712 = 0.808`
  - Process 1: `4.120 - 3.140 = 0.980`
  - Average: `(0.808 + 0.980) / 2 = 0.894`
- **Machine 1:**
  - Process 0: `1.550 - 0.550 = 1.000`
  - Process 1: `1.420 - 0.430 = 0.990`
  - Average: `(1.000 + 0.990) / 2 = 0.995`
- **Machine 2:**
  - Process 0: `4.512 - 4.100 = 0.412`
  - Process 1: `5.000 - 2.500 = 2.500`
  - Average: `(0.412 + 2.500) / 2 = 1.456`
The query calculates the average processing time for each machine.
