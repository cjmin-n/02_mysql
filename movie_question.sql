use moviedb;

# 1. 모든 영화관에서 총 몇개의 좌석이 예약되었나요?
SELECT
	SUM(a)
  FROM (
	SELECT
		SUM(reserved_seats) a
      FROM movies
  ) b;
  
# 2. 가장 많이 예약된 영화는 어떤거고 몇석이 되었나요?
SELECT
	title,
	reserved_seats
  FROM movies 
 WHERE reserved_seats = (
	SELECT
		MAX(reserved_seats)
	  FROM movies a
 );
 
 # 3. 특정 영화의 남은 좌석 수를 확인 해주세요 (아무거나 골라서)
SELECT
	title,
    (total_seats-reserved_seats) remained_seat
  FROM movies
WHERE title = "늘봄가든";



