CREATE DATABASE osh;

\c osh;


drop table if exists person;
create table person (pid  integer,
                     name text,
                     city text,
                     birthYear integer,
                     primary key (pid));

insert into person values
  (1,'Nick','NewYork',1990),
  (2,'Deepa','Indianapolis',1985),
  (3,'Eric','NewYork',1990),
  (4,'Ryan','Indianapolis',1995),
  (5,'Hasan','Indianapolis',1990),
  (6,'Arif','Indianapolis',1980),
  (7,'Ryan','Chicago',1980),
  (8,'Jean','SanFransisco',2000),
  (9,'Aya','SanFransisco',1985),
  (10,'Lisa','NewYork',2000),
  (11,'Arif','Chicago',1990),
  (12,'Deepa','Bloomington',1990),
  (13,'Nick','SanFransisco',1980),
  (14,'Ryan','Indianapolis',1990),
  (15,'Nick','Indianapolis',1990),
  (16,'Anna','Chicago',1980),
  (17,'Lisa','Bloomington',1990),
  (18,'Ryan','Bloomington',1995),
  (19,'Lisa','Chicago',1980),
  (20,'Danielle','Indianapolis',1985),
  (21,'Eric','Chicago',1980),
  (22,'Anna','Indianapolis',1985),
  (23,'Chris','Bloomington',1990),
  (24,'Aya','NewYork',1995),
  (25,'Arif','SanFransisco',1990),
  (26,'Anna','Bloomington',2000),
  (27,'Latha','SanFransisco',2000),
  (28,'Eric','Bloomington',2000),
  (29,'Linda','Bloomington',1990),
  (30,'Aya','NewYork',1995);



drop table if exists knows;
create table knows (pid1 integer,
                    pid2 integer,
                    primary key(pid1, pid2),
                    foreign key (pid1) references person(pid),
                    foreign key (pid2) references person(pid));

insert into knows values
  (5,22),
  (15,28),
  (10,27),
  (11,27),
  (13,14),
  (11,14),
  (5,28),
  (1,26),
  (18,24),
  (24,5),
  (6,26),
  (15,7),
  (15,25),
  (19,27),
  (10,5),
  (11,19),
  (20,22),
  (27,23),
  (24,29),
  (4,10),
  (26,12),
  (13,15),
  (19,4),
  (20,10),
  (10,6),
  (1,7),
  (17,23),
  (9,26),
  (3,10),
  (21,29),
  (27,15),
  (12,13),
  (16,3),
  (14,24),
  (14,28),
  (12,4),
  (15,8),
  (4,28),
  (18,11),
  (12,16),
  (30,12),
  (4,9),
  (4,8),
  (29,13),
  (29,20),
  (24,18),
  (16,13),
  (30,17),
  (23,22),
  (7,16),
  (29,22),
  (26,3),
  (28,30),
  (25,10),
  (3,22),
  (22,21),
  (30,3),
  (1,20),
  (19,11),
  (29,15),
  (13,30),
  (11,12),
  (1,5),
  (13,18),
  (24,19),
  (30,10),
  (4,12),
  (24,11),
  (18,22),
  (3,2),
  (4,3),
  (12,23),
  (25,24),
  (17,20),
  (28,10),
  (8,17),
  (15,13),
  (1,9),
  (6,18),
  (3,4),
  (4,19),
  (24,23),
  (27,3),
  (12,5),
  (12,2),
  (26,22),
  (30,15),
  (20,13),
  (28,14),
  (14,5),
  (1,10),
  (7,9),
  (27,22),
  (12,11),
  (16,20),
  (12,3),
  (17,7),
  (2,14),
  (18,25),
  (16,24);


drop table if exists company;
create table company(cname text,
                     city  text,
                     primary key (cname, city));

insert into company values
  ('Amazon','NewYork'),
  ('IBM','NewYork'),
  ('Amazon','Indianapolis'),
  ('Amazon','Bloomington'),
  ('Intel','NewYork'),
  ('Netflix','Indianapolis'),
  ('Yahoo','Indianapolis'),
  ('Google','Bloomington'),
  ('Apple','Indianapolis'),
  ('Hulu','Chicago'),
  ('Hulu','NewYork'),
  ('Yahoo','Chicago'),
  ('Intel','Bloomington'),
  ('Google','Chicago'),
  ('Zoom','Chicago'),
  ('Yahoo','NewYork'),
  ('Yahoo','Bloomington'),
  ('Netflix','Bloomington'),
  ('Microsoft','Chicago'),
  ('Netflix','NewYork'),
  ('Microsoft','Indianapolis'),
  ('Zoom','SanFransisco'),
  ('Netflix','SanFrancisco'),
  ('Yahoo','SanFrancisco'),
  ('IBM','SanFrancisco');



