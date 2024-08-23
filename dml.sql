-- DML ( Data Manipulation Language) 데이터조작언어

-- 테이블에 값을 삽입하거나 수정하거나 삭제하는 SQL의 한 부분이다.
-- insert, update, delete, select(dql - data query language)

-- 값을 등록하거나 수정하는 경우 아래의 내용을 주의해야 한다.
-- 1. 데이터 타입
-- 2. 제약 조건


-- INSERT
-- 새로운 행을 추가하는 구문
-- 테이블의 행의 수가 증가한다.

INSERT INTO tbl_menu (
	-- menu_code, 
    menu_name,
    menu_price,
    category_code,
    orderable_status
)VALUES(
	-- null, -- PRIMARY KEY / AUTO_INCREMENT 로 자동으로 증가 -- 지우고 추가해도 추가됨!
    "바나나해장국", 
    8500,
    4,
    'Y'
);

SELECT * FROM tbl_menu;


INSERT INTO tbl_menu VALUES(null, "바나나해장국", 8500, 4, 'Y'); -- null 생략 못함 -- 컬럼 없이 값만 입력할 때

/* INSERT INTO tbl_menu(테이블 이름) (
	컬럼 이름 (PRIMARY_KEY : 생략가능)
	컬럼 이름,
    컬럼 이름2
) VALUES (
	null (PRIMARY_KEY : 생략가능)
	컬럼에 맞는 값,
    컬럼에 맞는 값
)
*/


-- 컬럼의 순서를 변경하는 경우 순서에 맞게 값을 넣어주면 된다.
INSERT INTO tbl_menu(orderable_status, menu_price, menu_name, category_code)
VALUES('Y', 5500, "파인애플탕", 4);

SELECT * FROM tbl_menu;


-- insert 안에 서브쿼리 사용 가능 (거의 안씀)
INSERT INTO tbl_menu VALUES(
	NULL,
    "순대국밥",
    8500,
    (SELECT category_code FROM tbl_category WHERE category_name = "한식"), -- category_name은 알고 category_code 를 모를때 ?
    'Y'
);


-- MULTI INSERT
INSERT INTO
	tbl_menu
    VALUES
		(null, "참치맛아이스크림", 1700, 12, 'Y'),
		(null, "멸치맛아이스크림", 1500, 11, 'Y'),
		(null, "소시지맛커피", 2500, 8, 'Y');

SELECT * FROM tbl_menu;



-- UPDATE (기존의 값을 변경) -> Edit - Preferences -> SQL Editor - Safe Updates 체크해제 후에 가능
-- 테이블에 기록된 컬럼의 값을 수정하는 구문이다.
-- 테이블의 전체 행 갯수는 변화가 없다.

SELECT
	*
  FROM tbl_menu
 WHERE menu_name = "바나나해장국";

UPDATE tbl_menu
	SET menu_name = "델몬트바나나"
 WHERE menu_name = "바나나해장국";
 
 SELECT
	*
  FROM tbl_menu
 WHERE menu_name = "델몬트바나나";
 
 
 -- 서브쿼리 활용
 /* UPDATE tbl_menu
	SET category_code = 6
 WHERE menu_price IN (
	SELECT
		menu_price
	  FROM tbl_menu       -- 동시성 문제 생김
     WHERE menu_name = "델몬트바나나"
 ); */ -- 에러
 
-- 변경 후
 UPDATE tbl_menu
	SET category_code = 6
 WHERE menu_price IN (
	SELECT
		menu_price
	  FROM (SELECT * FROM tbl_menu) AS a   -- tbl_menu를 쓰면 동시성 문제(업데이트될 테이블을 바로 자신한테 쓸 수 없다!) 때문에 어떤거를 먼저 읽을지 서브쿼리를 써야한다. 
     WHERE menu_name = "델몬트바나나"
 );
 

-- 여러 컬럼도 한번에 가능
 UPDATE tbl_menu
	SET category_code = 6,
		menu_name = "맛있는바나나"
 WHERE menu_price IN (
	SELECT
		menu_price
	  FROM (SELECT * FROM tbl_menu) AS a 
     WHERE menu_name = "델몬트바나나"
 );
 
 SELECT 
	* 
  FROM tbl_menu 
 WHERE menu_name="델몬트바나나";
 
 SELECT 
	* 
  FROM tbl_menu 
 WHERE menu_name="맛있는바나나";

 
 
-- DELETE
-- 테이블의 행을 삭제하는 구문이다.
-- 테이블의 행의 갯수가 줄어든다.

-- WHERE 절을 이용한 단일 행 삭제
DELETE FROM tbl_menu
 WHERE menu_name = "맛있는바나나";

SELECT * FROM tbl_menu;


-- Limit 를 활용한 행 삭제
DELETE FROM tbl_menu
 ORDER BY menu_code Desc
 LIMIT 2;
 
-- 테이블의 값을 전체 삭제하는 경우 - 실행하지 않는 것이 좋다.
-- DELETE FROM tbl_menu;

-- 데이터를 중요하게 관리해야 하기 때문에
-- delete query 는 잘 사용하지 않으며
-- 삭제를 해야하는 경우 아래와 같이 상태를 업데이트 하는 방식으로 진행한다.

SELECT
	*
  FROM tbl_menu
 WHERE orderable_status = 'Y';

UPDATE tbl_menu
   SET orderable_status = 'N'
 WHERE menu_code = 26;


-- REPLACE
-- 이미 존재하고 있다면 UPDATE, 없으면 INSERT
-- INSERT INTO tbl_menu VALUES(26, "참기름소주", 5000, 10, 'Y'); -- 에러
REPLACE INTO tbl_menu VALUES(22, "참기름소주", 5000, 10, 'Y'); 

SELECT * FROM tbl_menu;

 
 
 
 