-- 코드를 입력하세요
SELECT u.user_id, 
        u.nickname, 
        CONCAT(u.city, ' ', u.street_address1, ' ', u.street_address2) AS '전체주소', 
        CONCAT(SUBSTRING(tlno, 1, 3), '-', SUBSTRING(tlno, 4, 4), '-', SUBSTRING(tlno, 8, 4))AS '전화번호'
FROM used_goods_board b
JOIN used_goods_user u ON u.user_id = b.writer_id
GROUP BY u.user_id
HAVING COUNT(u.user_id) >= 3
ORDER BY u.user_id DESC
