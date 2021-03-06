CREATE DATABASE osh;

\c osh;

drop table if exists employee;
drop table if exists company;
drop table if exists jobskill;
drop table if exists manages;

create table company(cname text,
		     city text,
		     PRIMARY KEY (cname, city));

create table employee(id integer, 
                      ename text,
                      city text,
                      cname text,
                      salary integer,
		      PRIMARY KEY (id) );

create table jobskill(id integer, skill text,
		      PRIMARY KEY (id, skill),
		      FOREIGN KEY (id) REFERENCES employee (id));

create table manages(mid integer, eid integer,
		      PRIMARY KEY (mid, eid),
		      FOREIGN KEY (mid) REFERENCES employee (id),
		      FOREIGN KEY (eid) REFERENCES employee (id));

-- Data for the company relation.
INSERT INTO company VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington');

-- Data for the employee relation.
INSERT INTO employee VALUES
     (1001,'Jean','Bloomington','Apple',60000),
     (1002,'Vidya', 'Indianapolis', 'Apple', 45000),
     (1003,'Anna', 'Chicago', 'Amazon', 55000),
     (1004,'Qin', 'Denver', 'Amazon', 55000),
     (1005,'Aya', 'Chicago', 'Google', 60000),
     (1006,'Ryan', 'Chicago', 'Amazon', 55000),
     (1007,'Danielle','Indianapolis', 'Netflix', 50000),
     (1008,'Emma', 'Bloomington', 'Amazon', 50000),
     (1009,'Hasan', 'Bloomington','Apple',60000),
     (1010,'Linda', 'Chicago', 'Amazon', 55000),
     (1011,'Nick', 'NewYork', 'Google', 55000), 
     (1012,'Eric', 'Indianapolis', 'Apple', 50000),
     (1013,'Lisa', 'Indianapolis', 'Netflix', 55000),
     (1014,'Deepa', 'Bloomington', 'Apple', 50000), 
     (1015,'Chris', 'Denver', 'Amazon', 60000),
     (1016,'YinYue', 'Chicago', 'Amazon', 55000),
     (1017,'Latha', 'Indianapolis', 'Netflix', 60000),
     (1018,'Arif', 'Bloomington', 'Apple', 50000);

-- Data for the jobskill relation.
insert into jobskill values
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1008,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'AI'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Programming'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'Programming'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI');

-- Data for the manages relation.
INSERT INTO manages VALUES
   (1001, 1002),
   (1001, 1009),
   (1001, 1012),
   (1009, 1018),
   (1009, 1014),
   (1012, 1014),
   (1003, 1004),
   (1003, 1006),   
   (1003, 1015),
   (1015, 1016),
   (1006, 1008),
   (1006, 1016),
   (1016, 1010),
   (1005, 1011),
   (1013, 1007),
   (1013, 1017);

\qecho '                '
\qecho 'Question 1'
\qecho '                '
\qecho 'Question 1.1'
\qecho '                '
\qecho 'Company Table'
SELECT *
FROM company c;

\qecho 'Employee Table'
SELECT *
FROM employee e;

\qecho 'Jobskill Table'
SELECT *
FROM jobskill j;

\qecho 'Manages Table'
SELECT *
FROM manages m;
\qecho '                '
\qecho 'Question 1.2'
\qecho '                '
\qecho 'CASE 1'
INSERT INTO jobskill VALUES
(1019,'AI');
-- This query leads to an error. This is because the key id of jobskill table is the 
-- foreign key which depends on the primary id in employee table and the key value
-- 1019 does not exist in the employee table.

\qecho '                '
\qecho 'CASE 2'
INSERT INTO jobskill VALUES
(1010, 'AI');
-- This query executes without any errors. This is due to the fact that the foreign key 
-- of jobskill table which references the primary key id in employee table, already has
-- an existing value for the id and the key pair of (id, skill) does not already exist in 
-- the jobskill table

