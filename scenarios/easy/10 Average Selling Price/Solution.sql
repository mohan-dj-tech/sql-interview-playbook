-- Problem: Average Selling Price
/* Solution:
 To calculate the average selling price, this query joins the `Prices` and `UnitsSold`
 tables. The join condition matches each sale in `UnitsSold` to its corresponding price
 from the `Prices` table based on the `purchase_date` falling within the `start_date`
 and `end_date`. The query then groups by `product_id` and calculates the average
 price by dividing the total revenue (`SUM(units * price)`) by the total units sold
 (`SUM(units)`). The result is rounded to two decimal places, and `IFNULL` handles
 cases where a product has no sales.
*/
SELECT
    p.product_id,
    IFNULL(
        ROUND(
            SUM(units * price) / SUM(units),
            2
        ),
        0
    ) AS average_price
FROM
    Prices p
    LEFT JOIN UnitsSold u ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN start_date AND end_date
GROUP BY
    product_id;
