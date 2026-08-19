-- Problem: Number of Transactions per Visit

/*
Solution:
To analyze the transaction behavior of bank visitors, we aim to determine how many transactions each visitor made during their visits and summarize this data to understand the distribution of transaction counts across all visits. Specifically, we want to generate a report that shows:

- The number of transactions (transactions_count) a visitor made in a single visit.
- The number of visitors (visits_count) who made that number of transactions in one visit.

This analysis helps the bank understand customer engagement and transaction patterns, which can inform service improvements and marketing strategies.

Approach Overview
1. **Generate a Sequence of Possible Transaction Counts (t CTE)**:
   - Create a list of all possible transaction counts from 0 up to the total number of transactions to ensure that even if no visits have a certain number of transactions, the count for that transaction number is still represented.
2. **Calculate Transactions per Visit (t1 CTE)**:
   - For each visit, count the number of transactions made by the visitor. Include visits with zero transactions by performing a LEFT JOIN between Visits and Transactions.
3. **Aggregate Visits by Transaction Count**:
   - Join the sequence of possible transaction counts with the actual transaction counts per visit and count how many visits correspond to each transaction count.
4. **Finalize the Results**:
   - Present the transactions_count alongside the corresponding visits_count, ensuring that all transaction counts from 0 to max(transactions_count) are included and ordered accordingly.
*/

-- SQL Query
WITH t AS (
    SELECT Row_number() OVER() row_num
    FROM   Transactions
    UNION
    SELECT 0
),
t1 AS (
    SELECT Count(transaction_date) transaction_count
    FROM Visits v
    LEFT JOIN Transactions t
        ON v.user_id = t.user_id
           AND v.visit_date = transaction_date
    GROUP  BY v.user_id,
              v.visit_date
)
SELECT row_num AS Transactions_count,
       Count(transaction_count) visits_count
FROM   t
       LEFT JOIN t1
              ON row_num = transaction_count
GROUP  BY row_num
HAVING row_num <= (SELECT Max(transaction_count)
                   FROM   t1)
ORDER  BY row_num;
