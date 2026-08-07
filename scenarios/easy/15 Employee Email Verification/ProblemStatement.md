# Problem: Employee Email Verification

## Problem Statement

Table: `Employees`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| employee_id   | int     |
| name          | varchar |
| email         | varchar |
+---------------+---------+
```
`employee_id` is the primary key for this table.

Write a solution to identify employees with **valid emails**. A valid email must adhere to the following rules:
1.  The **username** must start with a letter (`a-z` or `A-Z`).
2.  The rest of the username can contain letters, digits, underscores (`_`), periods (`.`), and hyphens (`-`).
3.  The **domain** must be `'@corpexample.com'`.

Return the result table in any order.

---

## Example

**Input:**

`Employees` table:
```
+-------------+---------+--------------------------+
| employee_id | name    | email                    |
+-------------+---------+--------------------------+
| 101         | Alice   | alice@corpexample.com    |
| 102         | Bob     | bob123@corpexample.com   |
| 103         | Charlie | charlie@corpexample.net  |
| 104         | Dave    | dave-@corpexample.com    |
| 105         | Eve     | eve#corp@corpexample.com |
| 106         | Frank   | .frank@corpexample.com   |
+-------------+---------+--------------------------+
```

**Expected Output:**
```
+-------------+-------+------------------------+
| employee_id | name  | email                  |
+-------------+-------+------------------------+
| 101         | Alice | alice@corpexample.com  |
| 102         | Bob   | bob123@corpexample.com |
| 104         | Dave  | dave-@corpexample.com  |
+-------------+-------+------------------------+
```

**Explanation:**
- Alice, Bob, and Dave have valid emails that meet all the specified criteria.
- Charlie's email is invalid because the domain is not `'@corpexample.com'`.
- Eve's email is invalid because the username contains an invalid character (`#`).
- Frank's email is invalid because the username starts with a period (`.`).
The query filters the `Employees` table to return only the rows with valid emails.
