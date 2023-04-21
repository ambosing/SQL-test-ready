# Write your MySQL query statement below
# 문제 : Product 테이블의 모든 product들을 산 고객의 id들을 출력하라

# distinct count로 할 수 있지 않을까?
select customer_id
from Customer
group by customer_id
having count(distinct product_key) = (select count(distinct product_key)
                                        from Product) 