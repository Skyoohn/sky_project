-- 게시판 db
create table ms_board (
bid number(6) primary key,      -- 게시물 식별자
bname varchar2(20) not null,    -- 작성자 이름
btitle varchar2(100) not null,  -- 게시물 제목
bcontent varchar2(500),         -- 게시물 내용
bdate date default sysdate,     -- 게시물 작성 일자
bhit number(4) default 0,       -- 조회수
bgroup number(4),
bstep number(4),
bindent number(4),
selecter number(1) not null --게시글구분 1:공지 2:qna 3:리뷰
);


drop table ms_board;
select * from ms_board where bid=12;
select * from ms_board where selecter =3;


INSERT INTO ms_board VALUES('1','1','P1','1','11/12/30','1','1','1','1','1');

commit;

rollback;


drop table ms_notice_board;

select * from ms_notice_board;

commit;

CREATE SEQUENCE ms_board_seq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE ms_notice_board_seq
START WITH 1
INCREMENT BY 1;

commit;

create table ms_qna_board (
  qid number(6) primary key,        -- 게시물 식별자
  qname varchar2(20) not null,      -- 작성자 이름
  qtitle varchar2(100) not null,    -- 게시물 제목
  qcontent varchar2(500),           -- 게시물 내용
  qdate date default sysdate,       -- 게시물 작성 일자
  qgroup number(4),
  qstep number(4),
  qindent number(4),
    selecter number(1) not null
);

drop table ms_review_board;
drop table ms_qna_board;

select * from ms_qna_board;

create table ms_review_board (
  rid number(6) primary key,        -- 게시물 식별자
  rname varchar2(20) not null,      -- 작성자 이름
  rtitle varchar2(100) not null,    -- 게시물 제목
  rcontent varchar2(500),           -- 게시물 내용
  rdate date default sysdate,       -- 게시물 작성 일자
  rgroup number(4),
  rstep number(4),
  rindent number(4),
    selecter number(1) not null
);




create table ms_review_board (
  rid number(6) primary key,        -- 게시물 식별자
  rname varchar2(20) not null,      -- 작성자 이름
  rtitle varchar2(100) not null,    -- 게시물 제목
  rcontent varchar2(500),           -- 게시물 내용
  rdate date default sysdate,       -- 게시물 작성 일자
  rgroup number(4),
  rstep number(4),
  rindent number(4),

);




select * from ms_review_board;
select * from ms_qna_board;

CREATE SEQUENCE ms_qna_board_seq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE ms_review_board_seq
START WITH 1
INCREMENT BY 1;

commit;


drop table ms_notice_board;


create table ms_notice_board (
    nid number(6) primary key,      -- 게시물 식별자
    nname varchar2(20) not null,    -- 작성자 이름
    ntitle varchar2(100) not null,  -- 게시물 제목
    ncontent varchar2(500),         -- 게시물 내용
    ndate date default sysdate,     -- 게시물 작성 일자
    ngroup number(4),
    nstep number(4),
    nindent number(4),
    selecter number(1) not null
);


select * from ms_notice_board;

commit;

CREATE SEQUENCE ms_notice_board_seq
START WITH 1
INCREMENT BY 1;


INSERT INTO ms_notice_board1 VALUES('1','1','P1','1','11/12/30','1','1','1');


SELECT
    OBJECT_NAME
    ,OBJECT_TYPE
FROM
    ms_notice_board
WHERE OBJECT_NAME LIKE '%테이블명%';


select * from ms_board where selecter = 1;



-------------------------------------------------------------------------------




