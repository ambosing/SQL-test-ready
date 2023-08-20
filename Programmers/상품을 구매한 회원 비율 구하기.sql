-- 코드를 입력하세요
WITH user_cnt AS (
    SELECT count(distinct user_id) AS user_count
    FROM user_info
    WHERE YEAR(joined) = '2021'
), user_2021 AS (
    SELECT *
    FROM user_info
    WHERE YEAR(joined) = '2021'
)

SELECT YEAR(o.sales_date) AS YEAR, MONTH(o.sales_date) AS MONTH, 
        COUNT(distinct o.user_id) AS PUCHASED_USERS, 
        ROUND(COUNT(distinct o.user_id) / (SELECT user_count FROM user_cnt), 1) AS PUCHASED_RATIO
FROM user_2021 u
JOIN online_sale o ON u.user_id = o.user_id
GROUP BY 1, 2
ORDER BY 1, 2
