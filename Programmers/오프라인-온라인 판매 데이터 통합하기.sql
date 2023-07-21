-- 코드를 입력하세요
SELECT DATE_FORMAT(sales_date, '%Y-%m-%d') AS sales_date, product_id, user_id, sales_amount
FROM (
SELECT sales_date, product_id, user_id, sales_amount
FROM ONLINE_SALE
WHERE sales_date >= '2022-03-01'
AND sales_date < '2022-04-01'
UNION
SELECT sales_date, product_id, NULL AS user_id, sales_amount
FROM OFFLINE_SALE
WHERE sales_date >= '2022-03-01'
AND sales_date < '2022-04-01') sale
ORDER BY sales_date, product_id, user_id