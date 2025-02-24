SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, IFNULL(FREEZER_YN, 'N') AS FREEZER_YN
FROM FOOD_WAREHOUSE
WHERE ADDRESS LIKE '경기도%'
ORDER BY WAREHOUSE_ID ;
-- LIKE : 특정 문자열 패턴을 '포함'하는 데이터를 찾을 때 사용
-- IN : '명확'한 값의 목록을 찾을 때 사용 (%, _ 사용 불가) : 정확히 '경기도'만 검색이 가능
