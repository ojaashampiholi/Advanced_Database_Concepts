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

\qecho '                '
\qecho 'Question 1'
\qecho '                '
\qecho 'Question 1.1'
\qecho '                '
\qecho 'Question 1.1.a'
(SELECT p.pid, p.name
FROM person p, worksfor w, company c
WHERE p.pid = w.pid
AND w.cname = c.cname 
AND c.city = 'Bloomington')
INTERSECT
(SELECT p1.pid, p1.name
FROM person p1, person p2, knows k 
WHERE p1.pid = k.pid1 
AND k.pid2 = p2.pid 
AND p2.city = 'Chicago')
ORDER BY 1;



\qecho '                '
\qecho 'Question 1.1.b'
SELECT DISTINCT p.pid,p.name 
FROM person p, person p1, knows k
WHERE p.pid = k.pid1 
AND k.pid2 = p1.pid 
AND p1.city = 'Chicago'
AND p.pid IN (
                SELECT p.pid 
                FROM person p, worksfor w, company c
                Where p.pid = w.pid 
                AND w.cname = c.cname 
                AND c.city = 'Bloomington'
                )
ORDER BY 1;

\qecho '                '
\qecho 'Question 1.1.c'
SELECT DISTINCT p.pid,p.name 
FROM person p, person p1, knows k
WHERE p.pid = k.pid1 
AND k.pid2 = p1.pid 
AND p1.city = 'Chicago'
AND p.pid = SOME (
                SELECT p.pid 
                FROM person p, worksfor w, company c
                Where p.pid = w.pid 
                AND w.cname = c.cname 
                AND c.city = 'Bloomington'
                )
ORDER BY 1;

\qecho '                '
\qecho 'Question 1.1.d'
SELECT p.pid, p.name
FROM person p, worksfor w, company c
WHERE p.pid = w.pid
AND w.cname = c.cname 
AND c.city = 'Bloomington'
AND EXISTS (SELECT p.pid, p.name
            FROM person p2, knows k 
            WHERE p.pid = k.pid1 
            AND k.pid2 = p2.pid 
            AND p2.city = 'Chicago')
ORDER BY 1;

\qecho '                '
\qecho 'Question 1.2'
\qecho '                '
\qecho 'Question 1.2.a'
(SELECT p.pid, p.name
FROM person p, knows k, worksfor w
WHERE p.pid = k.pid1
AND k.pid2 = w.pid
AND w.cname = 'Google')
EXCEPT
(SELECT p.pid, p.name
FROM person p, knows k, worksfor w, personskill ps 
WHERE p.pid = k.pid1 
AND k.pid2 = w.pid 
AND w.cname = 'Amazon'
AND k.pid2 = ps.pid 
AND ps.skill = 'Programming')
ORDER BY 1;

\qecho '                '
\qecho 'Question 1.2.b'
SELECT p.pid, p.name
FROM person p, knows k, worksfor w
WHERE p.pid = k.pid1
AND k.pid2 = w.pid
AND w.cname = 'Google'
AND p.pid NOT IN (SELECT p.pid
                    FROM person p, knows k, worksfor w, personskill ps 
                    WHERE p.pid = k.pid1 
                    AND k.pid2 = w.pid 
                    AND w.cname = 'Amazon'
                    AND k.pid2 = ps.pid 
                    AND ps.skill = 'Programming')
ORDER BY 1;

\qecho '                '
\qecho 'Question 1.2.c'
SELECT p.pid, p.name
FROM person p, knows k, worksfor w
WHERE p.pid = k.pid1
AND k.pid2 = w.pid
AND w.cname = 'Google'
AND p.pid <> ALL (SELECT p.pid
                    FROM person p, knows k, worksfor w, personskill ps 
                    WHERE p.pid = k.pid1 
                    AND k.pid2 = w.pid 
                    AND w.cname = 'Amazon'
                    AND k.pid2 = ps.pid 
                    AND ps.skill = 'Programming')
ORDER BY 1;

