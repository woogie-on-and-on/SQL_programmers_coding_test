SELECT DISTINCT(D.ID), D.EMAIL, D.FIRST_NAME, D.LAST_NAME
FROM DEVELOPERS AS D
JOIN SKILLCODES AS S
ON (D.SKILL_CODE & S.CODE) = S.CODE AND S.NAME IN ('Python', 'C#') 
ORDER BY D.ID ; 

-- 비트 연산자 복습 (D.SKILL_CODE & S.CODE) = S.CODE일때 S.CODE가 정확하게 2의 제곱수일때만 정확히 포함된다
-- 10000처럼 하나의 1인 경우만 정확하게 해당 S.CODE가 십진수일 때 포함되는 지 확인 가능

-- ON의 기능 : 단순히 동일한 COLUMN 기준으로 JOIN하는 것에 그치지 않고, 특정 조건을 걸어서 만족하는 값만 JOIN할 수 있도록 함

-- DISTINCT : JOIN이 여러 개의 행을 반환할 수 있기 때문에, 항상 고려하기
-- 여기서는 DEVELOPERS에서 한명의 개발자가 여러 스킬을 가질 수도 있음(예를 들어, Python, C#을 가지는 경우 DISTINCT가 없으면 해당 개발자가 2번 출력됨)

/*
==================================================
DISTINCT가 왜 필요한가? (JOIN 중복 문제 해결)
==================================================
1️. JOIN이 여러 개의 행을 반환할 가능성이 존재
 - DEVELOPERS 테이블의 한 명의 개발자가 여러 개의 스킬을 가질 수 있음.
- SKILLCODES 테이블에서 'Python'과 'C#'을 찾을 때, 동일한 개발자가 두 개의 행으로 출력될 수 있음.

EX) 예제 DATA
==================================================
[DEVELOPERS 테이블]
--------------------------------------------------
| ID | EMAIL      | FIRST_NAME | LAST_NAME | SKILL_CODE (10진수) | SKILL_CODE (2진수) |
|----|-----------|------------|-----------|---------------------|---------------------|
| 1  | a@dev.com | Alice      | Smith     | 1280                | 10100000000 (Python + Java) |
| 2  | b@dev.com | Bob        | Johnson   | 1024                | 10000000000 (Python) |
| 3  | c@dev.com | Charlie    | Brown     | 256                 | 100000000 (C#)     |
--------------------------------------------------

[SKILLCODES 테이블]
--------------------------------------------------
| NAME   | CODE (10진수) | CODE (2진수)    |
|--------|-------------|----------------|
| Python | 1024       | 10000000000    |
| C#     | 256        | 100000000      |
--------------------------------------------------
*/

-- =============================================
-- 2. JOIN 후 결과 (DISTINCT 없이 실행한 경우)
-- =============================================
-- 중복된 행 발생 가능성 존재
SELECT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME, S.NAME
FROM DEVELOPERS AS D 
JOIN SKILLCODES AS S
ON (D.SKILL_CODE & S.CODE) = S.CODE
WHERE S.NAME IN ('Python', 'C#')
ORDER BY D.ID;

/*
- 결과 (중복 포함됨)
--------------------------------------------------
| ID | EMAIL      | FIRST_NAME | LAST_NAME | NAME   |
|----|-----------|------------|-----------|--------|
| 1  | a@dev.com | Alice      | Smith     | Python |
| 2  | b@dev.com | Bob        | Johnson   | Python |
| 3  | c@dev.com | Charlie    | Brown     | C#     |
--------------------------------------------------
*/

-- Alice(1번 ID)가 Python과 C# 둘 다 구현 가능한 개발자인 경우
/*
- 중복된 결과 예시
--------------------------------------------------
| ID | EMAIL      | FIRST_NAME | LAST_NAME | NAME   |
|----|-----------|------------|-----------|--------|
| 1  | a@dev.com | Alice      | Smith     | Python |
| 1  | a@dev.com | Alice      | Smith     | C#     |
| 2  | b@dev.com | Bob        | Johnson   | Python |
| 3  | c@dev.com | Charlie    | Brown     | C#     |
--------------------------------------------------

- Alice(1번 ID)가 Python과 C#을 둘 다 가지고 있어서 두 개의 행이 출력됨
=> 이걸 방지하기 위해 DISTINCT를 사용
*/

-- =============================================
-- 3. DISTINCT를 활용하여 중복 제거하기
-- =============================================
SELECT DISTINCT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
FROM DEVELOPERS AS D 
JOIN SKILLCODES AS S
ON (D.SKILL_CODE & S.CODE) = S.CODE
WHERE S.NAME IN ('Python', 'C#')
ORDER BY D.ID;

/*
- 결과 (중복 제거됨)
--------------------------------------------------
| ID | EMAIL      | FIRST_NAME | LAST_NAME |
|----|-----------|------------|-----------|
| 1  | a@dev.com | Alice      | Smith     |
| 2  | b@dev.com | Bob        | Johnson   |
| 3  | c@dev.com | Charlie    | Brown     |
--------------------------------------------------
-> DISTINCT를 사용하면, 동일한 개발자가 여러 개의 스킬을 가지고 있더라도
   한 번만 출력되므로 중복 문제가 해결됨!
*/
