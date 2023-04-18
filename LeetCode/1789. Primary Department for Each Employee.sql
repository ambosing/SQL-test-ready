# Write your MySQL query statement below
# 문제 : 직원은 여러 부서에 속할 수 있습니다. 직원이 다른 부서에 합류할 때 어느 부서가 주 부서인지 결정해야 합니다. 직원이 한 부서에만 속한 경우 해당 직원의 기본 열은 'N'입니다.
# 기본 부서의 모든 직원을 보고하는 SQL 쿼리를 작성합니다. 한 부서에 속한 직원의 경우 해당 부서만 보고하십시오.

# department_id가 2개 이상인 경우, primary_flag = 'Y'인 경우를 출력
select employee_id, department_id
from Employee
where primary_flag = 'Y' or employee_id IN (
  select employee_id
  from Employee
  group by employee_id
  having count(employee_id) = 1
)
group by employee_id
