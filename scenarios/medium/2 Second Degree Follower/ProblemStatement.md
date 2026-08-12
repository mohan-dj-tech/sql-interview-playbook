# Problem: Second Degree Follower

## Problem Statement

Table: `Follow`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| followee    | varchar |
| follower    | varchar |
+-------------+---------+
```
`(followee, follower)` is the primary key for this table. Each row indicates that `follower` follows `followee`.

A **second-degree follower** is a user who:
1.  Follows at least one user.
2.  Is followed by at least one user.

Write a solution to report the second-degree users and the number of people they follow. Return the result table ordered by `follower` in alphabetical order.

---

## Example

**Input:**

`Follow` table:
```
+----------+----------+
| followee | follower |
+----------+----------+
| Alice    | Bob      |
| Bob      | Cena     |
| Bob      | Donald   |
| Donald   | Edward   |
+----------+----------+
```

**Expected Output:**
```
+----------+-----+
| follower | num |
+----------+-----+
| Bob      | 2   |
| Donald   | 1   |
+----------+-----+
```

**Explanation:**
- **Bob**: Follows Alice and is followed by Cena and Donald. Bob is a second-degree follower. Bob follows 2 people (Cena and Donald are his followers, but he follows Alice). The question asks for the number of people *they follow*, which seems to be misinterpreted in the original example. Let's assume the output `num` means the number of followers they *have*. Bob has 2 followers (Cena and Donald).
- **Donald**: Follows Bob and is followed by Edward. Donald is a second-degree follower. Donald has 1 follower (Edward).
- **Alice**: Is followed by Bob, but does not follow anyone. Not a second-degree follower.
- **Cena**: Follows Bob, but is not followed by anyone. Not a second-degree follower.
- **Edward**: Follows Donald, but is not followed by anyone. Not a second-degree follower.

*Correction on Logic:* The problem asks for the number of *their followers*. The provided example output for `num` aligns with counting the followers of the `followee`, not the number of people the `follower` follows. The solution will follow the logic that produces the example output.
