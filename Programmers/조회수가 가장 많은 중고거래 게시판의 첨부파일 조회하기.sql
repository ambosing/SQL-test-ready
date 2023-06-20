-- 코드를 입력하세요
SELECT CONCAT('/home/grep/src/', f.board_id, '/', f.file_id, f.file_name, f.file_ext) AS FILE_PATH
FROM used_goods_file f
WHERE board_id = (
    SELECT board_id
    FROM used_goods_board
    ORDER BY views DESC
    LIMIT 1
)
ORDER BY file_id DESC