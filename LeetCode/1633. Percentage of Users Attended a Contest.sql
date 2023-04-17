# Write your MySQL query statement below
# 문제 : 소수점 이하 두 자리로 반올림된 각 대회에 등록된 사용자의 비율을 찾는 SQL 쿼리를 작성하세요. 내림차순으로 백분율로 정렬된 결과 테이블을 반환합니다. 동점일 경우, 콘테스트_id를 오름차순으로 정렬합니다. 쿼리 결과 형식은 다음 예와 같습니다.

with count_users as (
  select count(*) as cnt
  from Users
)


select contest_id, round((count(*) / cnt) * 100, 2) as percentage
from Register r, count_users
group by contest_id
order by percentage desc, contest_id