# Problem: Viewers Turned Streamers

## Table: Sessions

| Column Name   | Type     |
|---------------|----------|
| user_id       | int      |
| session_start | datetime |
| session_end   | datetime |
| session_id    | int      |
| session_type  | enum     |

`session_id` is the primary key for this table.
`session_type` is an ENUM type of ('Viewer', 'Streamer').
This table contains user id, session start, session end, session id and session type.

## Task

Write a solution to find the number of streaming sessions for users whose first session was as a viewer.

Return the result table ordered by count of streaming sessions, `user_id` in descending order.

## Example

**Input:**

`Sessions` table:
| user_id | session_start       | session_end         | session_id | session_type |
|---------|---------------------|---------------------|------------|--------------|
| 101     | 2023-11-06 13:53:42 | 2023-11-06 14:05:42 | 375        | Viewer       |
| 101     | 2023-11-22 16:45:21 | 2023-11-22 20:39:21 | 594        | Streamer     |
| 102     | 2023-11-16 13:23:09 | 2023-11-16 16:10:09 | 777        | Streamer     |
| 102     | 2023-11-17 13:23:09 | 2023-11-17 16:10:00 | 778        | Streamer     |
| 101     | 2023-11-20 07:16:06 | 2023-11-20 08:33:06 | 315        | Streamer     |
| 104     | 2023-11-27 03:10:49 | 2023-11-27 03:30:49 | 797        | Viewer       |
| 103     | 2023-11-27 03:10:49 | 2023-11-27 03:30:49 | 798        | Streamer     |

**Output:**

| user_id | sessions_count |
|---------|----------------|
| 101     | 2              |
