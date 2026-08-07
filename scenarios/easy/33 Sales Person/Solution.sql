-- Problem: Sales Person
/* Solution:
 To find the names of salespersons who had no orders with the company "RED", this
 query uses a subquery to first identify all `sales_id`s that *are* associated with
 "RED". The subquery joins the `Orders` and `Company` tables and filters for
 `c.name = 'RED'`. The main query then selects the names from the `SalesPerson`
 table where the `sales_id` is `NOT IN` the set of IDs returned by the subquery.
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
