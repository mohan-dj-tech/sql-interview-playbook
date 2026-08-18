# Problem: Main Office Assignment for Each Employee

## Table: OfficeAssignment

This table records the office assignments of employees. Each record includes an employee ID, office ID, and a main office flag indicating whether the office is the employee's main office.

| Column Name   | Type     |
|---------------|----------|
| employee_id   | int      |
| office_id     | int      |
| main_flag     | varchar  |

`(employee_id, office_id)` is the primary key for this table.
`employee_id` is the ID of the employee.
`office_id` is the ID of the office assigned to the employee.
`main_flag` is an ENUM type of ('Y', 'N'). If the flag is 'Y', the office is the employee's main office. If the flag is 'N', the office is not the main one.

Employees can be assigned to multiple offices, but they can designate only one office as their main office. If an employee is assigned to only one office, that office is automatically considered their main office, regardless of the `main_flag`.

## Task

Develop a solution to report all employees along with their main office. For employees assigned to only one office, report that office as their main office.

Return the result table in the order of `employee_id`.

## Example

**Input:**

`OfficeAssignment` table:
| employee_id | office_id | main_flag|
|-------------|-----------|----------|
| 1           | 101       | N        |
| 2           | 101       | Y        |
| 2           | 102       | N        |
| 3           | 103       | N        |
| 4           | 102       | N        |
| 4           | 103       | Y        |
| 4           | 104       | N        |

**Output:**

| employee_id | office_id |
|-------------|-----------|
| 1           | 101       |
| 2           | 101       |
| 3           | 103       |
| 4           | 103       |
