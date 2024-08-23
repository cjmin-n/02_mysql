-- CONSTRAINTS
-- 제약조건. 테이블에 데이터가 입력되거나 수정될 때의 규칙을 정의한다.
-- 테이블 작성 시 각 컬럼에 값에 대한 제약조건을 설정할 수 있다.
-- 입력 / 수정하는 데이터에 문제가 없는지 자동으로 검사해 준다.
-- 종류 = PRIMARY KEY, NOT NULL, UNIQUE, CHECK, FOREIGN KEY

-- NOT NULL
-- NULL 값을 허용하지 않는 제약 조건
-- 데이터를 입력 받을 때 꼭 들어가야 하는 내용.

DROP TABLE IF EXISTS user_notnull;
CREATE TABLE IF NOT EXISTS user_notnull (
	user_no INT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255)
)ENGINE = INNODB;

DESCRIBE user_notnull;

INSERT INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(1, "user01", "pass01", "홍길동", '남', "010-1234-5678", null),
    (2, "user01", "pass02", "유관순", '여', "010-1111-1111", "yu@gmail.com");
    
SELECT * FROM user_notnull;

/* INSERT INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(3, "user01", null, "홍길동", '남', "010-1234-5678", null);  */ -- NOT NULL 설정되어있는 것에 NULL 넣으면 오류
    
    
/*INSERT INTO user_notnull (
	user_no, user_id, user_pwd, user_name, gender, phone, email
)VALUES(
	null, "user03", "pwd03", "누누누", '남', "010-8888-8888", null); */ -- PRIMARY KEY 설정해도 NOT NULL 이면 NULL 추가 못함


-- UNIQUE
-- 중복값을 허용하지 않는 제약조건
DROP TABLE IF EXISTS user_unique;
CREATE TABLE IF NOT EXISTS user_unique(
	user_no INT NOT NULL UNIQUE,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    UNIQUE (phone)
) ENGINE = INNODB;

DESCRIBE user_unique;

INSERT INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(1, "user01", "pass01", "홍길동", '남자', "010-1234-5678", null),
	(2, "user02", "pass02", "유관순", '여자', "010-2345-5678", null);

SELECT * FROM user_unique;



-- PRIMARY KEY
-- 테이블에서 한 행의 정보를 찾기 위해 사용할 컬럼을 의미한다.
-- 테이블에 대한 식별자 역할을 한다. ( 한 행씩 구분하는 역할 )
-- NOT NULL + UNIQUE 제약조건을 가진다.
-- 한 테이블 당 한 개만 설정할 수 있다.
-- 한 개의 컬럼에 설정할 수도 있고, 여러 개의 컬럼을 묶어서 설정할 수 도 있다. (복합키)
-- !보통 INT 자료형 사용 - AUTO_INCREMENT 사용 / 가장 작은 메모리 

DROP TABLE IF EXISTS user_primarykey;
CREATE TABLE IF NOT EXISTS user_primarykey(
	user_no INT ,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    PRIMARY KEY (user_no)
) ENGINE = INNODB;

DESCRIBE user_primarykey;

INSERT INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(1, "user01", "pass01", "홍길동", "남", "010-1234-5678", null),
	(2, "user02", "pass02", "유관순", "여", "010-2345-5678", null);
    
SELECT * FROM user_primarykey;

/* !에러 : PRIMARY KEY 는 UNIQUE 중복 불가, null 불가의 속성을 가진다. 
INSERT INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(1, "user01", "pass01", "홍길동", "남", "010-1234-5678", null),
	(null, "user02", "pass02", "유관순", "여", "010-2345-5678", null), 
	(1, "user02", "pass02", "유관순", "여", "010-2345-5678", null);
*/


-- FOREIGN KEY
-- 참조된 다른 테이블에서 제공하는 값만 사용할 수 있음.
-- FOREIGN KEY 제약 조건에 의해 테이블 간의 관계가 형성됨.
-- 제공되는 값 외에는 NULL 을 사용할 수 있음.
-- 설정되어 있는 경우에는 컬럼을 변경하지 못함.

DROP TABLE IF EXISTS user_grade;
CREATE TABLE IF NOT EXISTS user_grade(
	grade_code INT NOT NULL UNIQUE,      -- NOT NULL + UNIQUE 입력 시 PRIMARY KEY ??
    grade_name VARCHAR(255) NOT NULL
)ENGINE = INNODB;

