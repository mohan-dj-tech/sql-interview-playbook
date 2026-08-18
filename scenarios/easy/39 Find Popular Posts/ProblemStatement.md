# Problem: Find Popular Posts

## Table: Posts

Each row in this table represents a post made by a user in a social media platform. It contains the unique post ID, the user who posted it, and the number of likes received by that post.

| Column Name | Type |
|-------------|------|
| post_id     | int  |
| user_id     | int  |
| post_likes  | int  |

`(post_id, user_id)` is a unique primary key in the above table.
`post_id` is the primary key for this table.
`user_id` refers to the ID of the user who has liked the post.

## Task

Develop a solution to find the number of likes for each post.

Return the result table ordered by `post_id` in ascending order.

## Example

**Input:**

`Posts` table:
| post_id | user_id |
|---------|---------|
| 1       | 2       |
| 2       | 1       |
| 1       | 3       |
| 3       | 1       |
| 1       | 4       |
| 4       | 2       |
| 2       | 2       |
| 4       | 3       |

**Output:**

| post_id | post_likes  |
|---------|-------------|
| 1       | 3           |
| 2       | 2           |
| 3       | 1           |
| 4       | 2           |
