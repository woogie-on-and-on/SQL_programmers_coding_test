SELECT COUNT(*) AS COUNT
FROM ECOLI_DATA A
WHERE 1 = 1 -- 항상 참인 조건으로 AND, OR을 자유롭게 작성 및 삭제하기 위함
  AND (2 != (GENOTYPE & 2)) 
  AND ( ((4 & GENOTYPE) = 4) OR ( (1 & GENOTYPE) = 1) )
-- &(비트 연산자) : GENOTYPE & 2인 경우,  GENOTYPE와 2를 각각 이진수로 변환하여, 둘다 1이면 1, 아니면 0으로 이진수 반환
-- 해당 이진수를 십진법으로 반환하여 출력해줌(켜진 비트만 확인)
