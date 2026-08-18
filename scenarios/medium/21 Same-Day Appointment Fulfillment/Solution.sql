-- Problem: Same-Day Appointment Fulfillment

/*
Solution:
To determine the percentage of immediate appointments among the first appointments of all patients, we need to systematically identify each patient's earliest appointment and check if it was scheduled immediately. An appointment is considered immediate if the patient's preferred appointment date matches the booking date.

1. **Identify First Appointments**: Determine the earliest booking date for each patient to identify their first appointment.
2. **Determine Immediate Appointments**: Check if the first appointment's booking date matches the patient's preferred appointment date.
3. **Calculate Percentage**: Compute the ratio of immediate first appointments to the total number of first appointments, and round it to two decimal places.
*/

-- SQL Query
WITH FirstAppointments AS (
    SELECT patient_id, MIN(booking_date) AS first_booking_date
    FROM Appointments
    GROUP BY patient_id
)
SELECT ROUND(
    (SELECT COUNT(*) FROM FirstAppointments fa
     JOIN Appointments a ON fa.patient_id = a.patient_id AND fa.first_booking_date = a.booking_date
     WHERE a.booking_date = a.patient_pref_date) /
    (SELECT COUNT(*) FROM FirstAppointments) * 100, 2) AS immediate_percentage;
