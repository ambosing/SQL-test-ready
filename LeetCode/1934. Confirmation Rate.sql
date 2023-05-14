# Write your MySQL query statement below
# 문제: 사용자의 확인률은 '확인된' 메시지 수를 요청된 확인 메시지의 총 수로 나눈 값입니다. 확인 메시지를 요청하지 않은 사용자의 확인 비율은 0입니다. 확인 비율은 소수 둘째 자리에서 반올림하십시오.

# 1. 모두 user_id 0.0인거 만들기
with temp as (
    select distinct user_id, 0.0 as confirmation_rate
    from signups
)

select user_id, round(max(confirmation_rate), 2) as confirmation_rate
from (
select user_id, (1.0 * sum(if(action = 'confirmed', 1, 0))) / (count(*)) as confirmation_rate
from Confirmations
group by user_id
union
select user_id, confirmation_rate
from temp) a
group by user_id