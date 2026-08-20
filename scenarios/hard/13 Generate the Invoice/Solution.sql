-- Problem: Generate the Invoice

/*
Solution:
To identify the invoice with the highest total price, and in the event of a tie, select the one with the smallest invoice_id, we can follow a systematic approach using SQL's aggregation and window functions. The solution involves calculating the total price for each invoice, determining the highest total price, handling ties by selecting the smallest invoice_id, and finally retrieving the detailed information of the selected invoice.

Approach Overview
1. **Join Purchases with Products to Calculate Subtotal per Product**:
   - Combine the Purchases and Products tables to access the price of each product.
   - Calculate the subtotal for each product in an invoice by multiplying price by quantity.
2. **Aggregate Subtotals to Determine Total Price per Invoice**:
   - Sum the subtotals for each invoice_id to obtain the total price of each invoice.
3. **Identify the Invoice with the Highest Total Price**:
   - Determine the maximum total price across all invoices.
   - In cases where multiple invoices share this maximum total price, select the one with the smallest invoice_id.
4. **Retrieve Detailed Information of the Selected Invoice**:
   - Fetch the product_id, quantity, and subtotal (price) for each product within the selected invoice.
*/

-- SQL Query
WITH details_by_invoices AS
(
    SELECT
        pu.invoice_id,
        pu.product_id,
        pu.quantity,
        pu.quantity * pr.price AS price
    FROM
        Purchases AS pu
    INNER JOIN
        Products AS pr
    ON
        pu.product_id = pr.product_id
),
invoice_with_max_total AS
(
    SELECT
        invoice_id
    FROM
        details_by_invoices
    GROUP BY
        invoice_id
    ORDER BY
        SUM(price) DESC,
        invoice_id ASC
    LIMIT 1
)
SELECT
    product_id,
    quantity,
    price
FROM
    details_by_invoices
WHERE
    invoice_id IN
    (
        SELECT invoice_id
        FROM invoice_with_max_total
    );
