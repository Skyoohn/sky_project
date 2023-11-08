desc mvc_board;
  
select * from mvc_board order by bgroup desc,bstep asc;

create table mvc_board(
    bid NUMBER(4) PRIMARY KEY,
    bname VARCHAR2(20),
    btitle VARCHAR2(100),
    bcontent VARCHAR2(300),
    bdate DATE DEFAULT SYSDATE,
    bhit NUMBER(4) DEFAULT 0,
    bgroup NUMBER(4),
    bstep NUMBER(4),
    bindent NUMBER(4)
);

commit;

--sequence 생성
create sequence mvc_board_seq;

--넣고싶은 만큼 행 삽입(삽입할때마다 commit도 함께 해줘야 함)
insert into mvc_board(bid, bname, btitle, bcontent, bhit, bgroup, bstep, bindent)
values (mvc_board_seq.nextval, 'abcd', 'is title', 'is content', 0, 
mvc_board_seq.currval, 0, 0);

select  *  from mvc_board;



SELECT * FROM EMP;
SELECT * FROM emp WHERE SAL = 5000;
select * from emp where deptno = 20;

select * from emp where sal != 3000; --개발자가 가장 많이 쓰는 표현
select * from emp where sal <> 3000; --DBA가 가장 많이 쓰는 표현
select * from emp where sal ^= 3000;

select * from emp where ename = 'SMITH'; -- 컬럼명은 대소문자 안가리고 데이터는 가림
select * from emp where job = 'PRESIDENT';
select * from emp where hiredate >= '82/01/01';
select * from emp where deptno = 10 and JOB = 'MANAGER'; --조건 2개
select * from emp where DEPTNO = 10 or job = 'MANAGER';
select * from emp where not deptno = 10; --10이 아닌


select * from emp where sal >= 2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000; -- 많이 쓰는 스타일

select * from emp where sal < 2000 or sal > 3000; 
select * from emp where sal not between 2000 and 3000; 

select * from emp where hiredate >= '82/01/01';
select * from emp where hiredate between '82/01/01' and '82/12/31';

select * from emp where comm = 300 or comm = 500 or comm = 1400;
select * from emp where comm in (300,500,1400); -- in이 or, 갯수 상관x

select * from emp where comm not in (300,500,1400);


-- 7/10


select * from emp where ename like 'F%'; --F로 시작하는 사람 찾기

select * from emp where ename like '%A%'; --앞뒤 상관없이 A가 들어간 사람

select * from emp where ename like '%N'; --이름이 N으로 끝나는 사람

select * from emp where ename like '_A%'; -- 이름의 두번째 글자가 A인 사람

select * from emp where ename like '__A%'; -- 이름의 세번째 글자가 A인 사람

select * from emp where ename not like '%A%'; --이름에 A가 안들어간 사람

select * from emp where comm is null; -- comm이 null 인 사람

select * from emp where comm is not null;

select * from emp  order by  sal asc; -- 오름차순

select * from emp  order by  sal desc; --내림차순

select * from emp  order by  hiredate desc; --가장 최근 입사 사원

select * from emp  order by ename asc; -- 이름 사전순

select * from emp where sal >= 3000 order by ename asc; -- 월급 3000 이상 이름 사전순

select DISTINCT deptno from emp; -- 중복 제거해서 부서번호 출력

select  sal * 12 as 샐러리 from emp; -- 컬럼에 연산 가능, as 로 별칭(앨리어스) 주기 가능

select ename || ' is a ' || job "연결정의 예" from emp; -- ||로 문자열을 추가 연결시킴 별칭은 " "로, as 생략 가능 

desc dept;   -- 컬럼의 유형 확인

select 24 * 26 from dual;

select sysdate from dual;    -- 현재 날짜

select abs(-10) from dual; -- abs가 절대값 구하는 용어

-- 소수점 아래를 버리는 함수
SELECT 34.5432, FLOOR(34.5432) FROM DUAL;

select 34.5678, round(34.5678,2) from dual;    -- 소수점 2 자리부터 반올림, 안쓰면 0과 같음

select mod(27, 2), mod(27, 5), mod(27, 7) from dual;  -- 나누고 난 후의 나머지 (자바의 %)

select 'oracle', upper('oracle') from dual; -- upper 대문자

select lower ('ORACLE') from dual;

select lower(ename) from emp; -- ename 만 소문자로 출력

select initcap('oracle') from dual; -- 첫글자만 대문자

select initcap(ename) from emp; -- ename 안에서 첫글자만 대문자

