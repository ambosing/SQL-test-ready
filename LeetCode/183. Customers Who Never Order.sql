# Write your MySQL query statement below
select distinct p1.email 
from person p1, person p2
where p2.id > p1.id and p2.email = p1.email