SELECT MCDP_CD AS '진료과코드', COUNT(PT_NO) AS '5월예약건수'
FROM APPOINTMENT
WHERE YEAR(APNT_YMD) = 2022 AND MONTH(APNT_YMD) = 5
GROUP BY MCDP_CD
ORDER BY COUNT(PT_NO), MCDP_CD ;

-- 생각해볼 사항
-- [1] 동일 환자가 여러 번 예약한 경우를 제외하고 싶은 겨우
-- COUNT(DISTINCT PT_NO)

-- [2] 취소 여부를 고려하지 않은 것이기 때문에, 예약 취소를 제외하고 싶은 경우
-- 예약 취소 여부가 NULL이거나 Y가 아닌 경우
-- WHERE절에 추가 AND(APNT_CNCL_YN IS NULL OR APNT_CNCL_YN != 'Y')
