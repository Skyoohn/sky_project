select * from nbp_board;

create table nbp_board (
nkanji varchar2(100) not null,  -- ÇÑÀÚ title
nruby varchar2(500),  -- ¿ä¹Ì°¡³ª
nsetsumei varchar2(500),  -- ¼³¸í
ndifficulty number(5) default 0, -- ³­ÀÌµµ
ndate default sysdate, -- Ãß°¡ÀÏ
nselector number(1) not null -- Á¾·ù
);

drop table nbp_board;

commit;

rollback;

INSERT INTO nbp_board VALUES('«Õ«ÃáÈ','ªÕªÃª½','«Õ«ÃáÈªÏ¡¢ê«í­Ûã?9ªÎêªáÈªÇª¢ªë¡£êªáÈÑÀ?ªÏF¡£ê«í­ÕáªÏ18.9984¡£«Ï«í«²«óªÎªÒªÈªÄ¡£ ªŞª¿¡¢ÔÒêªáÈªÎ??ªÇª¢ªë«Õ«ÃáÈİÂí­ªâ¡¢ìéÚõîÜªË«Õ«ÃáÈªÈû¼ªĞªìªë¡£');

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
    cname VARCHAR2(50) NOT NULL,        -- È¸¿ø ÀÌ¸§
    cgrade NUMBER(1)                   -- È¸¿ø µî±Ş
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