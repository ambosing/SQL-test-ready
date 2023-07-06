-- 코드를 입력하세요
WITH USER_INFO_GENDER_NOT_NULL AS(
    SELECT *
    FROM user_info
    WHERE gender IS NOT NULL
)

SELECT YEAR(sales_date) AS year, MONTH(sales_date) AS month, gender, COUNT(DISTINCT u.user_id) AS users
FROM user_info_gender_not_null u
JOIN online_sale s ON u.user_id = s.user_id
GROUP BY 1, 2, 3 
ORDER BY 1, 2, 3