select length(ename), ename from emp;   -- 문자 길이 뽑기

select SUBSTR('oracle',0,1) from dual;    

select SUBSTR(ename,0,1) from emp;    -- 맨 앞글자

select SUBSTR('Smith',2,2) from dual; -- 2,3번째 글자

select substr(ename,2,2) from emp; -- 2,3번째 글자

select * from emp;

SELECT ENAME, 19||SUBSTR(HIREDATE, 1, 2)년도, SUBSTR(HIREDATE, 4, 2)달 FROM EMP; 

SELECT ENAME, 19||SUBSTR(HIREDATE, 1, 2)년도, SUBSTR(HIREDATE, 4, 2)달 
FROM EMP
where substr(hiredate,4,2) = '09';   -- 9월 입사자 꺼내기   (달 = 09 가 안되는 이유는 where가 먼저 실행되기 때문)

select ltrim('          oracle') from dual;   -- 공백 제거 (왼쪽)

select trim('          oracle                       ') from dual;

select sysdate -1 from dual;  -- 어제 날짜

select SYSDATE +1 from dual; -- 내일

select ename, sysdate, hiredate, floor(months_between(sysdate,hiredate)) 근무개월수 from emp;  --소수점 제거

select ename, hiredate, add_months(hiredate, 4) from emp;  -- 입사 날짜에서 4개월 추가

select sysdate, next_day(sysdate,'금요일') from dual;    -- 오늘 기준 가장 가까운 다음 수요일 (OS 언어 기준으로 문자 인식)

select hiredate, last_day(hiredate) from emp;    -- 입사한 달의 마지막날
 
select sysdate, to_char (sysdate, 'yyyy-mm-dd') from dual;  -- 현재 날짜를 문자형으로 변환하여 출력

select hiredate, to_char(hiredate,'yyyy/mm/dd day') as 입사일 from emp;   -- 입사일 출력, 요일과 함께 (day는 요일)

select to_char(sysdate, 'yyyy/mm/dd, hh24:mi:ss') from dual;



desc emp; 

select ename, sal, to_char(sal, 'l99,999') as 통화 from emp; -- 각 지역별 통화기호를 앞에 붙이고 천단위마다 콤마를 붙여서 출력

select ename, hiredate from emp where hiredate = '1981-02-20';      -- 날짜형은 ' ' 로 변환      to_char('1981/02/20') 도 가능 (숫자형을 다이렉트로 집어넣으면 안된다는게 중요)
select ename, hiredate from emp where hiredate = to_date(19810220,'yyyymmdd');    -- 위와 동일한

select sysdate - to_date ('2016/01/01','yyyy/mm/dd') from dual;

select to_number('20,000', '99,999') - to_number('10,000', '99,999') from dual;   -- 문자를 숫자로 바꿈

select ename, sal, sal * 12 + nvl(comm,0) comm from emp;    -- null을 0으로 바꿔라(null value) 연봉계산할때

select ename, sal, sal * 12 + nvl(comm,0) 연봉, nvl(comm,0) from emp; 

select deptno from emp order by deptno;

select deptno, decode(deptno,10,'a',20,'b',30,'c') from emp order by deptno;    -- decode 함수 (정수, string만 가능)
select ename, deptno, decode (deptno,10,'accounting',20,'research',30,'sales') as dname from emp order by deptno;   -- 응용

select ename, deptno,    -- if문과 유사
       case when deptno = 10 then 'accounting'
                when deptno = 20 then 'research'
                when deptno = 30 then 'sales'
                when deptno = 40 then 'operations'
      end as ENAMEs
from emp;

select ename, sal,
    case when sal > 2500 then '수'
              when sal < 2500 then '가'
    end as 등급
    from emp;
    
select deptno, sal, round(sal, -3) from emp;     -- -3이면 0에서 +3자리 반올림, 단일행 함수 (각각의 행마다 적용)

select  sum(sal) from emp;   -- 그룹함수로 사원의 총 급여 확인 select * , 이 안되는 이유는 12개 전체를 다 뿌려야 하기 때문 (그룹함수는 1개만 뿌림, 산출되는 로우수가 다르다)

select avg (sal) from emp;  -- 평균

select max(sal) from emp;  -- 최대값
select min(sal) from emp;  -- 최소값

select count (*) from emp;  -- 총 사원수

select * from emp;

select count(DISTINCT  job) from emp;     -- DISTINCT 중복제거로 job 갯수 계산 (로우 갯수 계산)

select deptno from emp group by deptno;   -- 특정 컬럼 기준으로 그룹화 (중복 제거)

