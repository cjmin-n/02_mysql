-- GROUP BY
-- 결과 집합을 특정 열의 값에 따라 그룹화 하는데 사용함.
-- HAVING 을 함께 사용할 수 있음. - 그룹에 대한 조건 적용

SELECT
	category_code
  FROM tbl_menu
GROUP BY category_code;

-- COUNT() 함수 활용
SELECT
	category_code,
    count(*)                                   -- 각 카테고리가 몇개 씩 있는지 확인
  FROM tbl_menu
GROUP BY category_code;


-- SUM() 함수 활용
SELECT
	category_code,
    SUM(menu_price)                     -- 해당 카테고리의 메뉴가격의 합
  FROM tbl_menu
GROUP BY category_code;


-- AVG() 함수 활용
SELECT
	category_code,
    AVG(menu_price)                    -- 해당 카테고리의 평균 값
  FROM tbl_menu
GROUP BY category_code;


-- 2개 이상의 그룹 생성
SELECT
	menu_price,
    category_code
  FROM tbl_menu
GROUP BY                          -- 두 개가 같아야만 그룹화 !
	menu_price,
    category_code;




