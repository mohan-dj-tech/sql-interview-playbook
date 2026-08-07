-- Problem: Patient Appointment No-Shows
/* Solution:
 To count the number of 'No-Show' appointments for each patient, this query first
 filters the `Appointments` table to include only rows where the `status` is
 'No-Show'. It then groups the filtered results by `patient_id` and uses `COUNT(*)`
 to count the number of missed appointments for each patient. The final result is
 ordered by `patient_id`.
*/
SELECT
    patient_id,
    COUNT(*) AS no_shows
FROM
    Appointments
WHERE
    status = 'No-Show'
GROUP BY
    patient_id
ORDER BY
    patient_id ASC;
