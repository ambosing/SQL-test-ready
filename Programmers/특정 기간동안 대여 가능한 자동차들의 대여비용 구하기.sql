-- 코드를 입력하세요
# 1. 세단 or SUV
# 2. 2022-11-01 ~ 2022-11-30 : 
# 3. 50 ~ 200
WITH possible_car_2022_11 AS (
    SELECT car_id
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE car_id NOT IN (
    SELECT car_id
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE start_date <= '2022-11-01' AND '2022-11-01' <= end_date)
), car_plan_2022_11 AS (
    SELECT c.car_id, c.car_type, ROUND(30 * daily_fee * rate) AS fee
    FROM (SELECT car_type, (100 - CAST(LEFT(discount_rate, length(discount_rate)) AS DECIMAL)) / 100 AS rate
          FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
          WHERE duration_type = '30일 이상') p
    INNER JOIN CAR_RENTAL_COMPANY_CAR c ON c.car_type = p.car_type
    WHERE c.car_type IN ('세단', 'SUV')
)

SELECT DISTINCT c.car_id, c.car_type, fee
FROM car_plan_2022_11 c
INNER JOIN possible_car_2022_11 p ON c.car_id = p.car_id
WHERE fee >= 500000 AND fee < 2000000
ORDER BY 3 DESC, 2 ASC, 1 DESC


