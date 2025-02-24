SELECT ROUND(AVG(DAILY_FEE), 0) AS AVERAGE_FEE
FROM CAR_RENTAL_COMPANY_CAR
WHERE CAR_TYPE = 'SUV' ;
-- 오답 이유 : 소수 첫 번째 자리에서 반올림인데, 소수 첫번째 자리까지 봐버림
