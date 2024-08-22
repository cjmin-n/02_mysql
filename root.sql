-- gangnam 계정 만들어서 %로 전체접근 / 비번 : gangnam
create user 'gangnam'@'%' identified by 'gangnam';

-- 한줄주석
#
/* 여러줄 주석 */

-- 기존의 데이터베이스 확인
show databases;

-- mysql 기본 제공 database 접근
use mysql;

-- User 에 gangnam 있는지 확인
select * from user;

-- 데이터베이스(스키마) 생성 : 특정 역할 수행
create database menudb;

-- menudb의 모든 권한을 gangnam에 준다.
grant all PRIVILEGES on menudb.* to 'gangnam'@'%';

-- gangnam 권한 확인
show grants for 'gangnam'@'%';

use menudb;