\qecho '                '
\qecho 'Question 1.2.d'
SELECT p.pid, p.name
FROM person p, knows k, worksfor w
WHERE p.pid = k.pid1
AND k.pid2 = w.pid
AND w.cname = 'Google'
AND NOT EXISTS (SELECT p.pid
                    FROM knows k, worksfor w, personskill ps 
                    WHERE p.pid = k.pid1 
                    AND k.pid2 = w.pid 
                    AND w.cname = 'Amazon'
                    AND k.pid2 = ps.pid 
                    AND ps.skill = 'Programming')
ORDER BY 1;

\qecho '                '
\qecho 'Question 1.3'
\qecho '                '
\qecho 'Question 1.3.a'
SELECT DISTINCT w1.cname 
FROM worksfor w1, worksfor w2, personskill p1, personskill p2 
WHERE w1.pid <> w2.pid 
AND w1.cname = w2.cname 
AND w1.pid = p1.pid 
AND w2.pid = p2.pid 
AND p1.skill = p2.skill
ORDER BY 1;

\qecho '                '
\qecho 'Question 1.3.b'
SELECT DISTINCT w.cname 
FROM worksfor w
WHERE w.pid IN (SELECT w.pid 
                FROM worksfor w2, personskill p1, personskill p2
                WHERE w.pid <> w2.pid 
                AND w.cname = w2.cname
                AND w.pid = p1.pid 
                AND w2.pid = p2.pid 
                AND p1.skill = p2.skill)
ORDER BY 1;

\qecho '                '
\qecho 'Question 1.3.c'
SELECT DISTINCT w.cname 
FROM worksfor w
WHERE EXISTS (SELECT w.cname 
                FROM worksfor w2, personskill p1, personskill p2
                WHERE w.pid <> w2.pid 
                AND w.cname = w2.cname
                AND w.pid = p1.pid 
                AND w2.pid = p2.pid 
                AND p1.skill = p2.skill)
ORDER BY 1;

\qecho '                '
\qecho 'Question 1.4'
\qecho '                '
\qecho 'Question 1.4.a'
-- CREATE VIEW ibm_database AS
-- SELECT w.pid, w.salary
-- FROM worksfor w, personskill ps
-- WHERE w.pid = ps.pid 
-- AND w.cname = 'IBM'
-- AND ps.skill = 'Databases';

-- SELECT p.pid, p.name
-- FROM person p, worksfor w
-- WHERE p.pid = w.pid 
-- AND w.cname = 'IBM'
-- AND w.salary >= ALL(SELECT ibm.salary
--                     FROM ibm_database ibm)
-- ORDER BY 1;
(SELECT p.pid, p.name
FROM person p, worksfor w 
WHERE p.pid = w.pid 
AND w.cname = 'IBM')
EXCEPT
(SELECT p1.pid, p1.name
FROM person p2, person p1, worksfor w1, worksfor w2, personskill ps1
WHERE p1.pid = w1.pid 
AND p1.pid <> p2.pid
AND w1.cname = 'IBM'
AND w2.cname = w1.cname 
AND w2.pid = p2.pid 
AND w1.salary< w2.salary
AND ps1.skill = 'Databases');

\qecho '                '
\qecho 'Question 1.4.b'
SELECT p.pid, p.name
FROM person p, worksfor w
WHERE p.pid = w.pid 
AND w.cname = 'IBM'
AND w.salary >= ALL(SELECT w.salary
                    FROM worksfor w, personskill ps
                    WHERE w.pid = ps.pid 
                    AND w.cname = 'IBM'
                    AND ps.skill = 'Databases')
ORDER BY 1;

\qecho '                '
\qecho 'Question 1.5'
SELECT DISTINCT w.cname, p.pid, p.name 
FROM person p, worksfor w 
WHERE p.pid = w.pid 
AND NOT EXISTS (SELECT w1.pid 
                FROM worksfor w1, worksfor w2 
                WHERE w1.cname = w.cname 
                AND w2.cname = w.cname 
                AND w2.salary<w1.salary 
                AND w1.salary<w.salary)
AND EXISTS (SELECT w1.pid
            FROM worksfor w1 
            WHERE w1.cname = w.cname 
            AND w1.salary<w.salary)
