# Write your MySQL query statement below
# 문제 : 이메일 형식에 맞는 유저들을 찾으세요.

select *
from Users
where mail regexp "^[a-zA-Z][a-zA-Z0-9-_.]*@leetcode[.]com"