drop table if exists worksfor;
create table worksfor(pid    integer,
                      cname  text,
                      salary integer,
                      primary key(pid),
                      foreign key (pid) references person(pid));

insert into worksfor values
  (1,'IBM',60000),
  (2,'Hulu',50000),
  (3,'Amazon',45000),
  (4,'Microsoft',60000),
  (5,'Amazon',40000),
  (6,'IBM',50000),
  (7,'IBM',50000),
  (8,'Netflix',45000),
  (9,'Yahoo',50000),
  (10,'Hulu',40000),
  (11,'Apple',40000),
  (12,'Netflix',55000),
  (13,'Apple',40000),
  (14,'IBM',50000),
  (15,'IBM',40000),
  (16,'Apple',55000),
  (17,'Google',45000),
  (18,'Amazon',45000),
  (19,'Zoom',45000),
  (20,'Microsoft',55000),
  (21,'Intel',55000),
  (22,'IBM',40000),
  (23,'Apple',40000),
  (24,'Google',45000),
  (25,'Hulu',50000),
  (26,'Intel',55000),
  (27,'Intel',50000),
  (28,'Intel',50000),
  (29,'Google',60000),
  (30,'Intel',60000);


drop table if exists jobskill;
create table jobskill(skill text,
                      primary key(skill));
insert into jobskill values 
  ('Programming'), 
  ('Databases'), 
  ('AI'), 
  ('Networks'), 
  ('Mathematics');

drop table if exists personskill;
create table personskill(pid integer,
                         skill text,
                         primary key(pid,skill),
                         foreign key (pid) references person(pid),
                         foreign key (skill) references jobskill(skill));

insert into personskill values
  (27,'Programming'),
  (18,'Mathematics'),
  (10,'AI'),
  (29,'Networks'),
  (23,'AI'),
  (4,'AI'),
  (1,'Databases'),
  (10,'Networks'),
  (9,'Programming'),
  (13,'Networks'),
  (9,'AI'),
  (27,'Mathematics'),
  (20,'AI'),
  (29,'Databases'),
  (5,'Programming'),
  (26,'Databases'),
  (1,'Networks'),
  (28,'AI'),
  (15,'Programming'),
  (16,'Mathematics'),
  (12,'Databases'),
  (15,'Databases'),
  (24,'Programming'),
  (14,'AI'),
  (25,'Networks'),
  (13,'AI'),
  (12,'Programming'),
  (22,'Programming'),
  (7,'Mathematics'),
  (10,'Programming'),
  (16,'Databases'),
  (19,'Programming'),
  (7,'Programming'),
  (22,'AI'),
  (5,'Databases'),
  (2,'Mathematics'),
  (14,'Programming'),
  (26,'Networks'),
  (19,'Networks'),
  (21,'Programming'),
  (14,'Mathematics'),
  (19,'AI'),
  (2,'Networks'),
  (8,'Databases'),
  (13,'Mathematics'),
  (29,'Programming'),
  (3,'AI'),
  (16,'Networks'),
  (5,'Networks'),
  (17,'AI'),
  (24,'Databases'),
  (2,'Databases'),
  (27,'Networks'),
  (28,'Databases'),
  (30,'Databases'),
  (4,'Networks'),
  (6,'Networks'),
  (17,'Networks'),
  (23,'Programming'),
  (20,'Programming');

\qecho 'Question 1'
\qecho '                '

CREATE TABLE P (coefficient integer, degree integer);
INSERT INTO P VALUES
  (3, 3),
  (-2, 2),
  (0, 1),
  (5,0);


create or replace function evaluatePolynomial(x numeric) returns numeric as
$$
SELECT SUM(p.coefficient*power(x, p.degree))
FROM P p;
$$ language sql;

\qecho 'Evaluating the polynomial for value 7'
select evaluatePolynomial(7)::integer;

DROP TABLE IF EXISTS P;

\qecho 'Question 2'
\qecho '                '

