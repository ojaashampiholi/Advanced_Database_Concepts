create database osh;

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

\qecho '                '
\qecho 'Question 1'
\qecho '                '
(select pid, name 
from person p
    NATURAL JOIN worksfor w
    NATURAL JOIN (select distinct c.cname 
                from company c 
                where c.city = 'Bloomington') s1)
intersect
(select p.pid, p.name 
from person p 
    join knows on (p.pid = pid1)
    join (select p1.pid from person p1 where p1.city = 'Chicago') s on (s.pid = pid2))
ORDER BY 1;

\qecho 'Question 2'
\qecho '                '
(select distinct skill
from jobskill)
except
(select distinct skill
from personskill 
    natural join (select pid 
                from worksfor 
                where cname = 'Yahoo' 
                or cname = 'Netflix') t)
order by 1;

\qecho 'Question 3'
\qecho '                '
with subquery as (select distinct pid, skill, cname
                from personskill 
                natural join worksfor)
select distinct s1.cname
from subquery s1 
join subquery s2 on (s1.skill = s2.skill 
                             and s1.pid <> s2.pid 
                             and s1.cname = s2.cname)
order by 1;

\qecho 'Question 4'
\qecho '                '
with googlePeople as (select pid 
                    from  worksfor
                    where cname = 'Google'), 
    amazonProgrammming as (select pid 
                            from worksfor
                            where cname = 'Amazon'
                            intersect 
                            select pid 
                            from personskill 
                            where skill = 'Programming')
(select p.pid, p.name
from person p
     join knows k on (p.pid = k.pid1)
     join googlePeople g on (g.pid = k.pid2))
except
(select p.pid, p.name 
from person p 
     join knows k on (p.pid = k.pid1) 
     join amazonProgrammming a on (a.pid = k.pid2))
order by 1;

\qecho 'Question 5'
\qecho '                '
with ibm as (select p.pid, p.name, salary
            from person p 
                natural join worksfor 
            where cname= 'IBM'),
    ibmDatabase as (select ibm.pid, ibm.name, ibm.salary
                    from ibm 
                    natural join (select pid 
                                    from personskill
                                    where skill = 'Databases') i)
select pid, name
from ibm
EXCEPT
select ibm.pid , ibm.name
from ibm 
     join ibmDatabase on (ibm.pid <> ibmDatabase.pid 
                          and ibm.salary<= ibmDatabase.salary)
order by 1;


\qecho 'Question 6'
\qecho '                '
with salaryAbove55k as (select pid as pid2
                         from worksfor 
                         where salary > 55000),
     knowsPeople as (select pid1, name, pid2 
                    from person
                    join knows on (pid1 = pid))
(select pid, name 
from person p)
except 
(select pid1, name 
from knowsPeople 
natural join salaryAbove55k)
order by 1;


\qecho 'Question 7'
\qecho '                '
with netflixWorkers as (select pid as pid2
                        from person
                        where birthyear > 1985
                        intersect 
                        select pid as pid2
                        from worksfor 
                        where cname = 'Netflix'
                        and salary >= 55000),
     allPeople as (select pid, name
                    from person),
    knowPairs as (select pid1, name, pid2
        from   allPeople join Knows on (pid = pid1))
select pid, name 
from allPeople 
except 
select pid, name 
from (select pid, name, pid2
      from allPeople 
      cross join netflixWorkers 
      except 
      select * from knowPairs) a
order by 1;


\qecho 'Question 8'
\qecho '                '
-- Based on idea discussed with Vijeet Sharma
with salaryLessThan55k as (select pid 
                            from worksfor 
                            where salary<55000),
    e as (select cname, pid 
            from worksfor 
            except 
            select cname, pid 
            from salaryLessThan55k 
            natural join worksfor) 
select cname from company 
except 
select cname from e
order by 1;


\qecho 'Question 9'
\qecho '                '
with e as (select s.pid, s.skill as skill1, j.skill as skill2
            from personskill s cross join jobskill j
            except 
            select s1.pid, s1.skill as skill1, s2.skill as skill2
            from personskill s1 join personskill s2 on (s1.pid = s2.pid))
select j1.skill, j2.skill
from   jobskill j1 cross join jobskill j2
except 
select skill1, skill2
from  e
order by 1,2;


\qecho 'Question 10'
\qecho '                '
-- Based on idea discussed with Sudip Padhye
with people as (select distinct pid from person),
     companyNames as (select distinct cname from company),
     pairs as (select distinct pid1, cname, pid2 
               from worksfor join knows on (pid = pid2))
select count(1)
from(select pid, cname, skill 
        from people cross join companyNames cross join jobskill
        except
        select pid1, cname, skill
        from (select pid1, cname, pid2, skill
                from pairs cross join jobskill
                except 
                select pid1, cname, pid2, skill
                from pairs join personskill on (pid2 = pid)) a) b;


\qecho 'Question 11'
\qecho '                '
-- Based on idea discussed with Sudip Padhye

with companyNames as (select distinct cname from company),
    e as (select w.cname as cname1, c.cname as cname2, w.salary 
        from worksfor w cross join companyNames c 
        except 
        select w.cname as cname1, w1.cname as cname2, w.salary 
        from worksfor w join worksfor w1 on (w1.salary >= w.salary))
select c.cname, c1.cname 
from companyNames c cross join companyNames c1 
except 
select cname1, cname2
from e
order by 1, 2;

\c postgres;

drop database osh;
