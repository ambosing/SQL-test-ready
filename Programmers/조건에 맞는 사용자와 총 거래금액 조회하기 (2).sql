-- 코드를 입력하세요
SELECT user_id, nickname, SUM(price) AS total_sales
FROM used_goods_board b
JOIN used_goods_user u ON b.writer_id = u.user_id
WHERE b.status = 'DONE'
GROUP BY u.user_id
HAVING SUM(b.price) >= 700000
ORDER BY 3