--select ename from emp group by deptno; -- 그룹으로 묶었는데 이름을 뿌릴수 없기 때문에 실행안됨

select deptno, avg(sal) from emp group by deptno;   -- 1. 컬럼은 group by 한 컬럼 명이 올 수 있다. 2. 집합 함수가 올 수 있다.(단일함수 X) (그룹 10,20,30 만들고 sal 넣는것)

select deptno, sum(sal) from emp group by deptno;

select deptno, max(sal), min(sal) from emp group by deptno;  -- 최대와 최소

select deptno, count(*)  from emp group by deptno;  --부서별 사원수

select count (job) from emp group by job;  --직함별 사원수

select * from emp;

select deptno, avg(sal) from emp group by deptno having avg(sal) >= 2000;    -- 그룹별 평균봉급

select deptno, max(sal), min(sal) from emp group by deptno having max(sal) >= 2900;    -- 부서의 최대값과 최소값을 구하되, 최대 급여가 2900 이상인 부서만 출력


-- 7/11


 select * from emp, dept;    -- join은 기본적으로 카테이션 곱  (emp 기준: 4개로 모든 요소를 곱함)
 
 select * from emp, dept where emp.deptno = dept.deptno;    -- 사원의 정보 출력시, 각 사원이 소속된 부서의 상세정보를 출력하기 위해 두개의 테이블을 조인 (dept정보로 emp와 dept가 같은것만 표시)
 
select ename, dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';     -- smith인 사람의 부서명 출력

select ename, dname from emp e, dept d where e.deptno = d.deptno and e.ename = 'SMITH';    -- 별칭 주기 가능


select * from salgrade;   -- 급여 등급

select * from emp, salgrade where sal between losal and hisal order by ename;   -- 각 사원의 급여가 몇등급인지 살펴보는 쿼리문 // 외워야 함

select * from emp, salgrade,dept                -- + 사원의 부서명
where dept.deptno = emp.deptno and sal between losal and hisal 
order by ename;

SELECT E.ENAME||'의 매니저는 '|| M.ENAME||'입니다.' FROM EMP E, EMP M WHERE E.MGR = M.EMPNO;   -- 매니저 구하기


-- anci 조인 (등가조인)

select * from emp, dept where emp.deptno = dept.deptno;
-- = 위 아래 동일
select * from emp inner join dept on emp.deptno = dept.deptno;


-- (outer join)

select * from dept left outer join emp on emp. deptno = dept.deptno;   -- 교집합에다 dept (left)에 들어있는게 포함되어있다
select * from emp left outer join dept on emp. deptno = dept.deptno;   --

select * from dept, emp where emp.deptno(+) = dept.deptno;  --  (+)는 emp에 dept에 있는것 하나 더 추가


-- 유니온

--select a.job, b.deptno
--from (select job, deptno from emp where sal >= 3000)  a, (select job, deptno from emp where deptno = 10) b;   -- 안해도됨

select job, deptno from emp where sal >= 3000
union all
select job, deptno from emp where deptno = 10;    -- 합집합 (union은 중복불가) (union all은 중복 허용)


-- 서브쿼리

select deptno from emp where ename = 'SMITH';
select dname from dept where deptno = 20;

--join 사용
select dname from emp, dept where emp.deptno = dept.deptno and emp.ename = 'SMITH';

-- 서브쿼리
select dname from dept           -- 하나의 select 문장 내에 포함된 또 하나의 select 문장이 있는 쿼리문
where deptno = (select deptno from emp where ename = 'SMITH');           -- 비교 연산자의 오른쪽에 기술, 반드시 괄호 안에 넣어야 한다.

select * from emp;

select * from emp
where sal > (select avg (sal) from emp);  -- 평균 급여보다 많이 받는 사원

select * from emp
where sal > (select sal from emp where ename = 'SMITH');    -- 스미스보다 많이 받는 사원 목록


---

desc emp;



-- 7/12

--다중행 서브쿼리 - 다중행 연산자와 함께 사용

-- 연봉을 3000이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의 정보를 출력하는 쿼리문
select ename, sal, deptno
from emp
where deptno in (
select distinct deptno 
from emp 
where sal >= 3000
);

--부서 번호가 30번인 사원들의 급여 중 가장 낮은 값(800)보다 높은 급여를 받는 사원의 이름, 급여를 출력하는 쿼리문
--select ename, sal, deptno
--from emp
--where deptno in (select deptno from emp where sal > 800 and deptno = 30);

select *
from emp
where deptno = 30 and sal > (select min(sal) from emp);

