-- Problem: Status of Flight Tickets

/*
Solution:
To determine the current status of flight tickets for each passenger—whether their booking is Confirmed or on the Waitlist—we analyze the Flights and Passengers tables. We ca efficiently accomplishes this by utilizing window functions and conditional logic to rank passengers based on their booking times relative to flight capacities. Below is a comprehensive breakdown of the approach, step-by-step execution, and detailed explanations for each line of the SQL query.

Approach Overview
1. **Combine Flight and Passenger Data**:
   - Merge data from Flights and Passengers tables to associate passengers with flight capacities.
2. **Rank Passengers per Flight by Booking Time**:
   - Assign a rank to each passenger within their respective flights based on their booking times.
3. **Determine Ticket Status**:
   - Compare each passenger's rank with the flight's capacity to assign 'Confirmed' or 'Waitlist' status.
4. **Present the Final Results**:
   - Display each passenger's ID alongside their ticket status, ordered by passenger_id in ascending order.
*/

-- SQL Query
SELECT passenger_id,
       IF(Rank()
            over(
              PARTITION BY flight_id
              ORDER BY booking_time) <= capacity, 'Confirmed', 'Waitlist') AS
       Status
FROM   Passengers
       LEFT JOIN Flights USING(flight_id)
ORDER  BY passenger_id;
