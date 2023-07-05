-- 코드를 입력하세요
WITH food_after_2022_05 AS(
    SELECT product_id, SUM(amount) AS amount
    FROM food_order
    WHERE produce_date LIKE '2022-05%'
    GROUP BY product_id
)

SELECT f.product_id, f.product_name, (a.amount * f.price) AS total_sales
FROM food_product f
JOIN food_after_2022_05 a ON f.product_id = a.product_id
ORDER BY 3 DESC, 1 ASC