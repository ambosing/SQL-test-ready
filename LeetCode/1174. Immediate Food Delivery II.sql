# Write your MySQL query statement below
# 문제 : 고객이 원하는 배송 날짜가 주문 날짜와 같으면 즉시 주문이라고 합니다. 그렇지 않으면 예약이라고 합니다. 고객의 첫 번째 주문은 고객이 주문한 날짜가 가장 빠른 주문입니다. 고객이 정확히 하나의 첫 번째 주문을 가지고 있음을 보장합니다. SQL 쿼리를 작성하여 모든 고객의 첫 번째 주문에서 즉시 주문 비율을 소수점 둘째 자리로 반올림하여 찾습니다.

with immediate as (
    select sum(if(order_date = customer_pref_delivery_date, 1, 0)) as cnt
    from Delivery
    where (customer_id, order_date) in (
        select customer_id, min(order_date)
        from Delivery
        group by customer_id
    )
), all_count as (
    select count(distinct customer_id) as all_cnt
    from Delivery
)

select round((select cnt from immediate) * 100 / (select all_cnt from all_count), 2) as immediate_percentage
from dual