select * from nbp_board;

create table nbp_board (
nkid number(6) primary key,   -- °Ô½Ã¹° ½Äº°ÀÚ
nkanji varchar2(100) not null,  -- ÇÑÀÚ title
nruby varchar2(500),  -- ¿ä¹Ì°¡³ª
nsetsumei varchar2(500),  -- ¼³¸í
ndifficulty number(5) default 0, -- ³­ÀÌµµ
ndate date default sysdate, -- Ãß°¡ÀÏ
nselector number(1) not null -- Á¾·ù
);

  create table nbp_save(
    number_of_save number,
    username varchar(50),
    nkanji varchar2(100),
    nruby varchar2(500),
    nsetsumei varchar2(500), 
    ndifficulty number(5),
    ndate date default sysdate,
    nselector number(1),
    constraint fk_saves foreign key(nkid) references nbp_board(nkid)
);

drop table nbp_board;

commit;

rollback;

INSERT INTO nbp_board VALUES('1','«Õ«ÃáÈ','ªÕªÃª½','«Õ«ÃáÈªÏ¡¢ê«í­Ûã?9ªÎêªáÈªÇª¢ªë¡£êªáÈÑÀ?ªÏF¡£ê«í­ÕáªÏ18.9984¡£«Ï«í«²«óªÎªÒªÈªÄ¡£ ªŞª¿¡¢ÔÒêªáÈªÎ??ªÇª¢ªë«Õ«ÃáÈİÂí­ªâ¡¢ìéÚõîÜªË«Õ«ÃáÈªÈû¼ªĞªìªë¡£', '1', '11/12/30', '1');

update nbp_board set ndifficulty = ndifficulty + 1;

CREATE SEQUENCE nbp_board_seq
START WITH 1
INCREMENT BY 1;

create table nbp_user_board (
uid number(6) primary key,      -- °Ô½Ã¹° ½Äº°ÀÚ
uname varchar2(20) not null,    -- ÀÛ¼ºÀÚ ÀÌ¸§
utitle varchar2(100) not null,  -- °Ô½Ã¹° Á¦¸ñ
ucontent varchar2(500),         -- °Ô½Ã¹° ³»¿ë
udate date default sysdate,     -- °Ô½Ã¹° ÀÛ¼º ÀÏÀÚ
uhit number(4) default 0,       -- Á¶È¸¼ö
uselector number(1) not null --1:°øÁö 2:ÀÏ¹İ °Ô½ÃÆÇ
);

CREATE SEQUENCE nbp_user_board_seq
START WITH 1
INCREMENT BY 1;

create table nbp_users(
   username varchar2(50) not null primary key,
   password varchar2(100) not null,
   enabled char(1) DEFAULT '1',
    nname VARCHAR2(50) NOT NULL,        -- È¸¿ø ÀÌ¸§
    ngrade NUMBER(1)                   -- È¸¿ø µî±Ş
);

drop table nbp_users;
drop table nbp_authorities;

commit;

select * from nbp_users;
select * from nbp_authorities;

insert into nbp_users (username,password,nname,ngrade) values('a@a.a.a','password','aa','1');

insert into nbp_authorities (username,AUTHORITY) values('a@a.a.a','ROLE_ADMIN');

create table nbp_authorities (
   username varchar2(50) not null,
   authority varchar2(50) not null,
   constraint fk_nbp_authorities_nbp_users foreign key(username) references nbp_users(username)
);

create unique index ix_nbp_auth_nbp_username on nbp_authorities (username,authority);

select * from nbp_users;
select * from nbp_authorities;

commit;

