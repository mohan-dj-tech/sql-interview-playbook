-- Problem: Winning Candidate
/* Solution:
 To find the winning candidate, this query first joins the `Candidate` and `Vote`
 tables on the candidate's `id`. It then groups the results by candidate `name` to
 count the votes for each one. The results are ordered in descending order based on
 the vote count, and `LIMIT 1` is used to select only the top candidate. A `LEFT JOIN`
 is used to be thorough, though an `INNER JOIN` would also work since every vote must
 have a valid candidate.
*/
SELECT DISTINCT c.name FROM Candidate c
LEFT JOIN Vote v ON c.id = v.candidateId
GROUP BY c.name
ORDER BY count(v.id) DESC
LIMIT 1;
