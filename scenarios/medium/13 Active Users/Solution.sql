-- Problem: Active Users
/* Solution:
 To identify active users who have logged in for five or more consecutive days, this SQL solution employs a self-join and aggregation.

 1.  **Self-Join**: The `Logins` table is joined with itself (`l1` and `l2`). The join condition `l1.id = l2.id` ensures we are comparing logins for the same user. The condition `DATEDIFF(l2.login_date, l1.login_date) BETWEEN 1 AND 4` finds, for each login `l1`, four other logins `l2` that occurred in the next 4 days.
 2.  **Grouping**: The result is grouped by the user `id` and the initial `login_date` from `l1`.
 3.  **Filtering with HAVING**: The `HAVING COUNT(DISTINCT l2.login_date) = 4` clause filters these groups to find cases where a login (`l1`) was followed by four other distinct login days within the next four days, confirming a 5-day consecutive streak.
 4.  **Final Selection**: The main `SELECT` then retrieves the distinct `id` of these active users and uses a correlated subquery to fetch their `name` from the `Accounts` table.
*/
SELECT DISTINCT l1.id,
                (SELECT name
                 FROM   Accounts
                 WHERE  id = l1.id) AS NAME
FROM   Logins l1
       JOIN Logins l2
         ON l1.id = l2.id
            AND Datediff(l2.login_date, l1.login_date) BETWEEN 1 AND 4
GROUP  BY l1.id,
          l1.login_date
HAVING Count(DISTINCT l2.login_date) = 4