-- 코드를 입력하세요

SELECT CONCAT('/home/grep/src/', board_id, '/', file_id, file_name, file_ext) AS file_path
FROM used_goods_file
WHERE board_id = (
    SELECT board_id
    FROM used_goods_board
    GROUP BY board_id
    ORDER BY MAX(views) DESC
    LIMIT 1
)
ORDER BY file_id DESC