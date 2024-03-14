create database dbtest;

use dbtest;

-- 회원 정보 table 생성.
-- table name : ssafy_member
-- column
-- idx			int			auto_increments		PK
-- userid		varchar(16)	not null
-- username		varchar(20)
-- userpwd		varchar(16)
-- emailid		varchar(20)
-- emaildomain	varchar(50)
-- joindate		timestamp	default	current_timestamp

create table ssafy_member(
    idx             int auto_increment,
    userid          varchar(16)    not null,
    username        varchar(20),
    userpwd         varchar(16),
    emailid         varchar(20),
    emaildomain     varchar(50),
    joindate        timestamp    default    current_timestamp,
    constraint member_idx_pk primary key (idx)
);

select * from ssafy_member;

-- 회원 정보 등록
-- 'kimssafy', '김싸피', '1234', 'kimssafy', 'ssafy.com' 등록시간
insert into ssafy_member (userid, username, userpwd, emailid, emaildomain)
values ('kimssafy', '김싸피', '1234', 'kimssafy', 'ssafy.com');

insert into ssafy_member (userid, username, userpwd, emailid, emaildomain)
values ('kimssafy', '김싸피', '1234', 'kimssafy', 'ssafy.com');

insert into ssafy_member (userid, username, userpwd, emailid, emaildomain)
values ('kimssafy', '김싸피', '1234', 'kimssafy', 'ssafy.com', now());

-- '김싸피', 'kimssafy', '1234'
insert into ssafy_member (username, userid, userpwd)
values ('이준수', 'level', '0524');

-- '이싸피', 'leessafy', '1234'
-- '박싸피', 'parkssafy', '9876'
insert into ssafy_member (username, userid, userpwd)
values ('홍길동', 'hong', '1234'),
		('강감찬', 'kang', '4567');
        
-- userid가 kimssafy인 회원의 비번을 9876, 이메일 도메인을 ssafy.com으로 변경.
update ssafy_member
set userpwd = '9876', emaildomain = 'ssafy.com'
where userid = 'level';

-- userid가 kimssafy 회원 탈퇴
delete from ssafy_member
where userid='kimssafy'