ORDER BY 1;


\qecho '                '
\qecho 'Question 1.6'
SELECT DISTINCT p.pid, p.name
FROM person p, personskill ps, personskill ps1, knows k
WHERE p.pid = k.pid1
AND k.pid2 = ps.pid
AND k.pid2 = ps1.pid 
AND ps.skill <> ps1.skill
AND p.pid NOT IN(SELECT k1.pid1
                    FROM knows k1, knows k2
                    WHERE k1.pid1 = k2.pid1 
                    AND k1.pid2 <> k2.pid2);


SELECT p.pid, p.name 
FROM person p
WHERE p.pid IN (SELECT DISTINCT k.pid1
                FROM personskill ps, personskill ps1, knows k
                WHERE k.pid2 = ps.pid
                AND k.pid2 = ps1.pid 
                AND ps.skill <> ps1.skill)
AND p.pid NOT IN (SELECT DISTINCT k1.pid1
                    FROM knows k1, knows k2
                    WHERE k1.pid1 = k2.pid1 
                    AND k1.pid2 <> k2.pid2);


\qecho '                '
\qecho 'Question 1.7'
(SELECT j.skill
FROM jobskill j)
EXCEPT
((SELECT DISTINCT ps.skill
FROM personskill ps, worksfor w 
WHERE w.pid = ps.pid 
AND w.cname = 'Yahoo')
UNION
(SELECT DISTINCT ps.skill
FROM personskill ps, worksfor w 
WHERE w.pid = ps.pid 
AND w.cname = 'Netflix'));

\qecho '                '
\qecho 'Question 1.8'
SELECT j1.skill, j2.skill
FROM jobskill j1, jobskill j2 
WHERE NOT EXISTS(
SELECT ps1.pid
FROM personskill ps1 
WHERE ps1.skill = j1.skill
AND ps1.pid NOT IN (SELECT ps2.pid 
                    FROM personskill ps2
                    WHERE ps2.skill = j2.skill));


\qecho '                '
\qecho 'Question 1.9'
-- WITH subquery1 AS (SELECT w2.salary FROM worksfor w2, company c2 WHERE w2.cname = c2.cname)
SELECT DISTINCT c1.cname, c2.cname 
FROM company c1, company c2 
WHERE NOT EXISTS(SELECT w1.pid
                FROM worksfor w1 
                WHERE w1.cname = c1.cname 
                AND w1.salary > ALL(SELECT w2.salary 
                                    FROM worksfor w2 
                                    WHERE w2.cname = c2.cname)) ORDER BY 1,2;


\qecho '                '
\qecho 'Question 1.10'
-- This query has been solved by approach discussed with Sudip Padhye.

-- Selecting the people who lack atleast 3 or more skill as subquery1 and further
-- selecting the people who have atleast two or more skills missing except the 
-- people found in subquery1.
\qecho '                '
\qecho 'Method 1 - Using views'
WITH subquery1 AS (SELECT p.pid
                    FROM personskill p 
                    WHERE EXISTS(
                    SELECT 1
                    FROM jobskill j1, jobskill j2, jobskill j3
                    WHERE j1.skill<>j2.skill 
                    AND j2.skill <> j3.skill 
                    AND j1.skill <> j3.skill
                    AND j1.skill NOT IN (SELECT p1.skill
                                        FROM personskill p1 
                                        WHERE p1.pid = p.pid)
                    AND j2.skill NOT IN (SELECT p2.skill
                                        from personskill p2 
                                        WHERE p2.pid = p.pid)
                    AND j3.skill NOT IN (SELECT p3.skill
                                        from personskill p3 
                                        WHERE p3.pid = p.pid)))
SELECT DISTINCT p.pid
FROM personskill p 
WHERE EXISTS(
SELECT 1
FROM jobskill j1, jobskill j2 
WHERE j1.skill<>j2.skill 
AND j1.skill NOT IN (SELECT p1.skill
                    FROM personskill p1 
                    WHERE p1.pid = p.pid)
AND j2.skill NOT IN (SELECT p2.skill
                    from personskill p2 
                    WHERE p2.pid = p.pid)
AND p.pid NOT IN (SELECT * FROM subquery1));

