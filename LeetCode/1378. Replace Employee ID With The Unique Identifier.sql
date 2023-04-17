# Write your MySQL query statement below
# 문제 : 각 사용자의 고유 ID를 표시하는 SQL 쿼리를 작성하십시오. 사용자에게 고유 ID가 없으면 null만 표시하십시오.
# 1. employees left join employeeUNI

select unique_id, name
from Employees e
left join EmployeeUNI u on e.id = u.id