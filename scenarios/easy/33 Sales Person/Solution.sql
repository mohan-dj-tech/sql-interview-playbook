-- Problem: Sales Person
/* Solution:
In order to identify salespeople whose sales transactions are not linked to a company with the name 'RED,' we employ a structured SQL query on the "SalesPerson," "Orders," and "Company" tables.
The query utilizes a subquery to exclude sales IDs associated with the specified company, and the final result comprises the names of salespeople meeting the defined criteria.
*/
SELECT
    s.name
FROM
    SalesPerson s
WHERE
    s.sales_id NOT IN (
        SELECT
            o.sales_id
        FROM
            Orders o
            JOIN Company c ON o.com_id = c.com_id
        WHERE
            c.name = 'RED'
    );
