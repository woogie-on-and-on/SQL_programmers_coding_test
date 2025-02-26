SELECT INFO.FISH_COUNT, NAME.FISH_NAME
FROM FISH_NAME_INFO AS NAME
RIGHT JOIN (SELECT FISH_TYPE, COUNT(*) AS FISH_COUNT -- 0마리 잡힌 물고기는 포함하지 않음(문제 요구사항)
FROM FISH_INFO 
GROUP BY FISH_TYPE) AS INFO
ON NAME.FISH_TYPE = INFO.FISH_TYPE
ORDER BY FISH_COUNT DESC ;

-- RIGHT JOIN과 LEFT JOIN의 차이
-- 해당 문제의 목표는 "잡은 물고기의 종류별 이름과 개수를 출력하는 것"
-- 즉, 기준 테이블은 "실제로 잡힌 물고기(FISH_INFO)"가 되어야 함
-- 따라서, 0마리 잡힌 것까지 보여줄 필요가 없으므로 RIGHT JOIN을 사용
