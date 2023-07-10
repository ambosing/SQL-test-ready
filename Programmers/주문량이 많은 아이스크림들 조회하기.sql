-- 코드를 입력하세요
WITH july_3 AS(
    SELECT flavor, SUM(total_order) as total_order
    FROM july
    GROUP BY flavor
    ORDER BY total_order DESC
)

SELECT j.flavor
FROM july_3 j
JOIN first_half f ON f.flavor = j.flavor
ORDER BY j.total_order + f.total_order DESC
LIMIT 3