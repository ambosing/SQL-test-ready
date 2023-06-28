-- 코드를 입력하세요
WITH max_favorite_by_category_rest AS(
    SELECT food_type, MAX(favorites) AS favorites
    FROM rest_info
    GROUP BY food_type
)

SELECT c.food_type, rest_id, rest_name, c.favorites
FROM rest_info r
JOIN max_favorite_by_category_rest c ON c.favorites = r.favorites
AND c.food_type = r.food_type
ORDER BY 1 DESC