-- any (or)
select ename, sal
from emp
where sal > any (select sal from emp where deptno = 30);

select *
from emp
where sal = any(1000,2000,3000);    -- 만족하는 값이 하나라도 있으면 결과를 리턴, =일때는 in과 동일

select *
from emp
where sal > any(1000,2000,3000);    --1000보다 크거나 2000보다 크거나 3000보다 크면, min(1000)과 같음

select *
from emp
where sal >= any(1000,2000,3000);    -- >= 1000

select *
from emp
where sal < any(1000,2000,3000) order by sal;    -- max(3000)

-- all

select *
from emp
where sal > all (select sal from emp where deptno = 30);   -- 30번 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사람의 이름과 급여를 출력하는 쿼리문
select ename, sal
from emp
where sal > (select max(sal) from emp where deptno = 30);

select *
from emp
where sal = all(1000,2000,3000);    -- 모든 값을 만족해야 함, and연산 (sal이 1000,2000,3000)

select *
from emp
where sal> all(1000,2000,3000);   -- 제일 큰값(3000)보다 큰것
select * from emp where sal >1000 and sal >2000 and sal>3000;


select *
from emp
where sal< all(1000,2000,3000); -- 제일 작은값(1000)보다 큰것


--sql 50제

select * from dept;

select job,deptno,ename,hiredate
from emp;

SELECT DISTINCT JOB
FROM EMP;
select job
from emp group by job;

select *
from emp where sal >=2850;

select ename,deptno
from emp
where empno = 7566;

select ename, sal   -- 외워야함
from emp
where sal not between 1500 and 2850;

select ename, job, hiredate
from emp
where hiredate between '1981/02/20' and '1981/05/01'  order by hiredate asc;

-- DDL (테이블 구조를 정의하는 create table)

create table EMP01(
    empno number(4),
    ename varchar2(20),
    sal number(7,2)
);   -- table 생성

desc emp01;

create table emp02 as select * from emp;   -- data 전체 복사

desc emp02;

select * from emp02;

create table emp03 as select empno,ename from emp;   -- empno,ename만 복사

select * from emp03;

--ALTER TABLE (기존 테이블의 구조변경)

alter table emp01 add (job varchar2(9)); --내용 추가
desc emp01;
alter table emp01 modify (job varchar2(30)); -- 개수 변경

alter table emp01 drop column job;  --삭제

--DROP TABLE

drop table emp01;

--테이블 삭제와 무결성 제약 조건

--Truncate table

select * from emp02;

truncate table emp02;

--테이블명 변경
rename emp02 to test;
desc test;
rename test to emp02;
desc emp02;


--시스템 데이터 딕셔너리

desc user_tables;
select * from user_tables;

select table_name from user_tables;

desc all_tables;
select * from all_tables;


-- 테이블의 내용을 추가, 수정, 삭제하는 DML
-- CRUD

create table dept02 as select * from dept;

select * from dept02;
TRUNCATE table dept02;

--insert
insert into dept02(deptno,dname,loc) values (10,'ACCOUNTING','NEW YORK');
insert into dept02(deptno,dname,loc) values (20,'RESEARCH','DALLAS');
commit;  --영구저장

CREATE TABLE DEPT03 AS SELECT * FROM DEPT WHERE 1=0;   -- 논리적으로 설명 불가 (false 라서 안나온다) 아무것도 보여주지 않고 구조만 복사함

select * from dept03;

drop table emp01;
create table emp01 as select * from emp;

select * from emp01;
update emp01 set deptno = 30;   --모든 사원의 부서 번호를 30번으로 수정

update emp01 set sal = sal * 1.1;  - 봉급 10% 인상
commit;

update emp01 set hiredate = sysdate;  --모든 사원의 입사일을 오늘로 수정

update emp01 set deptno = 40 where deptno = 10;     -- 10번 사원을 40번으로 수정

update emp01 set sal = sal * 1.1 where job = 'MANAGER';   -- 매니저 봉급 10% 인상
update emp01 set hiredate = sysdate where ename = 'MILLER'; - 밀러만 오늘날짜로

update emp01 set hiredate = sysdate where substr(hiredate, 1, 2) = '82';
update emp01 set hiredate = sysdate where hiredate between '82/01/01' and '82/12/31'; -- 82년 입사자 오늘날짜로

update emp01 set deptno=20, job='MANAGER' where ename = 'SMITH';

update emp01 set hiredate = sysdate, sal = 50, comm = 4000 where ename = 'SMITH';  -- 스미스 sal 50, comm 4000, 입사일 오늘