\qecho '                '
\qecho 'Method 2 - Without using views'
(SELECT DISTINCT p.pid
FROM personskill p 
WHERE EXISTS(
SELECT 1
FROM jobskill j1, jobskill j2 
WHERE j1.skill<>j2.skill 
AND j1.skill NOT IN (SELECT p1.skill
                    FROM personskill p1 
                    WHERE p1.pid = p.pid)
AND j2.skill NOT IN (SELECT p2.skill
                    from personskill p2 
                    WHERE p2.pid = p.pid)))
EXCEPT
(SELECT p.pid
FROM personskill p 
WHERE EXISTS(
SELECT 1
FROM jobskill j1, jobskill j2, jobskill j3
WHERE j1.skill<>j2.skill 
AND j2.skill <> j3.skill 
AND j1.skill <> j3.skill
AND j1.skill NOT IN (SELECT p1.skill
                    FROM personskill p1 
                    WHERE p1.pid = p.pid)
AND j2.skill NOT IN (SELECT p2.skill
                    from personskill p2 
                    WHERE p2.pid = p.pid)
AND j3.skill NOT IN (SELECT p3.skill
                    from personskill p3 
                    WHERE p3.pid = p.pid))) ORDER BY 1;


\qecho '                '
\qecho 'Question 1.11'
SELECT COUNT(1)
FROM person p1, person p2, person p3 
WHERE (p1.pid, p2.pid) NOT IN (SELECT k1.pid1,k1.pid2
                                FROM knows k1)
OR (p3.pid, p2.pid) NOT IN (SELECT k2.pid1, k2.pid2 
                            FROM knows k2);

\qecho '                '
\qecho 'Question 2'
\qecho '                '
\qecho 'Question 2.1'
\qecho '                '
\qecho 'Question 2.1.a'
CREATE VIEW SalaryAbove50000 AS
SELECT p.pid, p.name, p.city, p.birthYear
FROM person p, worksfor w 
WHERE p.pid = w.pid 
AND w.salary>50000;

SELECT *
FROM SalaryAbove50000 sa;

\qecho '                '
\qecho 'Question 2.1.b'
CREATE VIEW IBMEmployee AS
SELECT w.pid 
FROM worksfor w
WHERE w.cname = 'IBM';

SELECT *
FROM IBMEmployee ibm;

\qecho '                '
\qecho 'Question 2.1.c'
SELECT p.pid, p.name
FROM person p, worksfor w 
WHERE p.pid = w.pid 
AND w.cname = 'Apple'
AND w.salary > 50000
AND p.pid IN (SELECT w.pid 
                FROM knows k, worksfor w 
                WHERE w.pid = k.pid1 
                AND k.pid2 NOT IN (SELECT *
                                    FROM IBMEmployee ibm));

\qecho '                '
\qecho 'Question 2.2'
\qecho '                '
\qecho 'Question 2.2.a'
CREATE FUNCTION SalaryAbove(amount integer)
RETURNS TABLE(pid integer, name text, city text, birthYear integer)
language sql
AS $body$
SELECT p.pid, p.name, p.city, p.birthYear
FROM person p, worksfor w 
WHERE p.pid = w.pid 
AND w.salary> amount;
$body$;

\qecho '                '
\qecho 'Salary above 30000'
SELECT * 
FROM SalaryAbove(30000);

\qecho '                '
\qecho 'Salary above 50000'
SELECT * 
FROM SalaryAbove(50000);

\qecho '                '
\qecho 'Salary above 70000'
SELECT * 
FROM SalaryAbove(70000);

\qecho '                '
\qecho 'Question 2.2.b'
CREATE or replace FUNCTION KnowsEmployeeAtCompany(cname text)
RETURNS TABLE(pid integer)
language sql
AS $body$
SELECT DISTINCT k.pid1
FROM worksfor w, knows k 
WHERE w.pid = k.pid2
AND w.cname = $1;
$body$;

