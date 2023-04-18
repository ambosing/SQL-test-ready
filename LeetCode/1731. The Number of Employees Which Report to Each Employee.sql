# Write your MySQL query statement below
# 문제 :이 문제의 경우 관리자는 적어도 1명의 다른 직원이 보고하는 직원으로 간주합니다.
# 모든 관리자의 ID와 이름, 그들에게 직접 보고하는 직원 수, 가장 가까운 정수로 반올림한 보고서의 평균 연령을 보고하는 SQL 쿼리를 작성합니다.
# employee_id로 정렬된 결과 테이블을 반환합니다.

# 1. self-join on employee_id = reports_to
# 2. group by reports_to
# 3. avg age

select employee_id, name, reports_count, average_age
from Employees e1
join (select reports_to, count(distinct employee_id) as reports_count, round(avg(age)) as average_age
    from Employees
    group by reports_to) e2 on e1.employee_id = e2.reports_to
order by employee_id