DROP TABLE DEPT01;
CREATE TABLE DEPT01 AS SELECT * FROM DEPT;
select * from dept01;

update dept01 set  loc = (select loc from dept01 where deptno=40) where deptno = 20;  -- 20번 지역명을 40번으로

--delete

delete from dept01;
commit;
rollback;

delete from dept01 where deptno = 30;   -- 30번 부서 삭제후 부서 테이블 확인

select * from emp01;
select * from dept01;

DELETE FROM EMP01 
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');   -- 서브 쿼리문으로 부서명이 SALES인 부서의 번호부터 알아낸 뒤 SALES 부서 소속의 사원을 삭제하는 쿼리문


--- 트랜젝션 관리

DROP TABLE DEPT01;
CREATE TABLE DEPT01 AS SELECT * FROM DEPT;
select * from dept01;

delete from dept01;

rollback;

delete from dept01 where deptno = 20;
commit;

-- not null

--null 못들어가게 함
DROP TABLE EMP02;
CREATE TABLE EMP02(
    EMPNO NUMBER(4) NOT NULL, 
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);

desc emp02;
INSERT INTO EMP02 (EMPNO, ENAME, JOB, DEPTNO) VALUES (1, '홍길동','SALESMAN', 20);
INSERT INTO EMP02 (EMPNO, ENAME, JOB, DEPTNO) VALUES (1, '홍길동',null, null);
INSERT INTO EMP02 (EMPNO, ENAME) values (1, '홍길동');

select * from emp02;


-- unique는 중복 허용X
DROP TABLE EMP03;
CREATE TABLE EMP03(
    EMPNO NUMBER(4) primary key,   -- unique not null 합친것
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);

INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (1, '홍길동',null, null);
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (2, '홍길동',null, null);
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (2, '홍길손',null, null);
INSERT INTO EMP03 (EMPNO, ENAME, JOB, DEPTNO) VALUES (null, '홍길손',null, null);

select * from emp03;

DROP TABLE EMP05;
CREATE TABLE EMP05(
EMPNO NUMBER(4) CONSTRAINT EMP05_EMPNO_PK PRIMARY KEY, 
ENAMR VARCHAR2(10) CONSTRAINT EMP05_ENAME_NN NOT NULL, 
JOB VARCHAR(9), DEPTNO NUMBER(2));


DROP TABLE EMP06;


--7/13

--foreign

CREATE TABLE EMP06(
EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,     -- 에러가 뜰때 EMP06_EMPNO_PK 가 뜬다 (없어도 됨)
ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL, 
JOB VARCHAR(9), 
DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO));   -- REFERENCES가 foreign키 만듦

select * from emp06;

insert into emp06 values(7499,'ALLEN','SALESMAN',30);

insert into emp06 values(7800,'홍길동','SALESMAN',50);   -- 부모에 50번이 없어서 못만든다


--check (잘안씀)

create table student(
    id number(4) primary key,
    score number(3) not null,    
    constraint SCORE_CHECK check (score >= 0)
    );
    
insert into student values(1,100);
insert into student values(2,-20);
      
select * from student;

--시퀀스

drop sequence EMP_SEQ;
CREATE SEQUENCE EMP_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 100000;          -- start with 1가 1개씩

DROP TABLE EMP01;

CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY, 
    ENAME VARCHAR(10), 
    HIREDATE DATE
);

insert into emp01 values(
EMP_SEQ.NEXTVAL,'홍길동',SYSDATE);    

select * from emp01;

select EMP_SEQ.currval from dual;
select EMP_SEQ.nextval from dual;

alter sequence EMP_SEQ increment by 2;         -- 2씩 증가 하도록 변경

--50제

select * from emp;

--8> 10번 및 30번 부서에 속하는 모든 사원의 이름과 부서 번호를 출력하되, 이름을 알파벳순으로 정렬하여 출력하라.
select deptno, ename 
from emp 
WHERE DEPTNO IN(10,30)
ORDER BY ENAME;

-- 9> 10번 및 30번 부서에 속하는 모든 사원 중 급여가 1500을 넘는 사원의 이름 및 급여를 출력하라.
-- (단 컬럼명을 각각 employee 및 Monthly Salary로 지정하시오)

--띄어쓰기 있으면 " "
SELECT ENAME AS "Employee", SAL AS "Monthly Salary"
FROM EMP
WHERE DEPTNO IN(10,30) AND SAL>1500;

select * from emp;

--10> 관리자가 없는 모든 사원의 이름 및 직위를 출력하라.
select ename, job 
from emp 
where mgr is null;

