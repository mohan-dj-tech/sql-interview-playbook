-- Problem: Order Fulfillment Rate
/* Solution:
 To calculate the fulfillment rate for each customer, this query uses two Common Table Expressions (CTEs) to first calculate the rate for each order, and then average that rate for each customer.

 1.  **`OrderFulfillment` CTE**:
     - This CTE calculates the fulfillment rate for each individual order.
     - It performs a `LEFT JOIN` from `Orders` to `Deliveries` to include orders that may not have any delivery attempts.
     - `IFNULL(SUM(...) / COUNT(...), 0)` calculates the rate. `SUM(CASE WHEN d.status = 'delivered' THEN 1 ELSE 0 END)` counts successful deliveries, and `COUNT(d.order_id)` counts total attempts. `IFNULL` handles the case of an order with no deliveries, preventing division by zero and assigning a rate of 0.

 2.  **`CustomerFulfillment` CTE**:
     - This CTE takes the results from the first CTE and groups by `customer_id`.
     - `AVG(fulfillment_rate)` calculates the average of the individual order fulfillment rates for each customer.
     - `ROUND()` is used to format the final rate to two decimal places.

 3.  **Final `SELECT`**:
     - The final query simply selects the results from the `CustomerFulfillment` CTE.
*/
WITH OrderFulfillment AS (
    -- Calculate the fulfillment rate for each order
    SELECT
        o.order_id,
        o.customer_id,
        IFNULL(SUM(CASE WHEN d.status = 'delivered' THEN 1 ELSE 0 END) / COUNT(d.order_id), 0) AS fulfillment_rate
    FROM
        Orders o
    LEFT JOIN
        Deliveries d
    ON
        o.order_id = d.order_id
    GROUP BY
        o.order_id, o.customer_id
),
CustomerFulfillment AS (
    -- Aggregate the fulfillment rate for each customer
    SELECT
        customer_id,
        ROUND(AVG(fulfillment_rate), 2) AS fulfillment_rate
    FROM
        OrderFulfillment
    GROUP BY
        customer_id
)
-- Final output
SELECT
    customer_id,
    fulfillment_rate
FROM
    CustomerFulfillment;
