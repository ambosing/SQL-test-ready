-- 코드를 입력하세요
SELECT h.history_id,
CASE
WHEN DATEDIFF(end_date, start_date) + 1 < 7 THEN daily_fee * (DATEDIFF(end_date, start_date) + 1)
WHEN DATEDIFF(end_date, start_date) + 1 < 30 THEN 
round((1 - SUBSTRING_INDEX(discount, ',', 1) / 100) * daily_fee * (DATEDIFF(end_date, start_date) + 1))
WHEN DATEDIFF(end_date, start_date) + 1 < 90 THEN 
round((1 - SUBSTRING_INDEX(SUBSTRING_INDEX(discount, ',', 2), ',', -1) / 100) * daily_fee * (DATEDIFF(end_date, start_date) + 1))
ELSE round((1 - SUBSTRING_INDEX(discount, ',', -1) / 100) * daily_fee * (DATEDIFF(end_date, start_date) + 1))
END AS FEE
FROM (SELECT car_id, car_type, daily_fee
      FROM car_rental_company_car 
      WHERE car_type = '트럭') c
    JOIN car_rental_company_rental_history h ON c.car_id = h.car_id
    JOIN (SELECT car_type, GROUP_CONCAT(discount_rate) as discount
         FROM car_rental_company_discount_plan
         WHERE car_type = '트럭'
         GROUP BY car_type) p ON c.car_type = p.car_type
ORDER BY 2 DESC, 1 DESC