\qecho '                '
\qecho 'Person who knows employee at Yahoo'
SELECT * 
FROM KnowsEmployeeAtCompany('Yahoo');

\qecho '                '
\qecho 'Person who knows employee at Google'
SELECT * 
FROM KnowsEmployeeAtCompany('Google');

\qecho '                '
\qecho 'Person who knows employee at Amazon'
SELECT * 
FROM KnowsEmployeeAtCompany('Amazon');

\qecho '                '
\qecho 'Question 2.2.c'
\qecho '                '
\qecho 'Method 1 - Without Views'
WITH sal as (SELECT DISTINCT w.salary from worksfor w)
SELECT s.salary, w1.cname, w1.pid
FROM sal s, worksfor w1 
WHERE s.salary < w1.salary
AND EXISTS(
SELECT 1
FROM knows k, worksfor w2 
WHERE k.pid1 = w1.pid 
AND k.pid2 = w2.pid 
AND w2.cname <> w1.cname 
AND s.salary >= w2.salary);

\qecho '                '
\qecho 'Method 2 - With Views'
-- WITH salary as (SELECT DISTINCT w.salary FROM worksfor w),
--     companydistinct as (SELECT DISTINCT c.cname FROM company c)
-- SELECT w1.pid, w1.cname, w1.salary
-- FROM salary s, companydistinct cd, worksfor w1 
-- WHERE (w1.pid, w1.cname, w1.salary) IN (SELECT sal.pid, w.cname, sal.salary
--                                         FROM SalaryAbove(s.salary) sal, worksfor w
--                                         WHERE w.pid = sal.pid
--                                         AND w.cname = cd.cname
--                                         AND sal.pid IN (SELECT * FROM KnowsEmployeeAtCompany(w.cname)));

-- This code is based on an approach discussed with Vijeet Sharma
SELECT DISTINCT w.salary, c.cname, p.pid 
from  worksfor w, company c, person p, worksfor w1
where p.pid = w1.pid 
and w1.cname = c.cname 
and EXISTS (SELECT p.pid
            FROM SalaryAbove(w.salary) sa 
            WHERE sa.pid = p.pid)
and EXISTS (SELECT DISTINCT * 
            from  knows k4, worksfor w2, company c1, KnowsEmployeeAtCompany(c1.cname) kec
            where c1.cname <> c.cname 
            and p.pid = kec.pid 
            and p.pid = k4.pid1 
            and w2.pid = k4.pid2
            and w.salary >= w2.salary 
            and w2.cname <> c.cname);

\qecho '                '
\qecho 'Question 3.1'
DROP TABLE IF EXISTS tempa;
CREATE TABLE tempa(x  integer,
                primary key(x));
insert into tempa values
  (1),
  (2),
  (3),
  (4),
  (5);

SELECT x, |/x as square_root_x, x^2 as x_squared, 
2^x as two_to_the_power_x, x! as x_factorial, log(x) as logarithm_x
FROM tempa t;

DROP TABLE IF EXISTS tempa;

\qecho '                '
\qecho 'Question 3.2'
DROP TABLE IF EXISTS a;
CREATE TABLE a(x  integer,
                primary key(x));

DROP TABLE IF EXISTS b;
CREATE TABLE b(x  integer,
                primary key(x));

DROP TABLE IF EXISTS c;
CREATE TABLE c(x  integer,
                primary key(x));


\qecho '                '
\qecho 'Question 3.2.a'

\qecho 'insert into A values (1),(2);'
\qecho 'insert into B values (1),(4),(5);'
insert into a values
(1),
(2);

insert into b values
(1),
(4),
(5);

SELECT EXISTS ((SELECT a.x 
                FROM a)
                INTERSECT 
                (SELECT b.x 
                FROM b)) as answer;

select exists(select x 
                from A 
                where x in (select x 
                            from B)) as answer;

DELETE FROM a;

DELETE FROM b;

\qecho 'insert into A values (1),(2);'
\qecho 'insert into B values (3),(4);'
insert into a values
(1),
(2);

