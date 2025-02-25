SELECT CAR_TYPE, COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%통풍시트%' OR OPTIONS LIKE '%열선시트%' OR OPTIONS LIKE '%가죽시트%' 
  -- LIKE 조건이 여러 개 있는 부분은 LIKE 하나씩 다 써줘야 함
  -- LIKE '%통풍시트%' OR '%열선시트%' OR '%가죽시트%'로 하면 코드가 제대로 실현되지 않음
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE ;
