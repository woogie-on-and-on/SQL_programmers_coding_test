SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION != 'Aged' -- 해당 값을 제외하기 위해 != 사용
ORDER BY ANIMAL_ID ;
-- NOT IN 과 !=의 차이점
-- != 은 NULL을 제외하고 처리하므로 더 안전하게 반환함
-- NOT IN 은 NULL이 포함되어 있으면, 결과값 반환하지 않음(잘 사용하지 않음)
