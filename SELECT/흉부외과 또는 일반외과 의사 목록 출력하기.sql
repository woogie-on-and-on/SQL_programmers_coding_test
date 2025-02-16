SELECT DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(DOCTOR.HIRE_YMD, '%Y-%M-%D') AS HIRE_YMD -- DATE_FORMAT 익히기
FROM DOCTOR
WHERE MCDP_CD IN ('CS', 'GS') -- 동일 컬럼이면, 추후 실행 속도 향상을 위해 WHERE 대신 IN으로 하는 습관
ORDER BY HIRE_YMD DESC, DR_NAME ASC ; 
-- 문제 풀 때, 하단의 주의사항 읽기(날짜 포맷 맞추기)
