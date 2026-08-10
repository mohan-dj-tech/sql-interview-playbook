# Problem: Winning Candidate

## Problem Statement

Table: `Candidate`
```
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| name        | varchar  |
+-------------+----------+
```
`id` is the primary key for this table.

Table: `Vote`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| candidateId | int  |
+-------------+------+
```
`id` is an auto-increment primary key. `candidateId` is a foreign key to the `Candidate` table.

Write a solution to report the name of the winning candidate (i.e., the candidate who received the largest number of votes). The test cases are generated so that exactly one candidate wins the election.

---

## Example

**Input:**

`Candidate` table:
```
+----+------+
| id | name |
+----+------+
| 1  | A    |
| 2  | B    |
| 3  | C    |
| 4  | D    |
| 5  | E    |
+----+------+
```

`Vote` table:
```
+----+-------------+
| id | candidateId |
+----+-------------+
| 1  | 2           |
| 2  | 4           |
| 3  | 3           |
| 4  | 2           |
| 5  | 5           |
+----+-------------+
```

**Expected Output:**
```
+------+
| name |
+------+
| B    |
+------+
```

**Explanation:**
- Candidate B received 2 votes.
- Candidates C, D, and E each received 1 vote.
- Candidate A received 0 votes.
Candidate B is the winner with the most votes.
