-- 코드를 입력하세요
WITH REST_SEOUL AS (
    SELECT *
    FROM rest_info
    WHERE address LIKE '서울%'
), AVG_REST_REVIEW AS (
    SELECT rest_id, ROUND(AVG(review_score), 2) AS SCORE
    FROM rest_review
    GROUP BY 1
)

SELECT s.rest_id, s.rest_name, s.food_type, s.favorites, s.address, a.score
FROM rest_seoul s
JOIN avg_rest_review a ON s.rest_id = a.rest_id
ORDER BY a.score DESC, s.favorites DESC