WITH RECURSIVE hours AS (
    SELECT 0 AS hour
    UNION ALL
    SELECT hour + 1 FROM hours
    WHERE hour < 23
)

SELECT h.hour, IFNULL(cnt, 0) AS count
FROM hours h
LEFT JOIN (
SELECT HOUR(datetime) AS hour, count(HOUR(datetime)) AS cnt
FROM animal_outs
GROUP BY 1) i ON h.hour = i.hour