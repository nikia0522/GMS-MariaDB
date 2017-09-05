
SELECT * FROM Board;
SELECT * FROM Grade;
SELECT * FROM Major;
SELECT * FROM Member;
SELECT * FROM Prof;
SELECT * FROM Subject;
SELECT * FROM Student;


-- *******************
-- CREATE 순서
-- 2017.09.04
-- [1] member_tab
-- [2] board_tab
-- [3] prof_tab
-- [4] subject_tab
-- [5] grade_tab
-- [6] major_tab
-- *******************


-- *******************
-- [1] MEMBER TABLE
-- 2017.08.02
-- 회원관리 테이블
-- member_id, name, password, ssn, regdate, major_id, phone, email, profile
-- *******************

-- DDL
CREATE TABLE 
	Member
(
	member_id VARCHAR(10), 
	name VARCHAR(10),
	password VARCHAR(10),
	ssn VARCHAR(15),
	regdate DATETIME DEFAULT CURRENT_TIMESTAMP,
	phone VARCHAR(20),
	email VARCHAR(20),
	profile VARCHAR(20),
	PRIMARY KEY(member_id)
);

-- DML
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('hong', '홍길동', '2', '800210-1234567', now(),'010-1234-5678','hong@test.com', 'hong.jpg');
show tables;
SELECT COUNT(*) AS COUNT FROM MEMBER;
UPDATE Member SET phone='' WHERE id='';
DELETE FROM Member WHERE member_id-'';


-- *******************
-- [2] BOARD TABLE
-- 2017.08.02
-- 회원관리 테이블
-- member_id, name, password, ssn, regdate, major_id, phone, email, profile
-- *******************
--ddl

SELECT * FROM Board;
CREATE TABLE Board(
	article_seq int not null auto_increment,
	member_id VARCHAR(10),
	title VARCHAR(20),
	content VARCHAR(100),
	hitcount INT,
	regdate DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(article_seq)
);
--dml



-- *******************
-- [3] PROF TABLE
-- 2017.08.02
-- 회원관리 테이블
-- member_id, salary
-- *******************
--ddl
CREATE TABLE Prof(
	member_id VARCHAR(10),
	salary VARCHAR(10),
	PRIMARY KEY(member_id)
);
--dml
INSERT INTO prof(MEMBER_ID, salary) VALUES ('ahn','8000');




-- *******************
-- [4] SUBJECT TABLE
-- 2017.08.02
-- 회원관리 테이블
-- subj_id, title
-- *******************
--DDL
CREATE TABLE Subject(
	subj_id VARCHAR(10),
	title VARCHAR(10),
	PRIMARY KEY(subj_id)
	);
--DML
INSERT INTO Subject(subj_id,title) VALUES ('java','자바');
drop table subject;





-- *******************
-- [5] MAJOR TABLE
-- 2017.08.02
-- article_seq, id, title,
-- content, hitcount, regdate
-- *******************
--DDL
CREATE TABLE Major(
	major_id VARCHAR(10),
	title VARCHAR(10),
	subj_id VARCHAR(10),
	member_id VARCHAR(10),
	PRIMARY KEY(major_id)
	);
--DML
INSERT INTO Subject(subj_id, title, major_id) VALUES('','','');
alter table major add member_id VARCHAR(10);
alter table major add subj_id VARCHAR(10);
drop table major;





-- *******************
-- [6]GRADE TABLE
-- 2017.08.02
-- 성적 테이블
-- member_id, name, password, ssn, regdate, major_id, phone, email, profile
-- *******************
--ddl
SELECT * FROM Grade;
CREATE TABLE Grade(
	grade_seq int not null auto_increment,
	score VARCHAR(3),
	exam_date VARCHAR(12),
	subj_id VARCHAR(10),
	member_id VARCHAR(10),
	PRIMARY KEY(grade_seq)
);

    
    

-- *******************
-- STUDENT TABLE
-- 2017.08.02
-- 학생정보 테이블
-- member_id, stu_no
-- *******************
--ddl
CREATE TABLE Student(
	member_id VARCHAR(10),
	stu_no VARCHAR(8),
	PRIMARY KEY(member_id),	
);
--dml
INSERT INTO STUDENT(MEMBER_ID, STU_NO) VALUES ('gosling','20166002');



-- *******************
-- JOIN QUERY
-- 2017.08.02
-- 조인 쿼리문
-- *******************
SELECT * FROM Member m, Board b WHERE m.id=b.id ORDER BY article_seq DESC;
SELECT * FROM MEMBER m, BOARD b WHERE m.id=b.id;
SELECT * FROM Member m, BOARD b, Grade g WHERE m.id=b.id AND m.id=g.id;
SELECT * FROM Member m, BOARD b WHERE m.id=b.id ROWNUM <=2;

SELECT *	
FROM(SELECT DISTINCT
    M.MEMBER_ID AS ID,M.NAME,MJ.TITLE AS MAJOR,
    G.SCORE,SJ.TITLE AS SUBJECT, G.EXAM_DATE, G.GRADE_SEQ
    FROM MEMBER M, STUDENT S, GRADE G, SUBJECT SJ, MAJOR MJ 
    WHERE M.MEMBER_ID=S.MEMBER_ID 
        AND M.MEMBER_ID=G.MEMBER_ID 
        AND SJ.MAJOR_ID=MJ.MAJOR_ID 
        AND SJ.SUBJ_ID=G.SUBJ_ID)
    WHERE ID='cho';

SELECT AVG(SCORE)
FROM ( SELECT
        M.MEMBER_ID ID, M.NAME name,
        G.SCORE score, G.EXAM_DATE
    FROM Grade g
        inner join Subject s on g.subj_id=s.subj_id
        inner join Member m on m.member_id=g.member_id
 )t
    WHERE T.ID='cho'; 

drop view student;
create view student (num,id,name,ssn,phone,email,title,regdate)
as
select rownum , t.id, t.name, t.ssn, t.phone, t.email, t.title, t.regdate
from (
    select a.member_id id, a.name, rpad(substr(a.ssn,1,8),14, '*') ssn, a.phone, a.email , 
    listagg(s.title, ',') within group (order by s.title) title, to_char(a.regdate,'yyyy/mm/dd') regdate 
    from member a
        left outer join major m on a.member_id like m.member_id
        left join subject s on m.subj_id like s.subj_id
    group by a.member_id, a.name, a.ssn, a.phone, a.email, a.regdate
    order by regdate 
) t
order by rownum desc
;  

SELECT * FROM STUDENT WHERE NUM>(SELECT COUNT(*)-5 FROM STUDENT);
select t2.*
from(select rownum seq, t.* from (select * from student order by num desc) t) t2
where t2.seq between 1 and 5
;


select t2.*
from(select rownum seq, t.* from (select * from student where name like '%홍%' order by num desc) t) t2
where t2.seq between 1 and 5
;

SELECT COUNT(*) AS count FROM Student WHERE name like '%';

SELECT COUNT(*) as count FROM Student WHERE name like '%';