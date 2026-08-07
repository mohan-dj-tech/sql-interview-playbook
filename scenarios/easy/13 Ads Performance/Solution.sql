-- Problem: Ads Performance
/* Solution:
 To calculate the Click-Through Rate (CTR) for each ad, this query groups the `Ads`
 table by `ad_id`. It uses conditional aggregation (`CASE` within `SUM`) to count
 the number of 'Clicked' and 'Viewed' actions. The CTR is then calculated by
 dividing the total clicks by the sum of clicks and views. `IFNULL` is used to
 handle cases where there are no clicks or views, defaulting the CTR to 0. The
 final result is rounded to two decimal places and ordered as specified.
*/
SELECT
    ad_id,
    IFNULL(
        ROUND(
            SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) * 100.0 / NULLIF(
                SUM(
                    CASE
                        WHEN action = 'Clicked'
                        OR action = 'Viewed' THEN 1
                        ELSE 0
                    END
                ),
                0
            ),
            2
        ),
        0
    ) AS ctr
FROM
    Ads
GROUP BY
    ad_id
ORDER BY
    ctr DESC,
    ad_id ASC;