--11> 커미션을 받는 모든 사원의 이름, 급여 및 커미션을 출력하되, 급여를 기준으로 내림차순으로 정렬하여 출력하라.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY SAL DESC;

--12> 이름의 세 번째 문자가 A인 모든 사원의 이름을 출력하라.
select * from emp where ename like '__A%';

--13> 이름에 L이 두 번 들어가며 부서 30에 속해있는 사원의 이름을 출력하라.
select ename from emp where ename like '%L%L%' and deptno = 30;

--14> 직업이 Clerk 또는 Analyst 이면서 급여가 1000,3000,5000 이 아닌 모든 사원의 이름, 직업 및 급여를 출력하라.
select job, ename, sal
from emp 
where job in ('CLERK', 'ANALYST') and sal not in(1000,3000,5000);

--15> 사원번호, 이름, 급여 그리고 15%인상된 급여를 정수로 표시하되 컬럼명을 New Salary로 지정하여 출력하라.
SELECT EMPNO, ENAME, SAL,
ROUND(SAL+(SAL*0.15),0) AS "New Salary"
FROM EMP;

--16> 15번 문제와 동일한 데이타에서 급여 인상분(새 급여에서 이전 급여를 뺀 값)을 추가해서 출력하라.(컬럼명은 Increase로 하라).
SELECT EMPNO, ENAME, SAL, ROUND(SAL+(SAL*0.15) ) AS "New Salary",
(ROUND(SAL+(SAL*0.15)))-SAL AS "Increase"
FROM EMP;

--18> 모든 사원의 이름(첫 글자는 대문자로, 나머지 글자는 소문자로 표시) 및 이름 길이를 표시하는 쿼리를 작성하고 컬럼 별칭은 적당히 넣어서 출력하라.
SELECT UPPER(SUBSTR(ENAME,1,1)) || LOWER(SUBSTR(ENAME,2,12)) AS "NAME",    -- ||는 그냥 +
LENGTH(ENAME) AS "LENENAME"
FROM EMP;

select initcap (ename) as "ename",
length (ename) as "lenename"
from emp;

--19> 사원의 이름과 커미션을 출력하되, 커미션이 책정되지 않은 사원의 커미션은 'no commission'으로 출력하라.
SELECT ENAME, NVL(TO_CHAR(COMM),'no commission')
FROM EMP;

--20> 모든 사원의 이름,부서번호,부서이름을 표시하는 질의를 작성하라.(DECODE)
SELECT empno, deptno , DECODE(deptno,10,'ACCOUNTING' ,
20,'RESEARCH',
30,'SALES',
40,'OPERATIONS') AS "dname"
FROM EMP;

--먼저 이거부터 쓰고 생각
select *
from emp e, dept d
where e.deptno=d.deptno; 

--21> 30번 부서에 속한 사원의 이름과 부서번호 그리고 부서이름을 출력하라.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO=30;

--22> 30번 부서에 속한 사원들의 모든 직업과 부서위치를 출력하라.
SELECT DISTINCT E.JOB, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND D.DEPTNO=30;

--23> 커미션이 책정되어 있는 모든 사원의 이름, 부서이름 및 위치를 출력하라.
select e.ename, e.deptno, d.loc
from emp e, dept d
where e.deptno=d.deptno and e.comm is not null;

--24> 이름에 A가 들어가는 모든 사원의 이름과 부서 이름을 출력하라.
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.ENAME LIKE '%A%';

--25> Dallas에서 근무하는 모든 사원의 이름, 직업, 부서번호 및 부서이름을 출력하라.
select e.ename, e.job, e.deptno, d.dname
from emp e, dept d
where e.deptno=d.deptno and d.loc = 'DALLAS';

select * from emp;

--26> 사원 이름 및 사원번호, 해당 관리자 이름 및 관리자 번호를 출력하되, 각 칼럼명을 EMPLOYEE,EMP#,MGR#,MANAGER으로 표시하여 출력하라.
select e.ename as employee, e.empno as emp#, e.mgr as mgr#, m.ename as manager
from emp e, emp m    -- self join
where E.MGR = M.EMPNO;

--27>모든 사원의 이름,직업,부서이름,급여 및 등급을 출력하라.
SELECT E.ENAME, E.JOB, D.DNAME, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL;


CREATE TABLE users (
	"ID"	varchar2(50)		NULL,
	"email"	varchar(100)		NOT NULL
);

CREATE TABLE "users" (
	"ID"	varchar2(50)		NULL,
	"email"	varchar(100)		NOT NULL,
	"Key"	number		NOT NULL
);

