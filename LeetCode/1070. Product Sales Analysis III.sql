# Write your MySQL query statement below
# 문제 : 첫 해의 모든 제품들의 팔린 금액과 수량과 연도, product id를 보여줘라

# product_id, year을 group by product_id, min(year)을 구해라

select product_id, year as first_year, quantity as quantity, price as price
from Sales
where (product_id, year) IN ( 
select product_id, min(year)
from Sales
group by product_id)
