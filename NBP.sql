select * from nbp_board;

create table nbp_board (
nkid number(6) primary key,   -- �Խù� �ĺ���
nkanji varchar2(100) not null,  -- ���� title
nruby varchar2(500),  -- ��̰���
nsetsumei varchar2(500),  -- ����
ndifficulty number(5) default 0, -- ���̵�
ndate date default sysdate, -- �߰���
nselector number(1) not null -- ���� 한글
);

select * from nbp_save;

  create table nbp_save(
    number_of_save number,
    username varchar2(50),
    nkanji varchar2(100),
    nruby varchar2(500),
    nsetsumei varchar2(500), 
    ndifficulty number(5),
    ndate date default sysdate,
    nselector number(1),
    nkid number(6) not null,
    constraint fk_nbp_save_nbp_board foreign key(nkid) references nbp_board(nkid)
);


drop table nbp_board;

commit;

rollback;

INSERT INTO nbp_board VALUES('1','�ի���','�ժê�','�ի��Ȫϡ�����?9����ȪǪ��롣�����?��F�������18.9984���ϫ���ΪҪȪġ� �ު�������Ȫ�??�Ǫ���ի������⡢�����ܪ˫ի��Ȫ����Ъ�롣', '1', '11/12/30', '1');

update nbp_board set ndifficulty = ndifficulty + 1;

CREATE SEQUENCE nbp_board_seq
START WITH 1
INCREMENT BY 1;

create table nbp_user_board (
uid number(6) primary key,      -- �Խù� �ĺ���
uname varchar2(20) not null,    -- �ۼ��� �̸�
utitle varchar2(100) not null,  -- �Խù� ����
ucontent varchar2(500),         -- �Խù� ����
udate date default sysdate,     -- �Խù� �ۼ� ����
uhit number(4) default 0,       -- ��ȸ��
uselector number(1) not null --1:���� 2:�Ϲ� �Խ���
);

CREATE SEQUENCE nbp_user_board_seq
START WITH 1
INCREMENT BY 1;

create table nbp_users(
   username varchar2(50) not null primary key,
   password varchar2(100) not null,
   enabled char(1) DEFAULT '1',
    nname VARCHAR2(50) NOT NULL,        -- ȸ�� �̸�
    ngrade NUMBER(1)                   -- ȸ�� ���
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

