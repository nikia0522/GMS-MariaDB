select *
from 
	member a
	left join major m 
		on a.member_id like m.member_id
	left join subject s 
		on m.subj_id like s.subj_id
	group by 
		a.member_id, a.name, a.ssn, 
		a.regdate, a.phone, a.email
	order by regdate
;


CREATE VIEW student 
  (
   id,name,ssn,
   phone,email,password,
   subjects,regdate
  )
AS
(
  SELECT 
    a.member_id id, 
    a.name, 
    RPAD(SUBSTRING(a.ssn,1,8),14, '*') ssn, 
	  a.phone, 
	  a.email,
	  a.password password,
	  GROUP_CONCAT(s.title separator ',') subjects, 
	  DATE_FORMAT(a.regdate,'%y-%m-%d') regdate 
  FROM member a
	  LEFT OUTER JOIN 
	    major m 
	    ON a.member_id LIKE m.member_id
	  LEFT JOIN subject s 
	    ON m.subj_id like s.subj_id
	  GROUP BY 
	    a.member_id, a.name, a.ssn, a.phone, a.email, a.regdate
	  ORDER BY regdate
)
;    


drop view student;

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