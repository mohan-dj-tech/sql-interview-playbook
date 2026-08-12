-- Problem: Second Degree Follower
/* Solution:
 To identify second-degree followers—users who both follow at least one other user and are followed by at least one user—we can leverage SQL's self-join capabilities. The approach involves isolating users who meet both criteria and then counting their followers.

 1.  **Identify Users Who Follow Others**: Determine users who are followers in the Follow table.
 2.  **Identify Users Who Are Followed**: Determine users who are followees in the Follow table.
 3.  **Determine Second-Degree Followers**: Find the intersection of users who follow others and are followed by others.
 4.  **Count Followers for Each Second-Degree Follower**: For each second-degree follower, count the number of users who follow them.
 5.  **Order the Results**: Present the final list ordered alphabetically by the follower's name.
*/
SELECT f1.follower AS follower,
       COUNT(DISTINCT f2.follower) AS num
FROM   Follow f1
       INNER JOIN Follow f2
               ON f1.follower = f2.followee
GROUP  BY f1.follower
ORDER BY f1.follower ASC;
