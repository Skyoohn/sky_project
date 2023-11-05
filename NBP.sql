select * from nbp_board;

create table nbp_board (
nkid number(6) primary key,   -- 게시물 식별자
nkanji varchar2(100) not null,  -- 한자 title
nruby varchar2(500),  -- 요미가나
nsetsumei varchar2(500),  -- 설명
ndifficulty number(5) default 0, -- 난이도
ndate date default sysdate, -- 추가일
nselector number(1) not null -- 종류
);

drop table nbp_board;

commit;

rollback;

INSERT INTO nbp_board VALUES('1','フッ素','ふっそ','フッ素は、原子番?9の元素である。元素記?はF。原子量は18.9984。ハロゲンのひとつ。 また、同元素の??であるフッ素分子も、一般的にフッ素と呼ばれる。', '1', '11/12/30', '1');

update nbp_board set ndifficulty = ndifficulty + 1;

CREATE SEQUENCE nbp_board_seq
START WITH 1
INCREMENT BY 1;

create table nbp_user_board (
uid number(6) primary key,      -- 게시물 식별자
uname varchar2(20) not null,    -- 작성자 이름
utitle varchar2(100) not null,  -- 게시물 제목
ucontent varchar2(500),         -- 게시물 내용
udate date default sysdate,     -- 게시물 작성 일자
uhit number(4) default 0,       -- 조회수
uselector number(1) not null --1:공지 2:일반 게시판
);

CREATE SEQUENCE nbp_user_board_seq
START WITH 1
INCREMENT BY 1;

create table nbp_users(
   username varchar2(50) not null primary key,
   password varchar2(100) not null,
   enabled char(1) DEFAULT '1',
    cname VARCHAR2(50) NOT NULL,        -- 회원 이름
    cgrade NUMBER(1)                   -- 회원 등급
);

create table nbp_authorities (
   username varchar2(50) not null,
   authority varchar2(50) not null,
   constraint fk_nbp_authorities_nbp_users foreign key(username) references nbp_users(username)
);

create unique index ix_nbp_auth_nbp_username on nbp_authorities (username,authority);

select * from users;
select * from authorities;

commit;