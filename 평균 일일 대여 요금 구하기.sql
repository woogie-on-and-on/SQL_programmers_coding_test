-- 코드를 입력하세요
-- 14시 2분 시작
SELECT ROUND(AVG(DAILY_FEE), 0) AS AVERAGE_FEE
FROM CAR_RENTAL_COMPANY_CAR
WHERE CAR_TYPE = 'SUV' ;
-- 14시 5분 코드 제출 오류
-- 오답 이유 : 소수 첫 번째 자리에서 반올림인데, 소수 첫번째 자리까지 봐버림