\qecho '                '
\qecho 'CASE 3'
DELETE FROM manages 
WHERE mid = 1016;
-- This query deletes the record from the manages table as the key is a foreign key and
-- not a primary key, which cannot be deleted without the cascading.

\qecho '                '
\qecho 'CASE 4'
INSERT INTO manages VALUES
(1010, 1025);
-- This query generates as error as there is no 1025 in the employee table that contains
-- this primary key, which is used as foreign for the manages table.

\qecho '                '
\qecho 'Dropping the table and redefining them with different key constraints'
\qecho '                '
DROP TABLE company CASCADE;
DROP TABLE employee CASCADE;
drop table if exists jobskill;
drop table if exists manages;

create table company(cname text,
		     city text,
		     PRIMARY KEY (cname, city));

create table employee(id integer, 
                      ename text,
                      city text,
                      cname text,
                      salary integer,
		      PRIMARY KEY (id) );

create table jobskill(id integer, skill text,
		      PRIMARY KEY (id, skill),
		      FOREIGN KEY (id) REFERENCES employee (id) ON DELETE CASCADE);

create table manages(mid integer, eid integer,
		      PRIMARY KEY (mid, eid),
		      FOREIGN KEY (mid) REFERENCES employee (id) ON DELETE CASCADE,
		      FOREIGN KEY (eid) REFERENCES employee (id) ON DELETE CASCADE);

-- Data for the company relation.
INSERT INTO company VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington');

-- Data for the employee relation.
INSERT INTO employee VALUES
     (1001,'Jean','Bloomington','Apple',60000),
     (1002,'Vidya', 'Indianapolis', 'Apple', 45000),
     (1003,'Anna', 'Chicago', 'Amazon', 55000),
     (1004,'Qin', 'Denver', 'Amazon', 55000),
     (1005,'Aya', 'Chicago', 'Google', 60000),
     (1006,'Ryan', 'Chicago', 'Amazon', 55000),
     (1007,'Danielle','Indianapolis', 'Netflix', 50000),
     (1008,'Emma', 'Bloomington', 'Amazon', 50000),
     (1009,'Hasan', 'Bloomington','Apple',60000),
     (1010,'Linda', 'Chicago', 'Amazon', 55000),
     (1011,'Nick', 'NewYork', 'Google', 55000), 
     (1012,'Eric', 'Indianapolis', 'Apple', 50000),
     (1013,'Lisa', 'Indianapolis', 'Netflix', 55000),
     (1014,'Deepa', 'Bloomington', 'Apple', 50000), 
     (1015,'Chris', 'Denver', 'Amazon', 60000),
     (1016,'YinYue', 'Chicago', 'Amazon', 55000),
     (1017,'Latha', 'Indianapolis', 'Netflix', 60000),
     (1018,'Arif', 'Bloomington', 'Apple', 50000);

-- Data for the jobskill relation.
insert into jobskill values
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1008,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'AI'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Programming'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'Programming'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI');

-- Data for the manages relation.
INSERT INTO manages VALUES
   (1001, 1002),
   (1001, 1009),
   (1001, 1012),
   (1009, 1018),
   (1009, 1014),
   (1012, 1014),
   (1003, 1004),
   (1003, 1006),   
   (1003, 1015),
   (1015, 1016),
   (1006, 1008),
   (1006, 1016),
   (1016, 1010),
   (1005, 1011),
   (1013, 1007),
   (1013, 1017);

\qecho '                '
\qecho 'CASE 5'
DELETE FROM employee 
WHERE id = 1011;
-- The delete action takes place because the schema has been modified to use the 
-- delete cascade, which causes the chosen record in the employee table to be dropped 
-- from all other tables where the primary key is referenced.

\qecho '                '
\qecho 'CASE 6'
INSERT INTO company VALUES
('Apple', 'Mumbai');
-- This query works because the key combination of (Apple, Mumbai) does not already
-- exist in the company table.

