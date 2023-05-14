# Write your MySQL query statement below
# "Low Salary": All the salaries strictly less than $20000.
# "Average Salary": All the salaries in the inclusive range [$20000, $50000]. 
# "High Salary": All the salaries strictly greater than $50000.
# 문제 : 결과 테이블에는 세 가지 범주가 모두 포함되어야 합니다. 범주에 계정이 없으면 0을 보고합니다.
with temp as (
    select sum(case when income < 20000 then 1 else 0 end) as `Low Salary`,
    sum(case when income >= 20000 and income <= 50000 then 1 else 0 end) as `Average Salary`,
    sum(case when income > 50000 then 1 else 0 end) as `High Salary`
    from Accounts 
)
select 'Low Salary' as category, `Low Salary` as accounts_count
from temp
union
select 'Average Salary' as category, `Average Salary` as accounts_count
from temp
union
select 'High Salary' as category, `High Salary` as accounts_count
from temp