CREATE TABLE P (coefficient integer, degree integer);
INSERT INTO P VALUES
  (2, 2),
  (-5, 1),
  (5,0);


CREATE TABLE Q (coefficient integer, degree integer);
INSERT INTO Q VALUES
  (4, 4),
  (3, 3),
  (1, 2),
  (-1, 1),
  (0,0);

\qecho 'Table P'
TABLE P;

\qecho 'Table Q'
TABLE Q;

create or replace function multiplicationPandQ()
returns table(coefficient integer, degree integer) as
$$
SELECT SUM(q.coefficient*p.coefficient)::integer as coefficient, 
        q.degree + p.degree as degree
FROM P p, Q q 
GROUP BY(q.degree + p.degree)
$$ language sql;

select pq.coefficient as p_times_q_coefficient, pq.degree as  p_times_q_degree
from multiplicationPandQ() pq;

DROP TABLE IF EXISTS P;

DROP TABLE IF EXISTS Q;


\qecho 'Question 3'
\qecho '                '
CREATE TABLE X(index integer, value integer);

INSERT INTO X VALUES
  (1,7),
  (2,-1),
  (3,2);

CREATE TABLE Y(index integer, value integer);

INSERT INTO Y VALUES
  (1,1),
  (2,1),
  (3,-10);


create or replace function dotProductXandY() returns bigint as
$$
SELECT SUM(X.value*Y.value)
FROM X, Y 
WHERE X.index = Y.index
$$ language sql;

TABLE X;
TABLE Y;

select dotProductXandY();

DROP TABLE IF EXISTS X;

DROP TABLE IF EXISTS Y;


\qecho 'Question 4'
\qecho '                '
CREATE TABLE M (row int, colmn int, value int);
INSERT INTO M VALUES
  (1, 1, 1),
  (1, 2, 2),
  (1, 3, 3),
  (2, 1, 1),
  (2, 2, -3),
  (2, 3, 5),
  (3, 1, 4),
  (3, 2, 0),
  (3, 3, -2);

CREATE TABLE N (row int, colmn int, value int);
INSERT INTO N VALUES
  (1, 1, -1),
  (1, 2, 2),
  (1, 3, -1),
  (2, 1, 2),
  (2, 2, -3),
  (2, 3, 4),
  (3, 1, 0),
  (3, 2, 0),
  (3, 3, 3);

\qecho 'Matrix M'
table M;

\qecho 'Matrix N';
table N;

\qecho 'Matrix M*N'
SELECT m.row as row, n.colmn as colmn, SUM(m.value * n.value) as value
FROM   N n, M m
WHERE  m.colmn = n.row
GROUP BY(m.row, n.colmn) order by 1,2,3;

DROP TABLE IF EXISTS M;
DROP TABLE IF EXISTS N;

\qecho 'Question 5'
\qecho '                '
select p.pid, p.name 
from person p 
where p.city = 'Bloomington' 
and (select count(1)
	 from personskill ps 
	 where ps.pid = p.pid 
	 and ps.skill <> 'Programming' 
	 and (select count(1)
	 	  from worksfor w1, personskill ps1 
		  where w1.cname = 'Netflix' 
		  and ps1.skill <> 'AI' 
		  and w1.pid = p.pid 
		  and ps.skill = ps1.skill) >0 )>0
order by 1;

\qecho 'Question 6'
\qecho '                '
select w.pid, w.cname, w.salary 
from worksfor w 
where (select count(1)
		from worksfor w1, company c 
		where w.pid <> w1.pid 
		and w.cname = w1.cname 
		and w1.salary < w.salary 
		and (select count(1)
			from   Person p
			where  c.city = p.city and
					p.birthyear <> 1990) =0 )>0
order by 1;

\qecho 'Question 7'
\qecho '                '
SELECT p.pid, p.name 
FROM person p 
WHERE p.city = 'Bloomington' 
AND (SELECT count(1)
        FROM knows k
        WHERE p.pid = k.pid1 
        AND (SELECT count(*) 
                FROM personskill ps 
                WHERE ps.pid = k.pid2) >= 3) <= 1
ORDER BY 1;

\qecho 'Question 8'
\qecho '                '
select p.pid, p.name 
from person p
where (select count(1) 
       from jobskill j) - 
      (select count(1) 
       from personskill ps 
       where ps.pid = p.pid) = 3
