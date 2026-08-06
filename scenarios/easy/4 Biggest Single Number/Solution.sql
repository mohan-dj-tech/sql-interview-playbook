-- Problem: Biggest Single Number
/* Solution:
 To find the largest single number, this query first identifies all numbers that appear
 more than once using a subquery with `GROUP BY` and `HAVING`. It then filters the
 main table to exclude these duplicate numbers, leaving only the single numbers.
 Finally, it selects the maximum value from the remaining single numbers. If no
 single number exists, `MAX` will return `null`.
*/
SELECT
    MAX(num) AS num
FROM
    MyNumbers
WHERE
    num NOT IN (
        SELECT
            num
        FROM
            MyNumbers
        GROUP BY
            num
        HAVING
            COUNT(*) > 1
    );
