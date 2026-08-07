-- Problem: Unused Accounts
/* Solution:
 To find accounts that had no transactions in 2020, this query uses a `LEFT JOIN`
 from the `Accounts` table to the `Transactions` table. The join condition matches
 `account_id` and also filters the `Transactions` table to include only records from
 the year 2020. If an account had no transactions in 2020, the columns from the
 `Transactions` table will be `NULL`. The `WHERE T.account_id IS NULL` clause then
 filters to select only these accounts. The result is ordered by `account_name`.
*/
SELECT
    A.account_name
FROM
    Accounts AS A
    LEFT JOIN Transactions AS T ON A.account_id = T.account_id
    AND YEAR(T.transaction_date) = 2020
WHERE
    T.account_id IS NULL
ORDER BY
    A.account_name ASC;
