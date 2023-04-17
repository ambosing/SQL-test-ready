# Write your MySQL query statement below
# 문제 : 각각 동일한 수의 프로세스를 실행하는 여러 대의 시스템이 있는 공장 웹 사이트가 있습니다. 각 시스템이 프로세스를 완료하는 데 걸리는 평균 시간을 찾기 위해 SQL 쿼리를 작성하십시오.
# 프로세스 완료 시간은 '종료' 타임스탬프에서 '시작' 타임스탬프를 뺀 값입니다. 평균 시간은 컴퓨터에서 모든 프로세스를 완료하는 데 걸리는 총 시간을 실행된 프로세스 수로 나눈 값으로 계산됩니다.
# 결과 테이블에는 평균 시간인 processing_time과 함께 machine_id가 있어야 하며 소수점 세 자리로 반올림해야 합니다.
# 순서에 상관없이 결과 테이블을 반환합니다.

select machine_id, round(sum(if(activity_type = 'start', -1, 1) * timestamp) / count(distinct process_id), 3) as processing_time
from Activity
group by machine_id