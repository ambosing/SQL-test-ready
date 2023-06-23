-- 코드를 입력하세요
WITH intake_animal_ins AS (
    SELECT *
    FROM animal_ins
    WHERE sex_upon_intake LIKE 'Intact%'
), intake_animal_outs AS (
    SELECT *
    FROM animal_outs
    WHERE sex_upon_outcome LIKE 'Neutered%'
    OR sex_upon_outcome LIKE 'Spayed%'
)

SELECT i.animal_id, i.animal_type, i.name
FROM intake_animal_ins i
JOIN intake_animal_outs o ON i.animal_id = o.animal_id
ORDER BY i.animal_id, i.animal_type, i.name