create table ms_users(
   username varchar2(50) not null primary key,
   password varchar2(100) not null,
   enabled char(1) DEFAULT '1',
    cname VARCHAR2(50) NOT NULL,        -- 회원 이름
    cbirthdate DATE,           -- 회원 생년월일
    caddress1 VARCHAR2(100),             -- 회원 주소
    caddress2 VARCHAR2(100),
    caddress3 VARCHAR2(100),
    caddress4 VARCHAR2(100),
    caddress5 VARCHAR2(100),
    cgrade NUMBER(1)                   -- 회원 등급
);
create table ms_authorities (
   username varchar2(50) not null,
   authority varchar2(50) not null,
   constraint fk_ms_authorities_ms_users foreign key(username) references ms_users(username)
);
create unique index ix_ms_auth_ms_username on ms_authorities (username,authority);
select * from ms_users;
select * from ms_authorities;
drop table ms_users;
drop table ms_authorities;
commit;
delete from ms_users where username = 'admin';
delete from ms_authorities where username = 'admin';
select * from ms_customer;
insert into ms_AUTHORITIES (username,AUTHORITY) values('a@a.a.a','ROLE_ADMIN');
insert into ms_AUTHORITIES (username,AUTHORITY) values('admin','ROLE_MANAGER');

delete from ms_users where username = 'a@a.a.a';
delete from ms_authorities where username = 'a@a.a.a';

delete from ms_authorities where username = 'a@a.a.a' and delete from ms_users where username = 'a@a.a.a';

commit;
rollback;

BEGIN
  DELETE FROM ms_authorities WHERE username = 'a@a.a.a';
  DELETE FROM ms_users WHERE username = 'a@a.a.a';
END;


SELECT count(*) FROM ms_board WHERE selecter = 1;
select count(*) from ms_board order by bid asc;


 SELECT * FROM (
	  SELECT ROWNUM AS RNUM, A.* FROM (
	    SELECT
	      *
	    FROM
	      ms_board
	    WHERE selecter = 1
	    ORDER BY BID desc, bGroup DESC, bStep ASC
	  ) A WHERE ROWNUM <= 2 * 12
	) WHERE RNUM > (2 - 1) * 12;
    
    
    
create table ms_product (
    product_code number(5) not null,
    product_category varchar2(1) not null,
    --product_number VARCHAR2(20) PRIMARY KEY,   -- 상품 번호
    product_name VARCHAR2(100),                -- 상품명
    price NUMBER,                              -- 가격
    stock_quantity NUMBER,                     -- 재고 수량
    options VARCHAR2(200),                     -- 옵션
    product_img VARCHAR2(200)                  -- 이미지
    
   -- CONSTRAINT unique_constraint_name UNIQUE (column1, column2)
);

ALTER TABLE ms_product add constraint uq_product_number unique(product_code, product_category);

insert into ms_product(product_code, product_category, product_name, price, stock_quantity, options, product_img) 
                values(929,'B' ,'팔찌9', 15500,10,'옵션','이미지주소');

insert into ms_product(product_code, product_category, product_name, price, stock_quantity, options, product_img) 
                values(930,'B' ,'반지9', 15500,10,'옵션','이미지주소');
                
commit;
                
                
select * from ms_product;

commit;

create table ms_cart(
    
    username varchar(50),
    product_img varchar2(200),
    product_name varchar2(100),
    price number,
    stock_quantity number,
    product_code number,
    options varchar2(200)
);

drop table ms_cart;

select * from ms_cart;

CREATE SEQUENCE ms_cart_seq
START WITH 1
INCREMENT BY 1;

select * from ms_board;

create table ms_cart2(
    number_of_order number,
    username varchar(50),
    product_img varchar2(200),
    product_name varchar2(100),
    price number,
    stock_quantity number,
    product_code number,
    options varchar2(200)
);

CREATE SEQUENCE pay_order_seq
  START WITH 20000000  -- 8자리 무작위 숫자의 시작 값
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
  
  commit;
  
  create table ms_cart(
    number_of_order number,
    username varchar(50),
    product_img varchar2(200),
    product_name varchar2(100),
    price number,
    stock_quantity number,
    product_code number,
    options varchar2(200)
);

CREATE SEQUENCE cart_order_seq
  START WITH 10000000  -- 8자리 무작위 숫자의 시작 값
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
  
  commit;