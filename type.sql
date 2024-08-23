-- SQL 형변환
-- 명시적 형변환과 암시적 형변환이 있다.

-- 명시적 형변환

-- CAST
-- CONVERT : mySql만 있을 수 있다.

SELECT AVG(menu_price) FROM tbl_menu;     -- AVG() 반올림

SELECT 
	CAST(AVG(menu_price) AS SIGNED INTEGER) AS "평균 메뉴 가격" 
  FROM tbl_menu;
  
SELECT
	CONVERT(AVG(menu_price), SIGNED INTEGER) AS "평균 메뉴 가격"
  FROM tbl_menu;
  
-- 가능한 데이터 형식
-- BINARY, CHAR, DATE, DATETIME, DECIMAL, JSON, TIME, INTEGER

SELECT  # 문자열을 데이터로 형변환 가능
	CAST("2023$5$30" AS DATE),             
    CAST("2023/5/30" AS DATE),
    CAST("2023%5%30" AS DATE),
    CAST("2023@5@30" AS DATE);

-- 메뉴 가격 구하기
SELECT
	CONCAT(CAST(menu_price AS CHAR(5)), "원")  # CONCAT() ','를 기준으로 앞뒤를 합쳐준다.
  FROM tbl_menu;
  
-- 카테고리 별로 메뉴 가격의 합계를 구해서
-- ( 카테고리코드 ~~원 ) 으로 표시해주세요.

SELECT
	category_code,
    CONCAT(CAST(SUM(menu_price) AS CHAR(10)) , "원") AS SUM     -- 명시적 형변환
    -- CONCAT(SUM(menu_price) , "원") AS SUM                    -- 묵시적 형변환
  FROM tbl_menu
GROUP BY category_code;


-- 암시적 형변환
-- 자동으로 내부에서 이루어지는 형변환
SELECT '1'+'2'; -- 3 : 각 문자가 정수로 변환됨.
SELECT CONCAT(menu_price, "원") FROM tbl_menu;  -- menu_price가 문자로 바껴서 합친다.

SELECT 3 > "TEXT"; -- 1 : 1 = true / 정수랑 문자가 대소비교할 때 문자는 0으로 변환. 3 > 1 은 true
SELECT 3 > "4TEXT"; -- 0 : 0 = false / 문자열 맨앞에 숫자가 나오면 숫자로 변환. 3 > 4 는 false
SELECT 3 > "T4EXT"; -- 1 : 숫자가 중간에 있을 때는 똑같이 0으로 변환








  
  
  
  
  
  
  
  
  
  
  
  
  
  

