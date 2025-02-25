SELECT COUNT(NAME)
(SELECT NAME
FROM ANIMAL_INS
GROUP BY NAME ) AS ANIMAL_CNT ;

-- 인라인 뷰(서브쿼리) 없이 COUNT() 사용하면 안되는 이유
-- GROUP BY의 기본 동작 방식
--  GROUP BY NAME을 하면, 각각의 NAME에 대해 하나의 그룹을 만든다.
-- => 즉, 같은 NAME을 가진 행들을 하나의 그룹으로 묶어줌
-- 여기서, GROUP BY는 동물의 이름이 몇 개 있는지 세는 것이 아니라, 이름이 유일한 값으로만 정리됨
-- 즉, 개수를 세는 것이 아니라, 중복 없이 이름 목록을 반환만 해줌

-- (주의) COUNT(NAME)을 직접 사용하면 안되는 이유
SELECT COUNT(NAME)
FROM ANIMAL_INS 
GROUP BY NAME;
-- 이렇게 실행 시, COUNT(NAME)이 각 그룹별로 계산되므로 개별 행마다 1이 출력됨

-- 서브쿼리 없이 해결
SELECT COUNT(DISTINCT NAME) -- DISTINCT 항상 기억하기
FROM ANIMAL_INS;
