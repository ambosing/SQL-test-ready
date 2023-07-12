-- 코드를 입력하세요
# 최다 리뷰 수가 하나라고 가정한 경우 
SELECT m.member_name, r.review_text, DATE_FORMAT(r.review_date, '%Y-%m-%d') AS review_date
FROM member_profile m
JOIN rest_review r ON m.member_id = r.member_id
WHERE m.member_id = (
    SELECT member_id
    FROM rest_review
    GROUP BY member_id
    ORDER BY count(member_id) DESC
    LIMIT 1 
)
ORDER BY 3, 2

# DENSE_RANK 최다 리뷰 수가 같은 경우
SELECT m.member_name, r.review_text, DATE_FORMAT(r.review_date, '%Y-%m-%d') AS review_date
FROM member_profile m
JOIN rest_review r ON m.member_id = r.member_id
WHERE m.member_id IN (
SELECT member_id
FROM (SELECT member_id, DENSE_RANK() OVER (ORDER BY cnt DESC) AS ranks
FROM (SELECT member_id, count(member_id) AS cnt
     FROM rest_review
     GROUP BY member_id) a) b
WHERE ranks = 1)
ORDER BY 3, 2