# Write your MySQL query statement below
# 문제 : SQL 쿼리를 작성하여 월별 및 국가별, 거래 건수 및 총액, 승인된 거래 건수 및 총액을 찾습니다.

select date_format(trans_date, '%Y-%m') as month, 
        country,
        count(distinct id) as trans_count,
        count(if(state='approved', 1, NULL)) as approved_count,
        sum(amount) as trans_total_amount,
        sum(if(state='approved', amount, 0)) as approved_total_amount
from Transactions
group by 1, 2