use moviedb;
/* 
영화관 티켓 예매 시스템을 위한 MySQL 데이터베이스를 설계하는 문제

 요구사항 
  1. 영화 테이블
   각 영화는 고유의 ID, 제목, 상영 시간, 총 좌석 수, 예약된 좌석 수를 가지고 있습니다.
   영화는 특정 영화관에서 상영됩니다.
  2. 영화관 테이블
    영화관은 고유의 ID와 이름, 위치 정보를 가지고 있으며, 여러 영화를 상영할 수 있습니다.
  3. 예약 테이블
    예약은 특정 사용자가 특정 영화의 좌석을 예약하는 것을 의미하며, 예약 시간과 예약된 좌석 수를 기록합니다.
*/
DESCRIBE movie_theaters;
DESCRIBE movies;
DESCRIBE reservations;


DROP TABLE IF EXISTS movie_theaters;
CREATE TABLE IF NOT EXISTS movie_theaters(
	theater_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
) ENGINE = INNODB;

DROP TABLE IF EXISTS movies;
CREATE TABLE IF NOT EXISTS movies(
	movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    show_time DATETIME NOT NULL,
    total_seats INT NOT NULL,
    reserved_seats INT NOT NULL,
    theater_id INT NOT NULL,
    FOREIGN KEY (theater_id)
    REFERENCES movie_theaters(theater_id)
) ENGINE = INNODB;

DROP TABLE IF EXISTS reservations;
CREATE TABLE IF NOT EXISTS reservations(
	user_name VARCHAR(255) NOT NULL,
    movie_id INT NOT NULL,
    seats_reserved INT NOT NULL,
    FOREIGN KEY (movie_id)
    REFERENCES movies(movie_id)
) ENGINE = INNODB;


INSERT INTO movie_theaters (
	name,
    location
) VALUES
	('CGV', '서초구'),
	('롯데시네마', '강남구'),
	('씨네큐', '영등포구');

SELECT * FROM movie_theaters;

INSERT INTO movies 
	(title, show_time, total_seats, reserved_seats, theater_id)
 VALUES 
	('늘봄가든', '2024-08-23 14:00:00', 100, 45, 1),
	('에어리언', '2024-08-23 17:00:00', 150, 90, 1),
	('행복의나라', '2024-08-24 20:00:00', 120, 30, 2),
	('파일럿', '2024-08-25 19:00:00', 200, 50, 3);

SELECT * FROM movies;

INSERT INTO reservations
	(user_name, movie_id, seats_reserved)
VALUES
	('철수', 1, 2),
	('영희', 2, 4),
	('길동', 1, 3),
	('관순', 3, 1),
	('민식', 4, 5);

SELECT * FROM reservations;

/*
1. 모든 영화관에서 총 몇개의 좌석이 예약되었나요?
2. 가장 많이 예약된 영화는 어떤거고 몇석이 되었나요?
3. 특정 영화의 남은 좌석 수를 확인 해주세요 (아무거나 골라서)
*/

# 1
-- 영화관 별 예약좌석 합계
-- 영화관 다 합치려면?..
SELECT
	SUM(b) TOTAL_SUM
  FROM
   ( SELECT
	SUM(reserved_seats) b
  FROM movies
GROUP BY theater_id
) a;

# 2
-- 예약된 좌석 중 제일 많은 좌석
-- 어떤거인지 확인 ???
SELECT
	MAX(reserved_seats)
  FROM movies;

/*
SELECT
	title,
    MAX(reserved_seats)
FROM movies
GROUP BY title;

SELECT
	title,
    reserved_seats
  FROM movies 
 WHERE (
	SELECT
		MAX(reserved_seats)
	  FROM movies
 )
 GROUP BY title;
 */
    










