-- SUBQUERIES
-- 다른 쿼리 내에서 실행되는 쿼리이다.

SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
  FROM tbl_menu
WHERE
	category_code = (
		SELECT
			category_code
		  FROM tbl_menu
	     WHERE menu_name = "민트미역국" -- 1 민트미역국 카테고리코드를 2 가진 것을 출력
    );
    

-- 서브쿼리를 활용한 메인 쿼리
SELECT
	MAX(count) 					-- 2 그 중 최고값
  FROM 
	(SELECT
		COUNT(*) AS 'count' 	-- 1 각 카테고리 코드의 숫자 세서
	  FROM 						
		tbl_menu
	  GROUP BY category_code) As countmenu; -- FROM절에 서브쿼리를 쓰면 별칭을 꼭 지어줘야한다. WHERE절은 안지어도 됨.
      

SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
  FROM tbl_menu a
 WHERE 
	menu_price > (
		SELECT
			AVG(menu_price)
		  FROM tbl_menu
		 WHERE category_code = a.category_code
    );