CREATE TABLE "images" (
	"Key"	number		NOT NULL,
	"Field"	varchar2(200)		NOT NULL
);

ALTER TABLE "images" ADD CONSTRAINT "PK_IMAGES" PRIMARY KEY (
	"Key"
);



--7/17

--rownum (오라클의 페이징)
--select 해온 데이터에 일련번호 붙이기 = 1번부터 붙이기

select rownum, emp.*  from emp where rownum  <= 10;

--select rownum, emp.*  from emp where rownum between 5 and 10;  -- 가 안되는 이유는 rownum이 1부터 시작되기 때문

select *
from (select rownum as rn, emp.* from emp)
where rn between 5 and 10; -- 1을 먼저 뽑아야 하기 때문

--28> smith보다 늦게 입사한 사원의 이름 및 입사일을 출력하라. 

select ename, hiredate
from emp
where hiredate > (select hiredate from emp where ename = 'SMITH');  --늦게 입사한 사원은 숫자가 더 크다

--29> 자신의 관리자보다 먼저 입사한 모든 사원의 이름, 입사일,
--관리자의 이름, 관리자의 입사일을 출력하되 각각 컬럼명을
--Employee,EmpHiredate, Manager,MgrHiredate로 표시하여 출력하라.

SELECT E.ENAME AS "Employee", E.HIREDATE AS "EmpHIredate",
M.ENAME AS "Manager",
M.HIREDATE AS "MgrHiredate"
FROM EMP E, EMP M
WHERE E.MGR=M.EMPNO AND E.HIREDATE<M.HIREDATE;

--7/18

--30> 모든 사원의 급여 최고액, 최저액, 총액 및 평균액을 출력하되
--각 칼럼명을 maximum, minimum, sum, average 로 지정하여 출력하라.
select max(sal) maximum, min(sal) minimum, sum(sal) sum, avg(sal) average
from emp;

--31> 각 직업별로 급여 최저액, 최고액, 총액, 및 평균액을 출력하라. (group by와 select는 같이 있어야 한다)
select job, max(sal) maximum, min(sal) minimum, sum(sal) sum, avg(sal) average
from emp 
group by job;

--32> 직업이 동일한 사람 수를 직업과 같이 출력하라.
select job, count(job)
from emp
group by job;

--33>관리자의 수를 출력하되, 관리자 번호가 중복되지 않게하라. 그리고,
--칼럼명을 number of manager로 지정하여 출력하라.
select count(distinct(mgr)) as "number of manager"
from emp;



--34> 최고 급여와 최저 급여의 차액을 출력하라.
select max(sal) - min(sal)
from emp;

--35> 관리자 번호 및 해당 관리자에 속한 사원들의 최저 급여를 출력하라.
--단, 관리자가 없는 사원 및 최저 급여가 1000 미만인 그룹은 제외시키고 급여를 기준으로
--출력 결과를 내림차순으로 정렬하라.

select mgr, min(sal)
from emp
where mgr is not null 
group by mgr 
having min(sal) >= 1000 order by min(sal);

--7/19

--36> 부서별로 부서이름, 부서위치, 사원 수 및 평균 급여를 출력하라.
--그리고 각각의 컬럼명을 부서명,위치,사원의 수,평균급여로 표시하라.
select e.deptno "부서명",d.dname "부서이름",count(e.empno) "사원의 수",avg(sal) "평균급여",d.loc "위치"
from emp e, dept d
where E.DEPTNO=D.DEPTNO
group by e.deptno, d.dname, d.loc;


--37> smith와 동일한 부서에 속한 사원의 이름 및 입사일을 출력하라.
select ename, hiredate
from emp
where deptno in(select deptno from emp where ename = 'SMITH')
and ename != 'SMITH';


--38> 자신의 급여가 평균 급여보다 많은 모든 사원의 사원번호, 이름, 급여를
--표시하는 질의를 작성하고 급여를 기준으로 결과를 내림 차순으로 정렬하라.
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
order by sal desc;

select empno, ename, sal, (select avg(sal) from emp) as "평균" 
from emp 
where sal > (select avg(sal) from emp) order by sal desc;

SELECT e.EMPNO, e.ENAME, e.SAL, d.avgsal as "평균"
FROM EMP e, (SELECT AVG(SAL) as avgsal FROM EMP) d
WHERE e.SAL >(SELECT AVG(SAL)FROM EMP)
ORDER BY e.SAL DESC;

select * from emp;
select * from dept;