ORDER BY 1;

\qecho 'Question 9'
\qecho '                '
with companynames as (select distinct c.cname from company c)
select c.cname, (select count(1) 
                  from person p 
                  where (p.pid, c.cname) in (select w.pid, w.cname from worksfor w) 
                  and (select count(k.pid2)
                       from knows k 
                       where k.pid1 = p.pid
                       and (k.pid2, c.cname) in (select w.pid, w.cname from worksfor w)) >= 2) as numberOfPersons
from companynames c
ORDER BY 1;

\qecho 'Question 10'
\qecho '                '
-- Based on idea discussed with Sudip Padhye.
with subquery as (select p.pid, p.name, (select count(k.pid2)
                                          from knows k
                                          where k.pid1 = p.pid 
                                          and k.pid2 in (select w.pid
                                                        from  worksfor w 
                                                        where w.cname = 'IBM')) as peopleKnown
                  from person p, worksfor w
                  where p.pid = w.pid 
                  and w.cname = 'Netflix')
select s.pid, s.name
from subquery s 
where s.peopleKnown = (select max(s.peopleKnown)
                              from subquery s)
ORDER BY 1;

\qecho 'Question 11'
\qecho '                '
-- Based on idea discussed with Sudip Padhye.
with sub1 as (select w.cname, w.salary, (select count(ps.skill)
                                      from   personskill ps
                                      where  ps.pid = w.pid) as skillCount
           from   worksfor w),
     sub2 as (select a.cname, a.salary
           from   sub1 a
           where  a.skillCount = (select min(a1.skillCount)
                                   from   sub1 a1
                                   where  a1.cname = a.cname)),
     sub3 as (select b.cname, sum(b.salary) as avgSalary
           from   sub2 b 
           group by (b.cname))
select c.cname
from   sub3 c
where  c.avgSalary = (select max(c1.avgSalary)
                             from   sub3 c1)
order by 1;

\qecho 'Question 12'
\qecho '                '
create or replace view SalaryAbove55000 as
(select w.pid 
from worksfor w 
where w.salary >55000
order by 1);

select p.pid, p.name
from person p 
where not exists(select k.pid2
                from knows k 
                where k.pid1 = p.pid
                intersect 
                select s.pid 
                from SalaryAbove55000 s)
ORDER BY 1;


\qecho 'Question 13'
\qecho '                '
create or replace view Netflix_1985 as
  (select p.pid
   from   person p
   where  p.birthyear > 1985 
   and p.pid in (select w.pid
                from   worksfor w
                where w.salary >= 55000
                and w.cname = 'Netflix' )
   order by 1);

select p.pid, p.name
from person p 
where exists(select k.pid2
                from knows k 
                where k.pid1 = p.pid
                intersect 
                select s.pid 
                from Netflix_1985 s)
ORDER BY 1;

\qecho 'Question 14'
\qecho '                '
create or replace function worksAtCompany(company text)
   returns table(pid integer) as
$$
  select w.pid
  from   worksfor w
  where  w.cname = company
  order by 1;
$$ language sql;

create or replace view SalaryBelow55000 as
(select w.pid
from worksfor w
where w.salary < 55000 
order by 1);

with company as (select distinct c.cname from company c)
select c.cname
from   company c
where  not exists( select p1.pid
                   from   worksAtCompany(c.cname) p1
                   except
                   select p.pid 
                   from SalaryBelow55000 p)
ORDER BY 1;

\qecho 'Question 15'
\qecho '                '
create or replace function IBMWithSkill(s text) 
  returns table (pid integer) as
$$
select distinct w.pid
from   worksfor w 
where  w.cname = 'IBM'
and w.pid in (select ps.pid
            from   personskill ps
            where  ps.skill = s);
$$ language sql;

create or replace function knowsNetflixWithSkill(s text) 
  returns table (pid integer) as
$$
select distinct k.pid1
from   knows k
where  k.pid2 in (select w.pid
                  from   worksfor w
                  where  w.cname = 'Netflix' 
                  and w.pid in (select ps.pid
                                from   personskill ps
                                where  ps.skill = s));
$$ language sql;

-- Query using the above two views
select js.skill, js1.skill
from   jobskill js, jobskill js1
where  js.skill <> js1.skill 
and exists (select p.pid
            from   IBMWithSkill(js.skill) p
            except
            select p.pid
            from   knowsNetflixWithSkill(js1.skill) p)
