
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


-- DML

INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('hong', '홍길동', '2', '800210-1234567', now(),'010-1234-5678','hong@test.com', 'hong.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('kang', '강감찬', '1', '780901-1234567', now(),'010-1234-5678','kang@test.com', 'kang.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('sejong', '세종대왕', '1', '600602-1234567', now(),'010-1234-5678','sejong@test.com', 'sejong.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('eul', '을지문덕', '1', '830430-1234567', now(),'010-1234-5678','eul@test.com', 'eul.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('joy', '김정현', '1', '910314-2234567', now(),'010-1234-5678','joy@test.com', 'joy.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('lein', '현혜린', '1', '860215-2234567', now(),'010-1234-5678','lein@test.com', 'lein.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('hayun', '김하윤', '1', '870902-2234567', now(),'010-1234-5678','hayun@test.com', 'hayun.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('hanseul', '김한슬', '1', '890302-2234567', now(),'010-1234-5678','hanseul@test.com', 'hanseul.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('heekyung', '서희경', '1', '920503-2234567', now(),'010-1234-5678','heekyung@test.com', 'heekyung.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('songj', '송중기', '1', '921031-1234567', now(),'010-1234-5678','songj@test.com', 'songj.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('kong', '공유', '1', '921210-1234567', now(),'010-1234-5678','kong@test.com', 'kong.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('hyekyo', '송혜교', '1', '930710-2234567', now(),'010-1234-5678','hyekyo@test.com', 'hyekyo.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('hyemi', '송혜미', '1', '951230-2234567', now(),'010-1234-5678','hyemi@test.com', 'hyemi.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('ahyun', '김아현', '1', '950627-2234567', now(),'010-1234-5678','ahyun@test.com', 'ahyun.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('kkm', '김경미', '1', '911025-2234567', now(),'010-1234-5678','kkm@test.com', 'kkm.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('kangji', '강지원', '1', '960704-2234567', now(),'010-1234-5678','kangji@test.com', 'kangji.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('sanghyun', '김상현', '1', '930405-1234567', now(),'010-1234-5678','sanghyun@test.com', 'sanghyun.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('sangyun', '이상윤', '1', '870902-1234567', now(),'010-1234-5678','sangyun@test.com', 'sangyun.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('jiyun', '이지윤', '1', '901129-1234567', now(),'010-1234-5678','jiyun@test.com', 'jiyun.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('ameyoung', '안영민', '1', '920921-2234567', now(),'010-1234-5678','ameyoung@test.com', 'ameyoung.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('mooyoung', '이무영', '1', '920804-1234567', now(),'010-1234-5678','mooyoung@test.com', 'mooyoung.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('jihyun', '이지현', '1', '921230-2234567', now(),'010-1234-5678','jihyun@test.com', 'jihyun.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('seohyung', '이서형', '1', '950201-1234567', now(),'010-1234-5678','seohyung@test.com', 'seohyung.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('yoonisa', '윤정숙', '1', '92405-2234567', now(),'010-1234-5678','yoonisa@test.com', 'yoonisa.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('kimcw', '김창원', '1', '980502-1234567', now(),'010-1234-5678','kimcw@test.com', 'kimcw.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('ksub', '임경섭', '1', '961130-1234567', now(),'010-1234-5678','ksub@test.com', 'ksub.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('jsub', '임준섭', '1', '920925-1234567', now(),'010-1234-5678','jsub@test.com', 'jsub.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('yejin', '한예진', '1', '960820-2234567', now(),'010-1234-5678','yejin@test.com', 'yejin.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('yoojin', '원유진', '1', '900906-2234567', now(),'010-1234-5678','yoojin@test.com', 'yoojin.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('taesu', '이태수', '1', '991113-1234567', now(),'010-1234-5678','taesu@test.com', 'taesu.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('samonim', '최승숙', '1', '901011-2234567', now(),'010-1234-5678','samonim@test.com', 'samonim.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('moksanim', '이덕성', '1', '901030-1234567', now(),'010-1234-5678','moksanim@test.com', 'moksanim.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('euna', '고은아', '1', '920201-2234567', now(),'010-1234-5678','euna@test.com', 'euna.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('jiyul', '이지율', '1', '990203-2234567', now(),'010-1234-5678','jiyul@test.com', 'jiyul.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('boyoung', '장보영', '1', '970804-2234567', now(),'010-1234-5678','boyoung@test.com', 'boyoung.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('jaeyoung', '이재영', '1', '930407-1234567', now(),'010-1234-5678','jaeyoung@test.com', 'jaeyoung.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('heeyoung', '장희영', '1', '940208-2234567', now(),'010-1234-5678','eeyoung@test.com', 'eeyoung.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('sarang', '최사랑', '1', '921111-2234567', now(),'010-1234-5678','sarang@test.com', 'sarang.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('hbin', '현빈', '1', '910101-1234567', now(),'010-1234-5678','hbin@test.com', 'hbin.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('wbin', '원빈', '1', '910123-1234567', now(),'010-1234-5678','wbin@test.com', 'wbin.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('kildong', '홍길동', '1', '950213-1234567', now(),'010-1234-5678','kildong@test.com', 'kildong.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('hyunbin', '현빈', '1', '920692-1234567', now(),'010-1234-5678','hyunbin@test.com', 'hyunbin.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('ksarang', '김사랑', '1', '941213-2234567', now(),'010-1234-5678','ksarang@test.com', 'ksarang.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('mok', '이명옥', '1', '941116-2234567', now(),'010-1234-5678','mok@test.com', 'mok.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('hyejin', '전혜진', '1', '900128-2234567', now(),'010-1234-5678','hyejin@test.com', 'hyejin.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('hyerim', '정혜림', '1', '991123-1234567', now(),'010-1234-5678','hyerim@test.com', 'hyerim.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('hyunkyu', '정현규', '1', '970907-1234567', now(),'010-1234-5678','hyunkyu@test.com', 'hyunkyu.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('jieun', '이지은', '1', '960924-1234567', now(),'010-1234-5678','jieun@test.com', 'jieun.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('youngho', '강영호', '1', '941031-1234567', now(),'010-1234-5678','youngho@test.com', 'youngho.jpg');
INSERT INTO Member(member_id, name, password, ssn, regdate, phone, email, profile) VALUES ('jho', '이정호', '1', '990909-1234567', now(),'010-1234-5678','jho@test.com', 'jho.jpg');


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

INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES ('hong', '홍길동 안녕', '풀이 뜨고, 용감하고 약동하다.',0, now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES ('hong', '홍길동 안녕', '풀이 뜨고, 용감하고 약동하다.',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES ('sejong', 'Hi', '풀이 뜨고, 보이는 가는 모래뿐일 든 있는가?',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'joy', 'Bye', '위하여서, 착목한는 영락과 얼마나 있다. ',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'ameyoung', '홍길동 안녕', '같으며, 커다란 풍부하게 같이 봄바람이다.',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'jeewon', 'jiwon park', '우리 그들은 붙잡아 이것이다.',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'jho', '백성희 안녕', '없는 피부가 인간의 있는 곧 끝까지 날카로우나 끓는다.',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'hbin', 'james cordon', '인생을 얼마나 인류의 방황하였으며, 대중을 말이다.',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'sarang', 'connan', '무한한 일월과 천하를 속잎나고, 뿐이다.',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'sarang', 'jess', 'jess is from hk.',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'jiyul', '현지니', 'gina works in a lab',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'sangyun', 'gina', 'her English name is gina.',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'jiyun', '송혜미', '그들의 같이, 꽃이 것이다.',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'sarang', 'again', ' 가슴이 풍부하게 풀밭에 위하여 풀이 몸이 이상은 있다. ',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'ameyoung', '철수', '끓는 대고, 과실이 역사를 맺어, 운다. ',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'sejong', 'young', ' 모래뿐일 이것을 우리의 그들의 그들의 보내는 꾸며 약동하다.',0,now());
INSERT INTO Board(member_id,title,content, hitcount,regdate) VALUES (  'hong', 'hey', '미묘한 가는 천지는 힘있다.',0,now());





-- *******************
-- [3] Prof TABLE
-- 2017.09.04
-- article_seq, id, title,
-- content, hitcount, regdate
-- *******************

--DML
select * from prof;
INSERT INTO prof(MEMBER_ID, salary) VALUES ('hong','4000');
INSERT INTO prof(MEMBER_ID, salary) VALUES ('kang','5000');
INSERT INTO prof(MEMBER_ID, salary) VALUES ('sejong','7000');
INSERT INTO prof(MEMBER_ID, salary) VALUES ('eul','8000');
INSERT INTO prof(MEMBER_ID, salary) VALUES ('joy','10000');


-- *******************
-- [4] SUBJECT TABLE
-- 2017.09.04
-- 회원관리 테이블
-- subj_id, title
-- *******************
select * from subject;
INSERT INTO SUBJECT(SUBJ_ID, TITLE) VALUES ('JAVA', '자바');
INSERT INTO SUBJECT(SUBJ_ID, TITLE) VALUES ('SQL', 'SQL');
INSERT INTO SUBJECT(SUBJ_ID, TITLE) VALUES ('PYTHON', '파이썬');
INSERT INTO SUBJECT(SUBJ_ID, TITLE) VALUES ('HTML', 'HTML');
INSERT INTO SUBJECT(SUBJ_ID, TITLE) VALUES ('C', 'C언어');
INSERT INTO SUBJECT(SUBJ_ID, TITLE) VALUES ('JAVASCRIPT', '자스');



-- *******************
-- [5] GRADE TABLE
-- 2017.09.04
-- 성적 테이블
-- member_id, name, password, ssn, regdate, major_id, phone, email, profile
-- *******************



-- *******************
-- [6] Major TABLE
-- 2017.09.04
-- 성적 테이블
-- member_id, name, password, ssn, regdate, major_id, phone, email, profile
-- *******************

select * from major;
insert into major (major_id, title) values ('art', '예술학');
insert into major (major_id, title) values ('computer', '컴공');
insert into major (major_id, title) values ('tourism', '관광학');
insert into major (major_id, title) values ('economics', '경제학');

