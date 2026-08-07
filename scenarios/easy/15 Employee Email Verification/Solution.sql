-- Problem: Employee Email Verification
/* Solution:
 To identify employees with valid emails, this query uses a regular expression in the
 `WHERE` clause to filter the `Employees` table. The `REGEXP` operator matches the
 `email` column against a pattern that enforces the specified rules:
 - `^[A-Za-z]`: Starts with a letter.
 - `[A-Za-z0-9_.-]*`: Followed by any number of allowed characters.
 - `@corpexample\\.com$`: Ends with the exact domain name. The double backslash
   is necessary to escape the period, which is a special character in regex.
*/
SELECT
    *
FROM
    Employees
WHERE
    email REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@corpexample\\.com$';
