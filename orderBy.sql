-- ORDER BY
-- SELECT 문과 함께 사용하며, 결과 집합을 특정 열이나 열들의
-- 값을 따라 정렬하는데 사용한다.

SELECT 
	menu_code,
    menu_name,
    menu_price
  FROM tbl_menu
 ORDER BY
	-- menu_price ASC; -- ASC는 오름차순 / ASC 생략해도 오름차순된다.
    menu_price DESC; -- DESC는 내림차순

SELECT
	menu_code,
    menu_name,
    menu_price
  FROM tbl_menu
 ORDER BY
	menu_price DESC, -- 위에가 우선순위
    menu_name ASC;


-- 연산 결과로 결과 집합 정렬
SELECT
	menu_code,
    menu_name,
    menu_price,
    (menu_code * menu_price) AS multi -- 묶음의 이름을 AS 별칭 으로 정해준다. 정해준 별칭으로 데이터가 넘어옴.
  FROM
	tbl_menu
 ORDER BY 
	-- menu_code * menu_price DESC;
    multi DESC;


