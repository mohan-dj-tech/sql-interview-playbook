# Problem: Same-Day Appointment Fulfillment

## Table: Appointments

This table holds information about medical appointments for patients. Each appointment includes an appointment ID, patient ID, the date the appointment was made, and the preferred appointment date specified by the patient.

| Column Name            | Type    |
|------------------------|---------|
| appointment_id         | int     |
| patient_id             | int     |
| booking_date           | date    |
| patient_pref_date      | date    |

`appointment_id` is the column of unique values for this table.
An appointment is considered immediate if the patient's preferred appointment date is the same as the booking date; otherwise, it is considered scheduled.

The first appointment of a patient is defined as the appointment with the earliest booking date made by that patient. It is assured that each patient has exactly one first appointment.

## Task

Develop a solution to find the percentage of immediate appointments among the first appointments of all patients, rounded to 2 decimal places.

Return the result in the format illustrated in the following example.

## Example

**Input:**

`Appointments` table:
| appointment_id | patient_id | booking_date | patient_pref_date|
|----------------|------------|-------------|------------------|
| 10             | 20         | 2020-07-01   | 2020-07-02       |
| 11             | 30         | 2020-07-02   | 2020-07-02       |
| 12             | 20         | 2020-07-15   | 2020-07-16       |
| 13             | 40         | 2020-07-22   | 2020-07-22       |
| 14             | 40         | 2020-07-18   | 2020-07-19       |
| 15             | 30         | 2020-07-20   | 2020-07-22       |
| 16             | 50         | 2020-07-25   | 2020-07-25       |

**Output:**

| immediate_percentage |
|----------------------|
| 50.00                |

Here, the first appointments of the patients having `patient_id` 30 and 50 have immediate appointments.
