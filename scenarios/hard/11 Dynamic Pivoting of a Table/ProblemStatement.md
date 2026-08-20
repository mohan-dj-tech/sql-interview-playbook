# Problem: Dynamic Pivoting of a Table

## Table: Products

| Column Name | Type    |
|-------------|---------|
| product_id  | int     |
| store       | varchar |
| price       | int     |

`(product_id, store)` is the primary key for this table.
Each row of this table indicates the price of `product_id` in `store`.
There will be at most 30 different stores in the table.
`price` is the price of the product at this store.

## Task

Implement the procedure `PivotProducts` to reorganize the `Products` table so that each row has the id of one product and its price in each store. The price should be `null` if the product is not sold in a store. The columns of the table should contain each store and they should be sorted in lexicographical order.

The procedure should return the table after reorganizing it.

Return the result table in any order.

## Example

**Final Pivoted Output:**

Executing the stored procedure `PivotProducts()` will produce a result set similar to the following, depending on the data in the `Products` table:

| product_id | LC_Store  | Nozama| Shop  | Souq  |
|------------|-----------|-------|-------|-------|
| 1          | 100       | NULL  | 110   | NULL  |
| 2          | NULL      | 200   | NULL  | 190   |
| 3          | NULL      | NULL  | 1000  | 1900  |