order by 1,2;


\qecho 'Question 16'
\qecho '                '
-- Based on idea discussed with Aman Kumar.
create or replace function skills(s text) 
  returns table (pid integer) as
$$
select ps.pid
from   personskill ps
where  ps.skill = s
order  by 1;
$$ language sql;

create or replace function worksFor(c text) 
  returns table (pid integer) as
$$
select w.pid
from   worksfor w
where  w.cname = c
order  by 1;
$$ language sql;

create or replace function knowsPeople(p integer) 
  returns table (pid integer) as
$$
select k.pid2
from   knows k
where  k.pid1 = p
order  by 1;
$$ language sql;

with cmp as (select distinct c.cname from company c)
select count(distinct row(p.pid, c.cname, js.skill))
from   Person p, cmp c, Jobskill js
where not exists (( select p1.pid
                    from   knowsPeople(p.pid) p1
                    intersect
                    select p1.pid
                    from   worksFor(c.cname) p1)
                    except
                    (select p1.pid
                    from   skills(js.skill) p1));

\qecho 'Question 17'
\qecho '                '
create or replace view IBMtotalSkills as 
(select distinct ps.skill
from personskill ps 
where ps.pid in (select w.pid
                 from worksfor w 
                 where w.cname = 'IBM'));


create or replace function SkillofPerson(p integer) 
  returns table (skill text) as
$$
select ps.skill
from   personskill ps
where  ps.pid = p
order  by 1;
$$ language sql;

select p.pid, p.name
from person p 
where (select count(*) 
       from (select ibm.skill 
             from IBMtotalSkills ibm 
             intersect 
             select p.skill 
             from SkillofPerson(p.pid) p) subquery) >2
ORDER BY 1;

\qecho 'Question 18'
\qecho '                '
create or replace function Worksfor(company text) 
  returns table (pid integer) as
$$
select w.pid
from   worksfor w
where  w.cname = company
order  by 1;
$$ language sql;

create or replace view salaryGreaterThan50000 as
 (select w.pid
  from   worksfor w
  where  w.salary >= 50000
  order by 1);

with cmp as (select distinct c.cname from company c)
select c.cname
from   cmp c
where  mod((select count(1)
            from   (select p.pid
                    from   salaryGreaterThan50000 p
                    intersect 
                    select p.pid
                    from   worksFor(c.cname) p) q), 2) = 1;

\qecho 'Question 19'
\qecho '                '
create or replace view knows3Skills as 
 (select p.pid
  from   person  p
  where  (select count(1)
          from   personSkill ps
          where  ps.pid = p.pid) = 3
  order by 1);

create or replace function knowsPeople(p integer) 
  returns table (pid integer) as
$$
select k.pid2
from   knows k
where  k.pid1 = p
order  by 1;
$$ language sql;

select p.pid, p.name
from   person p
where  (select count(1)
        from   (select p1.pid
                from   knowsPeople(p.pid) p1
                intersect
                select p1.pid
                from   knows3Skills p1) p2) >= 2
order by 1;

\qecho 'Question 20'
\qecho '                '
-- Based on idea discussed with Vijeet Sharma.
create or replace function knowsPeople(p integer) 
  returns table (pid integer) as
$$
select k.pid2
from   knows k
where  k.pid1 = p
order  by 1;
$$ language sql;

select p1.pid, p2.pid
from   person p1, person p2
where  p1.pid <> p2.pid 
and (select count(1)
	from ((select *
			from   knowsPeople(p2.pid)
			except
			select *
			from   knowsPeople(p1.pid))
			union
			(select *
			from   knowsPeople(p1.pid)
			except
			select *
			from   knowsPeople(p2.pid))) sub) = 0
order by 1,2;

\qecho 'Question 21'
\qecho '                '
-- Based on idea discussed with Vijeet Sharma.
create or replace function knowsPeople(p integer) 
  returns table (pid integer) as
$$
select k.pid2
from   knows k
where  k.pid1 = p
order  by 1;
$$ language sql;

select p1.pid, p2.pid
from   person p1, person p2
where  p1.pid <> p2.pid 
and (select count(1)
	from knowsPeople(p2.pid) sub1)
	= (select count(1)
	   from knowsPeople(p1.pid) sub2)
order by 1,2;

\c postgres;

DROP DATABASE osh;	
























