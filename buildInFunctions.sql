-- BUILD IN FUNCTIONS

-- ASCII
SELECT ASCII('A');

-- CONCAT
SELECT CONCAT("호랑이", "기린", "토끼");
SELECT CONCAT_WS(",", "호랑이", "기린", "토끼");   -- 맨 앞에 구분자를 먼저 설정

-- ELT : 해당 위치의 문자열 반환
SELECT ELT(2, "사과", "딸기", "바나나");        -- 맨 앞에 위치 번호

-- FIELD : 찾을 문자열 위치 반환
SELECT FIELD("딸기", "사과", "딸기", "바나나");  -- 맨 앞에 찾을 단어

-- FORMAT(숫자, 소수점 자릿수)
SELECT FORMAT(123123341223.4563434, 3);   -- 천단위 , 찍고 소수점 자릿수에서 반올림.

-- 2진수, 8진수, 16진수
SELECT BIN(65), OCT(65), HEX(65);


-- INSERT(기존 문자열, 위치, 길이, 삽입할 문자열)
SELECT INSERT ("내 이름은 홍길동입니다.", 7, 3, "유관순");


-- LEFT, RIGHT (문자열, 반환할 숫자(왼쪽/오른쪽 부터)) 
SELECT LEFT("HELLO WORLD!", 3), RIGHT("HELLO WORLD!", 3);


-- LOWER, UPPER

-- TRIM - (공백 제거)

-- REPEAT(문자열, 횟수)
SELECT REPEAT("MYSQL", 3);

-- REPLACE(문자열, 찾을 문자열, 바꿀 문자열)
SELECT REPLACE("마이SQL", "마이", "MY");

-- REVERSE(문자열)
SELECT REVERSE("STRESSED");

-- SUBSTRING(문자열, 시작위치, 길이)
SELECT SUBSTRING("안녕하세요 반갑습니다", 7, 2);

