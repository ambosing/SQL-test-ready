# Write your MySQL query statement below
# 문제 : 2020년 2월 평균 평점이 가장 높은 영화 이름을 찾습니다. 동률인 경우 사전순으로 더 작은 영화 이름을 반환합니다.
# 가장 많은 수의 영화를 평가한 사용자의 이름을 찾으십시오. 동점인 경우 사전순으로 더 작은 사용자 이름을 반환합니다.

with greatest_number_of_movie_rated_name as (
    select name as results
    from MovieRating m
    join Users u on m.user_id = u.user_id
    group by u.user_id
    order by count(*) desc, name
    limit 1
), highest_average_rating_movie as (
  select title as results
  from MovieRating r
  join Movies m on m.movie_id = r.movie_id
  where created_at >= '2020-02-01' and created_at < '2020-03-01'
  group by m.movie_id
  order by avg(rating) desc, title
  limit 1
)

select *
from greatest_number_of_movie_rated_name
union
select *
from highest_average_rating_movie