SELECT BOOK_ID, DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK
WHERE (DATE_FORMAT(PUBLISHED_DATE, '%Y') = '2021') AND (CATEGORY = '인문') -- YEAR(PUBLISHED_DATE) = 2021로 가급적 수행(쿼리 속도 상승, 가독성 목적)
ORDER BY PUBLISHED_DATE ASC ; 

-- DATE_FORMAT에서 '%Y-%m-%d'로 나타내야 2025-02-16 형식으로 나옴(대소문자 확인)
-- 문자형보다 숫자형으로 처리하면 쿼리 속도가 빨리진다는 것을 학습함
