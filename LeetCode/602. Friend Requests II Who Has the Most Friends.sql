# Write your MySQL query statement below
# 문제 : 가장 친구가 많은 사람들 보여라.

with a as
(select requester_id as id from requestaccepted
union all
select accepter_id as id from requestaccepted)

select id, count(id) as num
from a
group by id
order by 2 desc
limit 1