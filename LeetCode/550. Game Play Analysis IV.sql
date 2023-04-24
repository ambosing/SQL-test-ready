# Write your MySQL query statement below
# 문제 : 처음 로그인한 날 다음 날 다시 로그인한 플레이어의 비율을 소수점 둘째 자리에서 반올림하여 보고하는 SQL 쿼리를 작성합니다.
# 즉, 첫 로그인 날짜부터 연속 2일 이상 로그인한 플레이어 수를 세고 그 수를 총 플레이어 수로 나누어야 합니다.

# 첫 로그인이므로 order by event_date limit 2 해서 min, max로 구했을 때 차이가 1이면 될듯하다.
# 대신 모든 player_id에 나눠줘야하므로 이게 문제인데..

select round(count(player_id) / (select count(distinct player_id) from Activity), 2) as fraction
from (select player_id
        from (select player_id, 
              event_date, 
              rank() over (partition by player_id order by event_date) ranking
              from Activity) a
        where ranking <= 2
        group by player_id
        having datediff(max(event_date), min(event_date)) = 1) a