--39> 이름에 T가 들어가는 사원이 속한 부서에서 근무하는 모든 사원의 사원번호 및 이름을 출력하라.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
FROM EMP
WHERE ENAME LIKE '%T%');


select * from mvc_board;



begin
  for i in 1..1000 loop
   insert into mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent) 
   values (mvc_board_seq.nextval, 'test' , '테스트', '테스트', 0, mvc_board_seq.currval, 0, 0);
  end loop;
commit;
end;


commit;

select * from mvc_board where bid >= 1 and bid <= 10;
--rownum : 조회후 순번을 매길때 사용

select rownum, a.* from emp a;

select rownum rn, m.* from mvc_board m where rownum <=10;


select rownum rn, m.* from mvc_board m where rownum >0 and rownum <= 20;


        SELECT * FROM (
              SELECT ROWNUM AS RNUM, A.* FROM (
                       SELECT
                             *
                         FROM
                             mvc_board 
                         order by bGroup desc, bStep asc   
             ) A WHERE ROWNUM <= 20
         ) WHERE RNUM > 10;
         ;
         

rollback;


create table users(
	username varchar2(50) not null primary key,
	password varchar2(100) not null,
	enabled char(1) DEFAULT '1'
);

create table authorities (
	username varchar2(50) not null,
	authority varchar2(50) not null,
	constraint fk_authorities_users foreign key(username) references users(username)
);


create unique index ix_auth_username on authorities (username,authority);

commit;

insert into users (username,password) values('user','user');
insert into users (username,password) values('member','member');
insert into users (username,password) values('admin','admin');

commit;

insert into AUTHORITIES (username,AUTHORITY) values('user','ROLE_USER');
insert into AUTHORITIES (username,AUTHORITY) values('member','ROLE_MANAGER');
insert into AUTHORITIES (username,AUTHORITY) values('admin','ROLE_MANAGER');
insert into AUTHORITIES (username,AUTHORITY) values('admin','ROLE_ADMIN');


commit;


select * from AUTHORITIES, users where users.username = AUTHORITIES.username;

desc AUTHORITIES;

desc users;

select * from users;





--게시판 제작중


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
bindent number(4)
);

select * from ms_board;

INSERT INTO ms_board VALUES('1','1','P1','1','11/12/30','1','1','1','1');

commit;

rollback;

create table ms_notice_board (
    bid number(6) primary key,      --게시물 식별자
    bname varchar2(20) not null,    --작성자 이름
    btitle varchar2(100) not null,  --게시물 제목
    bcontent varchar2(500),         --게시물 내용
    bdate date default sysdate,     --게시물 작성 일자
    bhit number(4) default 0,       --조회수
    bgroup number(4),
    bstep number(4),
    bindent number(4)
);

select * from ms_notice_board;


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
  qindent number(4)
);

drop table ms_review_board;

select * from ms_qna_board;

create table ms_review_board (
  rid number(6) primary key,        -- 게시물 식별자
  rname varchar2(20) not null,      -- 작성자 이름
  rtitle varchar2(100) not null,    -- 게시물 제목
  rcontent varchar2(500),           -- 게시물 내용
  rdate date default sysdate,       -- 게시물 작성 일자
  rgroup number(4),
  rstep number(4),
  rindent number(4)
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

select * from ms_notice_board1;

INSERT INTO ms_notice_board1 VALUES('1','1','P1','1','11/12/30','1','1','1');

CREATE SEQUENCE ms_notice_board_seq
START WITH 1
INCREMENT BY 1;


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
select * from ms_board;

INSERT INTO ms_board VALUES('1','1','P1','1','11/12/30','1','1','1','1','1');

commit;

rollback;


drop table ms_notice_board;

select * from ms_notice_board;

commit;

CREATE SEQUENCE ms_board_seq
START WITH 1
INCREMENT BY 1;

select * from ms_board where selecter = 1;


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
insert into ms_AUTHORITIES (username,AUTHORITY) values('admin','ROLE_ADMIN');
insert into ms_AUTHORITIES (username,AUTHORITY) values('admin','ROLE_MANAGER');

select * from ms_board where selecter = 1 order by bGroup desc, bStep asc;

select * from mvc_board;

CREATE SEQUENCE mvc_board_seq
START WITH 1
INCREMENT BY 1;

commit;

BEGIN
  DELETE FROM ms_authorities WHERE username = 'a@a.a.a';
  DELETE FROM ms_users WHERE username = 'a@a.a.a';
END;

SELECT count(*) FROM ms_board WHERE selecter = 1;

rollback;
