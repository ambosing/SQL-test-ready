# Write your MySQL query statement below
# 문제 : 버스를 타기 위해 기다리는 사람들이 줄을 서 있습니다. 단, 버스는 1000kg의 무게 제한이 있어 탑승하지 못하시는 분들이 계실 수 있습니다. 무게 제한을 초과하지 않고 버스에 탑승할 수 있는 마지막 사람의 person_name을 찾는 SQL 쿼리를 작성하십시오. 첫 번째 사람이 무게 제한을 초과하지 않도록 테스트 케이스가 생성됩니다.

# 

with total as (
    select turn, person_name, weight, sum(weight) over (order by turn) as total_weight
    from Queue 
)

select person_name
from total
where total_weight <= 1000
order by total_weight desc
limit 1;