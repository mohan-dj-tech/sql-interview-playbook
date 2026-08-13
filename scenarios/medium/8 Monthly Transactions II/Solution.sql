-- Problem: Monthly Transactions II
/* Solution:
 To determine the number of approved transactions and their total amount, and the number of chargebacks and their total amount for each month and country, we can follow a structured approach. This leverages SQL's aggregation and conditional functions by combining relevant data from the Transactions and Chargebacks tables.

 1.  **Combine Data**: A `UNION ALL` is used to merge two sets of data:
     - The first `SELECT` joins `Chargebacks` with `Transactions` to get the country and amount for each chargeback, labeling the state as "back".
     - The second `SELECT` gets all 'approved' transactions directly from the `Transactions` table.
 2.  **Aggregate Data by Month and Country**: The outer query groups the combined data by `month` and `country`.
 3.  **Conditional Aggregation**: `SUM(CASE ...)` is used to count the occurrences and sum the amounts for both "approved" states and "back" states separately.
 4.  **Filter Out Zeros**: `HAVING` clause removes rows where all metrics would be zero.
 5.  **Order the Results**: The final output is sorted by month.
*/
SELECT month,
       country,
       Sum(CASE
             WHEN state = "approved" THEN 1
             ELSE 0
           END) AS approved_count,
       Sum(CASE
             WHEN state = "approved" THEN amount
             ELSE 0
           END) AS approved_amount,
       Sum(CASE
             WHEN state = "back" THEN 1
             ELSE 0
           END) AS chargeback_count,
       Sum(CASE
             WHEN state = "back" THEN amount
             ELSE 0
           END) AS chargeback_amount
FROM   (SELECT LEFT(Chargebacks.trans_date, 7) AS month,
               country,
               "back"                          AS state,
               amount
        FROM   Chargebacks
               JOIN Transactions
                 ON Chargebacks.trans_id = Transactions.id
        UNION ALL
        SELECT LEFT(trans_date, 7) AS month,
               country,
               state,
               amount
        FROM   Transactions
        WHERE  state = "approved") s
GROUP  BY month,
          country
HAVING approved_count > 0 OR chargeback_count > 0
ORDER BY month;