DESCRIBE user_grade;

INSERT INTO user_grade
VALUES
	(10, "일반회원"),
    (20, "우수회원"),
    (30, "특별회원");
    
SELECT * FROM user_grade;


DROP TABLE IF EXISTS user_foreignkey1;
CREATE TABLE IF NOT EXISTS user_foreignkey1(
	user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT NOT NULL,
    FOREIGN KEY (grade_code)
    REFERENCES user_grade (grade_code) -- REFERENCES 참조할 테이블이름 (참조할 테이블의 컬럼)
)ENGINE = INNODB;


DESCRIBE user_foreignkey1;


INSERT INTO user_foreignkey1
	(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(1, "user01", "pass01", "홍길동", '남', "010-1234-5678", null, 10),
	(2, "user02", "pass02", "유관순", '여', "010-1234-5678", null, 20);
    
SELECT * FROM user_foreignkey1;

SELECT
	*
  FROM user_grade a
JOIN user_foreignkey1 b
-- ON a.grade_code = b.grade_code;
USING (grade_code);

INSERT INTO user_foreignkey1
	(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(3, "user02", "pass02", "유관순", '여', "010-1234-5678", null, null);  



-- DELETE, UPDATE 룰
DROP TABLE IF EXISTS user_foreignkey2;
CREATE TABLE IF NOT EXISTS user_foreignkey2(
	user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT,
    FOREIGN KEY (grade_code)
    REFERENCES user_grade(grade_code)
		ON UPDATE SET NULL   
        ON DELETE SET NULL  -- 부모가 바뀌거나 삭제되면 자식이 NULL 된다. 가능하지만 잘 사용하지 않는다.
) ENGINE = INNODB;

DESCRIBE user_foreignkey2;

INSERT INTO user_foreignkey2
 ( user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code )
VALUES
	(1, "user01", "pass01", "홍길동", '남', "010-1234-5678", null, 10),
	(2, "user02", "pass02", "유관순", '여', "010-1234-5678", null, 20);
    
SELECT * FROM user_foreignkey2;

UPDATE user_grade
   SET grade_code = 1       -- ON DELETE SET NULL / ON UPDATE SET NULL 일 때 자식의(참조하고 있는) grade_code 가 null 이 됨
 WHERE grade_code = 10;     -- -> 위의 구문이 빠지면 부모는 변경이 안되기 때문에 에러.


DELETE FROM user_grade
 WHERE grade_code = 20;     -- -> user_foreignkey2 테이블의 grade_code 가 null로 바뀜.
 

-- CHECK
-- check 제약 조건 위반 시 허용하지 않는 제약조건 : 체크로 지정한 값만 허용
DROP TABLE IF EXISTS user_check;
CREATE TABLE IF NOT EXISTS user_check(
	user_no INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3) CHECK (gender IN ('남', '여')),
    age INT CHECK(age >= 19)
) ENGINE = INNODB;

DESCRIBE user_check;

INSERT INTO user_check
VALUES 
	(null, "홍길동", "남", 25),
	(null, "이순신", "남", 33);
    
SELECT * FROM user_check;
    

/* 
INSERT INTO user_check
VALUES
	-- (null, "안중근", "남성", 27);   -- gender의 CHECK 제약 조건에 위배되어 에러. 
	(null, "안중근", "남", 10);       -- age의 CHECK 제약 조건에 위배되어 에러. 
*/



-- DEFAULT
-- 컬럼의 null 대신에 기본 값 적용
-- 컬럼 타입이 DATE 일 경우 - current_date 만 사용 가능
-- DATETIME 일 경우 - current_time, current_timestamp, now() 모두 가능

DROP TABLE IF EXISTS tbl_country;
CREATE TABLE IF NOT EXISTS tbl_country(
	country_code INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT "한국",
    population VARCHAR(255) DEFAULT "0명",
    add_day DATE DEFAULT (current_date()),
    add_time DATETIME DEFAULT (current_time())                   -- INSERT 해줬을 때의 시간으로 SELECT 됨.
    
)ENGINE = INNODB;

DESCRIBE tbl_country;

INSERT INTO tbl_country
VALUES (NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT); 

SELECT * FROM tbl_country;





