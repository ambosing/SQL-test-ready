# Write your MySQL query statement below
# 문제 : 대학에서 선생들이 가르치는 고유한 과목 수들을 보고하라

select teacher_id, count(distinct subject_id) as cnt
from Teacher
group by teacher_id