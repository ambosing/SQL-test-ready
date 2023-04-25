# Write your MySQL query statement below
# 문제 : 2019-08-16의 모든 제품 가격을 찾는 SQL 쿼리를 작성하세요. 변경 전 모든 제품의 가격이 10이라고 가정합니다.

# 2019-08-16에 new price가 없다면 이전 가격을 가져오면 됨
# how ? change_date <= 2019-08-16 and 
# 변경 전 모든 제품의 가격이 10인 경우는 대체 어떻게 해야할까 ? 

with temp as (
    select product_id, 10 as price
    from Products
    group by product_id
), temp2 as (
select product_id, new_price as price
from Products
where (product_id, change_date) in (
    select product_id, max(change_date)
    from Products
    where change_date < '2019-08-17'
    group by product_id
))

select t.product_id, ifnull(p.price, t.price) as price
from temp t
left join temp2 p on t.product_id = p.product_id