insert into b values
(3),
(4);

SELECT EXISTS ((SELECT a.x 
                FROM a)
                INTERSECT 
                (SELECT b.x 
                FROM b)) as answer;

select exists(select x 
                from A 
                where x in (select x 
                            from B)) as answer;

DELETE FROM a;

DELETE FROM b;

\qecho '                '
\qecho 'Question 3.2.b'

\qecho 'insert into A values (1),(2);'
\qecho 'insert into B values (1),(2),(3);'

insert into a values
(1),
(2);

insert into b values
(1),
(2),
(3);

SELECT NOT EXISTS(SELECT a.x
                    FROM a
                    WHERE a.x NOT IN (SELECT b.x
                                        FROM b)) as answer;

SELECT NOT EXISTS((SELECT x FROM A)
                     EXCEPT 
                     (SELECT x FROM B)) as answer;

DELETE FROM a;

DELETE FROM b;

\qecho 'insert into A values (1),(2);'
\qecho 'insert into B values (2),(3);'

insert into a values
(1),
(2);

insert into b values
(2),
(3);

SELECT NOT EXISTS(SELECT a.x
                    FROM a
                    WHERE a.x NOT IN (SELECT b.x
                                        FROM b)) as answer;

SELECT NOT EXISTS((SELECT x FROM A)
                     EXCEPT 
                     (SELECT x FROM B)) as answer;

DELETE FROM a;

DELETE FROM b;

\qecho '                '
\qecho 'Question 3.2.c'
\qecho 'insert into A values (1),(2);'
\qecho 'insert into B values (2),(3);'
\qecho 'insert into C values (1),(2),(3);'
insert into A values (1),(2);
insert into B values (2),(3);
insert into C values (1),(2),(3);

SELECT NOT EXISTS (SELECT c.x
                    FROM c 
                    WHERE c.x NOT IN ((SELECT b.x 
                                        FROM b)
                                        UNION
                                        (SELECT a.x
                                        FROM a
                                        WHERE a.x NOT IN (SELECT b.x
                                                            FROM b)))
AND NOT EXISTS (select x 
                  from   (select x from A 
                           union 
                          select x from B) d 
                  where x not in (select x from C))) as answer;

SELECT NOT EXISTS ((SELECT x from a UNION select x from b) EXCEPT select x from c)
AND NOT EXISTS (SELECT x from c except (select x from a union select x from b)) as answer;

DELETE FROM a;
DELETE FROM b;
DELETE FROM c;

\qecho 'insert into A values (1),(2);'
\qecho 'insert into B values (2),(3);'
\qecho 'insert into C values (1),(2),(4);'
insert into A values (1),(2);
insert into B values (2),(3);
insert into C values (1),(2),(4);

select not exists(select x 
                  from   (select x from a 
                           union 
                          select x from b) d
where x not in (select x from c)) 
and not exists(select x
                from   c
                where  x not in (select x from a) 
                and x not in (select x from b)) as answer;

SELECT NOT EXISTS ((SELECT x from a UNION select x from b) EXCEPT select x from c)
AND NOT EXISTS (SELECT x from c except (select x from a union select x from b)) as answer;

DELETE FROM a;
DELETE FROM b;
DELETE FROM c;

\qecho '                '
\qecho 'Question 3.2.d'
\qecho 'insert into A values (1),(2);'
\qecho 'insert into B values (2);'
\qecho 'insert into C values (2),(4);'
insert into A values (1),
                    (2);
insert into B values (2);
insert into C values (2),
                    (4);

WITH lhs AS ((SELECT x from a EXCEPT select x from b) UNION (SELECT x from b EXCEPT select x from c))
SELECT NOT EXISTS(SELECT l1.x from lhs l1, lhs l2 WHERE l1.x <> l2.x) as answer;

with lhs as ((select x from b except select x from c) union
           (select x from a except select x from b))
select exists (select 1 from lhs 
               except
               select 1 
               from lhs l1, lhs l2
               where l1.x <> l2.x) as answer;


DELETE FROM a;
DELETE FROM b;
DELETE FROM c;