-- Dropping the modified tables and setting them up again for the queries.

\qecho '                '
DROP TABLE company CASCADE;
DROP TABLE employee CASCADE;
drop table if exists jobskill;
drop table if exists manages;

create table company(cname text,
		     city text,
		     PRIMARY KEY (cname, city));

create table employee(id integer, 
                      ename text,
                      city text,
                      cname text,
                      salary integer,
		      PRIMARY KEY (id) );

create table jobskill(id integer, skill text,
		      PRIMARY KEY (id, skill),
		      FOREIGN KEY (id) REFERENCES employee (id));

create table manages(mid integer, eid integer,
		      PRIMARY KEY (mid, eid),
		      FOREIGN KEY (mid) REFERENCES employee (id),
		      FOREIGN KEY (eid) REFERENCES employee (id));

-- Data for the company relation.
INSERT INTO company VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington');

-- Data for the employee relation.
INSERT INTO employee VALUES
     (1001,'Jean','Bloomington','Apple',60000),
     (1002,'Vidya', 'Indianapolis', 'Apple', 45000),
     (1003,'Anna', 'Chicago', 'Amazon', 55000),
     (1004,'Qin', 'Denver', 'Amazon', 55000),
     (1005,'Aya', 'Chicago', 'Google', 60000),
     (1006,'Ryan', 'Chicago', 'Amazon', 55000),
     (1007,'Danielle','Indianapolis', 'Netflix', 50000),
     (1008,'Emma', 'Bloomington', 'Amazon', 50000),
     (1009,'Hasan', 'Bloomington','Apple',60000),
     (1010,'Linda', 'Chicago', 'Amazon', 55000),
     (1011,'Nick', 'NewYork', 'Google', 55000), 
     (1012,'Eric', 'Indianapolis', 'Apple', 50000),
     (1013,'Lisa', 'Indianapolis', 'Netflix', 55000),
     (1014,'Deepa', 'Bloomington', 'Apple', 50000), 
     (1015,'Chris', 'Denver', 'Amazon', 60000),
     (1016,'YinYue', 'Chicago', 'Amazon', 55000),
     (1017,'Latha', 'Indianapolis', 'Netflix', 60000),
     (1018,'Arif', 'Bloomington', 'Apple', 50000);

-- Data for the jobskill relation.
insert into jobskill values
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1008,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'AI'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Programming'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'Programming'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI');

-- Data for the manages relation.
INSERT INTO manages VALUES
   (1001, 1002),
   (1001, 1009),
   (1001, 1012),
   (1009, 1018),
   (1009, 1014),
   (1012, 1014),
   (1003, 1004),
   (1003, 1006),   
   (1003, 1015),
   (1015, 1016),
   (1006, 1008),
   (1006, 1016),
   (1016, 1010),
   (1005, 1011),
   (1013, 1007),
   (1013, 1017);

\qecho '                '
\qecho 'Question 2'
\qecho '                '
\qecho 'Question 2.1'
SELECT e.id , e.ename , e.salary
FROM employee e
WHERE e.city = 'Indianapolis' AND
      e.salary >= 30000 AND e.salary <= 50000;

\qecho 'Question 2.2'
SELECT e.id, e.ename 
FROM  ( SELECT m.eid, e.cname
	FROM employee e, manages m
	WHERE e.id = m.mid AND
	e.city = 'Bloomington') s, employee e, company c
WHERE s.cname = c.cname AND
      c.city = 'Chicago';

\qecho 'Question 2.3'
SELECT e2.id, e2.ename
FROM employee e1, employee e2, manages m
WHERE m.mid = e1.id AND
      m.eid = e2.id AND
      e1.city = e2.city;

