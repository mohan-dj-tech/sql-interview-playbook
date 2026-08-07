# Problem: Patient Appointment No-Shows

## Problem Statement

Table: `Appointments`
```
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| appointment_id   | int     |
| patient_id       | int     |
| doctor_id        | int     |
| appointment_date | date    |
| status           | enum    |
+------------------+---------+
```
`appointment_id` is the primary key for this table. `status` is an ENUM of type ('Completed', 'Cancelled', 'No-Show').

Write a solution to find the number of times each patient missed their appointments (i.e., `status = 'No-Show'`). The result should include `patient_id` and the count of missed appointments as `no_shows`. If a patient has never missed an appointment, they should not appear in the output.

Return the result table ordered by `patient_id` in ascending order.

---

## Example

**Input:**

`Appointments` table:
```
+----------------+------------+-----------+------------------+----------+
| appointment_id | patient_id | doctor_id | appointment_date | status   |
+----------------+------------+-----------+------------------+----------+
| 1              | 1          | 101       | 2020-09-01       | Completed|
| 2              | 2          | 102       | 2020-09-01       | No-Show  |
| 3              | 1          | 103       | 2020-09-02       | Cancelled|
| 4              | 3          | 101       | 2020-09-02       | No-Show  |
| 5              | 2          | 103       | 2020-09-03       | No-Show  |
| 6              | 3          | 102       | 2020-09-03       | Completed|
+----------------+------------+-----------+------------------+----------+
```

**Expected Output:**
```
+------------+----------+
| patient_id | no_shows |
+------------+----------+
| 2          | 2        |
| 3          | 1        |
+------------+----------+
```

**Explanation:**
- Patient 1 had no 'No-Show' appointments.
- Patient 2 had two 'No-Show' appointments.
- Patient 3 had one 'No-Show' appointment.
The query filters for 'No-Show' statuses, groups by `patient_id`, and counts the occurrences.
