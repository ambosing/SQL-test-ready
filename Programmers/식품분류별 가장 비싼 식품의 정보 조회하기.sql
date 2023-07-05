-- 코드를 입력하세요
WITH filtered_food AS(
    SELECT *
    FROM food_product
    WHERE category IN ('과자', '국', '김치', '식용유')
)

SELECT category, price AS MAX_PRICE, product_name
FROM filtered_food
WHERE (category, price) IN (SELECT category, MAX(price)
                           FROM filtered_food
                           GROUP BY category)
ORDER BY 2 DESC