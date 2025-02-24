SELECT I.FLAVOR -- 어떤 FLAVOR을 불러와야할 지도 항상 생각해두기 (F.FLAVOR을 
FROM FIRST_HALF AS F
  INNER JOIN ICECREAM AS I  -- INNER JOIN에 합치려는 테이블 이렇게 작성
  ON F.FLAVOR = I.FLAVOR    -- ON으로 KEY 묶어주기
WHERE (F.TOTAL_ORDER > 3000) AND (I.INGREDIENT_TYPE = 'fruit_based')
ORDER BY F.TOTAL_ORDER DESC ;

-- 추가 고려 사항
-- ICECREAM_INFO의 기본 키는 FLAVOR / ICECREAM_INFO테이블의 FLAVOR는 FIRST_HALF 테이블의 FLAVOR의 외래 키
-- 기본 키 : 유일성, 최소성을 가지고 해당 레코드 식별 시 반드시 필요한 키
-- 외래 키 : 다른 테이블의 기본 키, 데이터 무결성의 목적으로 사용
