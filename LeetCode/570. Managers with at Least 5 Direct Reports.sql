# Write your MySQL query statement below
# 문제 : 적어도 다섯 개의 직접 보고서를 보고한 매니저들을 쿼리하라

# managerId > 5의 managerId = id

select name
from (select managerId
    from Employee
    group by managerId
    having count(*) >= 5) m 
join Employee e on m.managerId = e.id
 
