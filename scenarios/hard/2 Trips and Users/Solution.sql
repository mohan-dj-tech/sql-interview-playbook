-- Problem: Trips and Users

/*
Solution:
To calculate the cancellation rate of taxi trip requests with unbanned users between "2013-10-01" and "2013-10-03", we need to analyze the Trips and Users tables. The cancellation rate is defined as the ratio of the number of canceled trips (either canceled by the client or the driver) to the total number of trip requests, considering only those trips where both the client and the driver are not banned.

Approach Overview
1. **Filter Unbanned Users**:
   - Clients: Exclude trips where the client_id corresponds to a banned user.
   - Drivers: Exclude trips where the driver_id corresponds to a banned user.
2. **Filter by Date Range**:
   - Consider only trips with request_at dates between "2013-10-01" and "2013-10-03".
3. **Calculate Cancellation Rate**:
   - Numerator: Count of trips with status 'cancelled_by_driver' or 'cancelled_by_client'.
   - Denominator: Total number of trips (including both completed and canceled) within the specified date range and with unbanned users.
   - Cancellation Rate: (Number of Canceled Trips) / (Total Number of Trips) rounded to two decimal places.
4. **Present the Results**:
   - Display the Day and the corresponding Cancellation Rate in the specified format.
*/

-- SQL Query
SELECT request_at AS Day,
       Round(SUM(IF(status = 'completed', 0, 1)) / Count(status), 2) AS 'Cancellation Rate'
FROM   Trips
WHERE  client_id NOT IN (SELECT users_id
                         FROM   Users
                         WHERE  banned = 'Yes')
       AND driver_id NOT IN (SELECT users_id
                             FROM   Users
                             WHERE  banned = 'Yes')
       AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP  BY request_at;