-- 코드를 입력하세요
SELECT name, datetime
FROM animal_ins
WHERE animal_id NOT IN (
    SELECT animal_id
    FROM animal_outs
)
ORDER BY datetime
LIMIT 3