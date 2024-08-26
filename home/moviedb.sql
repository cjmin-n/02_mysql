use moviedb;

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
    REFERENCES movie_theaters (theater_id)
) ENGINE = INNODB;

DROP TABLE IF EXISTS reservations;
CREATE TABLE IF NOT EXISTS reservations (
	user_name VARCHAR(255) NOT NULL,
    movie_id INT NOT NULL,
    seats_reserved INT NOT NULL,
    FOREIGN KEY (movie_id)
    REFERENCES movies (movie_id)
) ENGINE = INNODB;

INSERT INTO movie_theaters
	(name, location)
    VALUES
		('CGV', '서초구'),
		('롯데시네마', '강남구'),
		('씨네큐', '영등포구');
        
INSERT INTO movies
	(title, show_time, total_seats, reserved_seats, theater_id)
    VALUES
		('늘봄가든', '2024-08-23 14:00:00', 100, 45, 1),
		('에어리언', '2024-08-23 17:00:00', 150, 90, 1),
		('행복의나라', '2024-08-24 20:00:00', 120, 30, 2),
		('파일럿', '2024-08-25 19:00:00', 200, 50, 3);
        
INSERT INTO reservations
	 (user_name, movie_id, seats_reserved) 
     VALUES 
		('철수', 1, 2),
		('영희', 2, 4),
		('길동', 1, 3),
		('관순', 3, 1),
		('민식', 4, 5);
        
