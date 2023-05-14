# Write your MySQL query statement below
# 문제 : 고객이 7일 창(즉, 현재 날짜 + 6일 전)에 지불한 금액의 이동 평균을 계산하는 SQL 쿼리를 작성합니다. average_amount는 소수점 둘째 자리까지 반올림해야 합니다.

# sum over
with temp1 as (
    select visited_on, sum(amount) as amount
    from Customer
    group by 1
), temp2 as (
select visited_on, 
    sum(amount) over (order by visited_on rows between 6 preceding and current row) as amount, 
    round(avg(amount) over (order by visited_on rows between 6 preceding and current row), 2) as average_amount,
    row_number() over (order by visited_on) row_num
from temp1
group by visited_on)
select visited_on, amount, average_amount
from temp2
where row_num >= 7