-- Problem: Suspicious Bank Accounts
/* Solution:
 To identify suspicious bank accounts, this query uses two Common Table Expressions (CTEs) to first calculate monthly incomes and then check for consecutive months of excessive income.

 1.  **`incomes` CTE**:
     - Joins `Transactions` and `Accounts` tables.
     - Filters for 'Creditor' transactions to sum up the total income for each account for each month.
     - The `HAVING` clause filters out months where the total income did *not* exceed the `max_income`.

 2.  **`consec_income` CTE**:
     - This CTE operates on the results of the `incomes` CTE (which only contains months with excessive income).
     - It uses the `LAG()` window function to get the `trans_month` from the previous row for each account.
     - `TIMESTAMPDIFF(MONTH, ...)` then calculates the difference in months between the current excessive-income month and the previous one.

 3.  **Final `SELECT`**:
     - The final query selects the distinct `account_id` from the `consec_income` CTE.
     - The `WHERE prev_month = 1` clause filters for accounts where the month difference is exactly 1, indicating two consecutive months of excessive income.
*/
WITH incomes AS (
    SELECT
        a.account_id,
        DATE_FORMAT(day, '%Y-%m-01') AS trans_month,
        SUM(amount) AS total_income,
        b.max_income
    FROM
        Transactions a
    INNER JOIN
        Accounts b ON a.account_id = b.account_id
    WHERE
        type = 'Creditor'
    GROUP BY
        a.account_id, DATE_FORMAT(day, '%Y-%m-01'), b.max_income
    HAVING
        IF(SUM(amount) > b.max_income, 1, 0) = 1
),
consec_income AS (
    SELECT
        account_id,
        TIMESTAMPDIFF(
            MONTH,
            LAG(trans_month, 1) OVER (
                PARTITION BY account_id
                ORDER BY trans_month
            ),
            trans_month
        ) AS prev_month
    FROM
        incomes
)
SELECT DISTINCT
    account_id
FROM
    consec_income
WHERE
    prev_month = 1;
