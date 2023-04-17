# Write your MySQL query statement below
# 문제 : 유효하지 않은 트윗의 ID를 찾기 위해 SQL 쿼리를 작성하십시오. 트윗 내용에 사용된 문자 수가 15보다 크면 트윗이 유효하지 않습니다.

select tweet_id
from Tweets
where length(content) > 15