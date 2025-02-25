SELECT E.ID, E.GENOTYPE, D.GENOTYPE AS PARENT_GENOTYPE
FROM ECOLI_DATA AS E -- 자식 개체를 가져옴
INNER JOIN ECOLI_DATA AS D 
ON E.PARENT_ID = D.ID -- 부모 개체와 매칭
WHERE (E.GENOTYPE & D.GENOTYPE) = D.GENOTYPE -- 부모 형질이 자식 형질에 포함된 경우만 선택
ORDER BY E.ID ;

-- 문제에서 부모의 GENOTYPE이 자식의 GENOTYPE 안에 완전히 포함되어야 함

-- 참고)비트 AND 연산(&)을 이용한 포함 관계 확인
-- 비트 연산 &을 사용하면 부모의 형질이 자식에게 포함되었는지 확인 가능함
-- 예제 분석
-- 1) ID 3의 경우(성립하는 경우)
-- 부모(ID 1)의 GENOTYPE = 1 (0001)
-- 자식(ID 3)의 GENOTYPE = 3 (0011)
-- GENOTYPE(3) & GENOTYPE(1) = 0001 (1) => 부모 형질이 포함됨

-- 2) ID 4의 경우
-- 부모(ID 2)의 GENOTYPE = 1 (0001)
-- 자식(ID 4)의 GENOTYPE = 2 (0010)
-- GENOTYPE(2) & GENOTYPE(1) = 0000 (0) => 부모 형질을 포함하지 않음

-- 3) ID 8의 경우
-- 부모(ID 6)의 GENOTYPE = 5 (0101)
-- 자식(ID 8)의 GENOTYPE = 13 (1101)
-- GENOTYPE(13) & GENOTYPE(5) = 0101 (5) => 부모 형질이 포함됨

-- 결론:
-- WHERE (E.GENOTYPE & D.GENOTYPE) = D.GENOTYPE 이면, 부모의 형질이 자식에게 포함되었음을 의미