\qecho 'Question 2.4'
SELECT DISTINCT e.id, e.ename
FROM employee e, jobskill j1, jobskill j2, jobskill j3
WHERE e.id = j1.id AND e.id = j2.id AND e.id = j3.id AND
      j1.skill <> j2.skill AND j2.skill<>j3.skill AND j1.skill<>j3.skill;

\qecho 'Question 2.5'
SELECT DISTINCT e.id, e.ename, e.salary
FROM employee e, manages m ,  ( SELECT DISTINCT m.mid
				FROM manages m, jobskill j
				WHERE m.eid = j.id AND
				j.skill = 'Programming') s
WHERE m.eid = s.mid AND
      e.id = m.mid;

\qecho 'Question 2.5 Method 2'
SELECT DISTINCT e.id, e.ename, e.salary
FROM employee e
WHERE e.id IN (SELECT m1.mid
                  FROM manages m1, manages m2, jobskill j
                  WHERE m1.eid = m2.mid 
                  AND m2.eid = j.id 
                  AND j.skill = 'Programming');

\qecho 'Question 2.6'
SELECT m1.eid, m2.eid
FROM manages m1, manages m2
WHERE m1.mid = m2.mid AND
      m1.eid <> m2.eid;

\qecho 'Question 2.7'
(SELECT DISTINCT c.cname
FROM company c)
EXCEPT
(SELECT DISTINCT e.cname
FROM employee e
WHERE e.city = 'Bloomington');

\qecho 'Question 2.7 Method 2'
SELECT DISTINCT c.cname
FROM company c
WHERE c.cname NOT IN (SELECT c.cname
                        FROM company c, employee e
                        WHERE e.cname = c.cname
                        AND e.city = 'Bloomington');


\qecho 'Question 2.8'
(SELECT DISTINCT e.id, e.cname
FROM employee e)
EXCEPT
(SELECT DISTINCT e.id, e.cname
FROM employee e1, employee e
WHERE e1.id <> e.id
AND e.salary <e1.salary);

\qecho 'Question 2.8 Method 2'
SELECT e.cname, e.id
FROM employee e 
WHERE e.id NOT IN (SELECT e1.id
                  FROM employee e1, employee e2
                  WHERE e2.cname = e1.cname
                  AND e1.id <> e2.id
                  AND e2.salary>e1.salary);

\qecho 'Question 2.9'
SELECT e1.id, e1.ename
FROM employee e1
WHERE e1.salary >= ALL(SELECT e.salary 
                        FROM employee e, manages m 
                        WHERE e.id = m.mid 
                        AND e1.id = m.eid);

\qecho 'Question 2.10'
(SELECT DISTINCT e1.id, e1.ename
FROM employee e1, manages m1
WHERE e1.id = m1.mid)
EXCEPT
(SELECT DISTINCT e1.id, e1.ename
FROM employee e1, jobskill j1
WHERE e1.id = j1.id
AND j1.skill IN (SELECT j.skill
                        FROM employee e, manages m, jobskill j
                        WHERE e.id = m.eid
                        AND e1.id = m.mid
                        AND j.id = e.id));

\qecho 'Question 2.10 Method 2'
SELECT distinct e2.id, e2.ename
from employee e2, manages m2
where e2.id = m2.mid 
and e2.id NOT IN (SELECT distinct e.id
                  from employee e, jobskill j
                  where e.id = j.id 
                  and j.skill IN (SELECT j1.skill 
                              from manages m, jobskill j1 
                              where e.id = m.mid
                              and  m.eid = j1.id));


\qecho 'Question 2.10 Method 3'
SELECT DISTINCT e.id, e.ename
FROM employee e, manages m3
WHERE m3.mid = e.id
AND e.id NOT IN (SELECT m.mid
            FROM manages m, jobskill j2
            WHERE  m.mid = j2.id
            AND j2.skill IN (SELECT j.skill
                              FROM jobskill j, manages m1
                              WHERE m1.eid = j.id
                              AND m1.mid = m.mid));

\c postgres;

DROP DATABASE osh;

