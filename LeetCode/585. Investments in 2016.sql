# Write your MySQL query statement below
# 문제 : 다음과 같은 모든 보험 계약자에 대해 2016 tiv_2016의 총 투자 가치 합계를 보고하는 SQL 쿼리를 작성하십시오.
# 한 명 이상의 다른 보험 계약자와 동일한 tiv_2015 값을 가지며,
# 다른 보험 계약자와 같은 도시에 있지 않습니다(즉, (lat, lon) 속성 쌍은 고유해야 합니다).
# tiv_2016을 소수 둘째 자리로 반올림합니다.

select round(sum(tiv_2016), 2) as tiv_2016
from Insurance
where pid in (select pid
                    from Insurance
                    group by lat, lon
                    having count(*) < 2)
and tiv_2015 in (select tiv_2015 
            from Insurance
            group by tiv_2015
            having count(*) >= 2)