\qecho 'insert into A values (1),(2);'
\qecho 'insert into B values (2),(3);'
\qecho 'insert into C values (2),(4);'
insert into A values (1),
                    (2);
insert into B values (2),
                    (3);
insert into C values (2),
                    (4);

WITH lhs AS ((SELECT x from a EXCEPT select x from b) UNION (SELECT x from b EXCEPT select x from c))
SELECT NOT EXISTS(SELECT l1.x from lhs l1, lhs l2 WHERE l1.x <> l2.x) as answer;

with lhs as ((select x from b except select x from c) union
           (select x from a except select x from b))
select exists (select 1 from lhs 
               except
               select 1 
               from lhs l1, lhs l2
               where l1.x <> l2.x) as answer;

\qecho '                '
\qecho 'Question 3.3'
\qecho '                '
\qecho 'Question 3.3.a'
SELECT NOT EXISTS (
SELECT p.pid 
FROM person p 
WHERE p.pid NOT IN (SELECT ps1.pid 
                    FROM personskill ps1, personskill ps2 
                    WHERE ps1.pid = ps2.pid 
                    AND ps1.skill <> ps2.skill)) as answer;

\qecho '                '
\qecho 'Question 3.3.b'
SELECT EXISTS(
SELECT c.cname 
FROM company c
WHERE 55000 < ALL(SELECT w.salary 
                FROM worksfor w 
                WHERE c.cname = w.cname)) as answer;

\qecho '                '
\qecho 'Question 3.3.c'
select exists( select distinct p1.pid, p2.pid
               from   person p1, person p2
               where p1.pid <> p2.pid
            --    Selecting the people that p2 knows whom p1 dont know
               and not exists(select k2.pid1
                                from   knows k2
                                where  k2.pid1 = p2.pid and
                                    k2.pid2 not in (select k1.pid2
                                                    from   knows k1
                                                    where  k1.pid1 = p1.pid)) 
                --    Selecting the people that p1 knows whom p2 dont know              
                and not exists(select k1.pid1
                                from   knows k1
                                where  k1.pid1 = p1.pid and
                                    k1.pid2 not in (select k2.pid2
                                                    from   knows k2
                                                    where  k2.pid1 = p2.pid))) as answer;

\qecho '                '
\qecho 'Question 3.4'
CREATE TABLE w(a integer, 
                b text);

insert into W values (1,'John'), (2,'Ellen'), (3,'Ann');

-- WITH subquery as (SELECT w1.a 
--                     FROM w w1, w w2
--                     WHERE w1.a = w2.a 
--                     AND w1.b <> w2.b)
-- SELECT
-- case when NOT EXISTS (SELECT * FROM subquery) then w3.a else (SELECT * FROM subquery) end as c 
-- FROM w w3;

-- SELECT w1.a
-- FROM w w1 
-- WHERE w1.a = w2.a 
-- AND w1.b<>w2.b

(SELECT w1.a
FROM w w1, w w2
WHERE NOT EXISTS (SELECT w1.a
                    FROM w w1 
                    WHERE w1.a = w2.a 
                    AND w1.b<>w2.b))
UNION
(SELECT w1.a 
from w w1, w w2 
WHERE EXISTS (SELECT w1.a
            FROM w w1 
            WHERE w1.a = w2.a 
            AND w1.b<>w2.b));


DELETE FROM w;

insert into W values (1,'John'),
                    (2,'Ellen'),
                    (2,'Linda'),
                    (3,'Ann'),
                    (4,'Ann'),
                    (4,'Nick'),
                    (4,'Vince'),
                    (4,'Lisa');

(SELECT w3.a
FROM w w3
WHERE NOT EXISTS (SELECT w1.a
                    FROM w w1,w w2
                    WHERE w1.a = w2.a 
                    AND w1.b<>w2.b))
UNION
(SELECT w1.a 
from w w1
WHERE EXISTS (SELECT w2.a
            FROM w w2
            WHERE w1.a = w2.a 
            AND w1.b<>w2.b));


DELETE FROM w;


\c postgres;

DROP DATABASE osh;