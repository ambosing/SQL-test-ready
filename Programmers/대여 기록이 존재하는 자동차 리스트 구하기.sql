-- 코드를 입력하세요
WITH SEDAN_CAR AS(
    SELECT *
    FROM car_rental_company_car
    WHERE car_type = '세단'
)

SELECT DISTINCT s.car_id
FROM sedan_car s
JOIN car_rental_company_rental_history h ON s.car_id = h.car_id
WHERE h.start_date LIKE '2022-10%'
ORDER BY 1 DESC