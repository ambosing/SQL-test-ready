# Write your MySQL query statement below
# 문제 : 2020년 2월에 100개 이상 주문한 제품의 이름과 수량을 가져오는 SQL 쿼리를 작성하세요.
# 1. Orders에서 2020-02 조건에 맞는 group by를 하여 sum > 100 넘는 쿼리 작성 
# 2. Products와 위 1번의 쿼리 조인하여 보여주면 됌

with Feb_Orders as 
(
    select product_id, sum(unit) as unit
    from orders
    where order_date >= '2020-02-01' and order_date < '2020-03-01'
    group by product_id
    having sum(unit) >= 100
)


select product_name, unit
from Products p
join Feb_Orders o on p.product_id = o.product_id