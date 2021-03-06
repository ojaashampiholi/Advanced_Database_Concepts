create database osh;

\c osh;

drop table if exists person;
create table person (pid  integer,
                     name text,
                     city text,
                     birthYear integer);

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
  (30,'Aya','NewYork',1995),
-- new
  (31,'Linda','London',1980);
-- 
drop table if exists knows;
create table knows (pid1 integer,
                    pid2 integer);

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
  (16,24),
  (31,3), (31,9), (31,11), (31,20), (31,21), (31,22), (31,23),
-- new
  (31,1), (31,2), (31,4), (31, 5), (31,6), (31,7), (31,8), (31,10), 
  (31,12), (31,14), (31,15), (31,16);
--

drop table if exists company;
create table company(cname text);

insert into company values
  ('Amazon'),
  ('IBM'),
  ('Intel'),
  ('Netflix'),
  ('Yahoo'),
  ('Google'),
  ('Apple'),
  ('Hulu'),
  ('Zoom'),
  ('Microsoft'),
  ('Britbox');

drop table if exists companyLocation;
create table companylocation(cname text,
                     city  text);

insert into companyLocation values
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
                      salary integer);


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
--  The next two tuples were deleted
--  (17,'Google',45000),
--  (18,'Amazon',45000),
  (18,'Amazon',55000),
  (19,'Zoom',45000),
  (20,'Microsoft',55000),
  (21,'Intel',55000),
  (22,'IBM',40000),
  (23,'Apple',40000),
--  The next tuple was deleted
--  (24,'Google',45000),
  (25,'Hulu',50000),
  (26,'Intel',55000),
  (27,'Intel',50000),
  (28,'Intel',50000),
--  The next tuple was deleted
--  (29,'Google',60000),
  (30,'Intel',60000);


drop table if exists jobskill;
create table jobskill(skill text);

insert into jobskill values 
  ('Programming'), 
  ('Databases'), 
  ('AI'), 
  ('Networks'), 
  ('Mathematics'),
-- new 
  ('Algorithms'),
--
  ('OperatingSystems');


drop table if exists personskill;
create table personskill(pid integer,
                         skill text);


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
--  The next tuple was deleted
--  (3,'Programming'),
  (16,'Networks'),
  (5,'Networks'),
  (17,'AI'),
  (24,'Databases'),
  (2,'Databases'),
  (27,'Networks'),
  (28,'Databases'),
  (30,'Databases'),
-- new
  (30,'OperatingSystems'),
-- 
  (4,'Networks'),
  (6,'Networks'),
  (17,'Networks'),
  (23,'Programming'),
-- new
  (1, 'OperatingSystems'),
  (29, 'OperatingSystems'),
  (31, 'Databases'),
-- 
  (20,'Programming');


  -- Set operations and predicates}
-- In these functions let $A$ and $B$ be sets.

-- Set union $A union B$:
create or replace function setunion(A anyarray, B anyarray) 
returns anyarray as
$$
select array( select unnest(A) union select unnest(B) order by 1);
$$ language sql;

-- Set intersection $A intersect B$:
create or replace function setintersection(A anyarray, B anyarray) 
returns anyarray as
$$
select array( select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

-- Set difference $A-B$:
create or replace function setdifference(A anyarray, B anyarray) 
returns anyarray as
$$
select array( select unnest(A) except select unnest(B) order by 1);
$$ language sql;

-- Set membership $x in A$:
create or replace function isIn(x anyelement, A anyarray) 
   returns boolean as
$$
select x = SOME(A);
$$ language sql;

--  Subset test $A is supset of B$:
create or replace function subset(A anyarray, B anyarray) 
   returns boolean as
$$
select A <@ B;
$$ language sql;

-- Superset test $A is superset of B$:
create or replace function superset(A anyarray, B anyarray) 
   returns boolean as
$$
select A @> B;
$$ language sql;

--  Overlap test $A intersect B$ is not empty
create or replace function overlap(A anyarray, B anyarray) 
   returns boolean as
$$
select A && B;
$$ language sql;

--  Disjointness test  $A intersect B$ is is empty
create or replace function disjoint(A anyarray, B anyarray) 
   returns boolean as
$$
select not A && B;
$$ language sql;

\qecho '                '
\qecho 'Example 1'
\qecho '                '
create or replace view companyEmployees as
  (select cname, array_agg(pid order by pid) as employees
   from   worksfor
   group by cname
   union 
   select cname, array[]::int[]
   from   company
   where  cname not in (select cname from worksfor)
   order by cname);

\qecho '                '
\qecho 'Question 1'
\qecho '                '
\qecho 'Question 1.a'
create or replace view cityHasCompanies as
  (select city, array_agg(cname order by cname) as companies
   from   companyLocation
   group by city);

select * from cityHasCompanies;

\qecho '                '
\qecho 'Question 1.b'
create or replace view companyLocations as
  (select cname, array_agg(city order by city) as locations
   from   companyLocation
   group by cname
   union 
    select cname, array[]::text[] as locations
    from company
    where cname not in (select cname from companyLocation)
    order by cname);

select * from companyLocations;

\qecho '                '
\qecho 'Question 1.c'
create or replace view knowsPersons as
  (select pid1 as pid, array_agg(pid2 order by pid2) as persons
   from   knows
   group by pid1
   union
    select pid, array[]::int[]
    from person
    where pid not in (select pid1 from knows)
    order by pid);

select * from knowsPersons;

\qecho '                '
\qecho 'Question 1.d'
create or replace view isKnownByPersons as
  (select pid2 as pid, array_agg(pid1 order by pid1) as persons
   from   knows
   group by pid2
   union
    select pid, array[]::int[]
    from person
    where pid not in (select pid2 from knows)
    order by pid);

select * from isKnownByPersons;

\qecho '                '
\qecho 'Question 1.e'
create or replace view personHasSkills as
  (select pid, array_agg(skill order by skill) as skills
   from   personskill
   group by pid
   union
    select pid, array[]::text[]
    from person
    where pid not in (select pid from personskill)
    order by pid);

select * from personHasSkills;
\qecho '                '
\qecho 'Question 1.f'

create or replace view skillOfPersons as
  (select skill, array_agg(pid order by pid) as persons
   from   personskill
   group by skill
   union
    select skill, array[]::int[]
    from jobskill
    where skill not in (select skill from personskill)
    order by skill);

select * from skillOfPersons;

-- select * from cityHasCompanies;
-- select * from companyLocations;
-- select * from knowsPersons;
-- select * from isKnownByPersons;
-- select * from personHasSkills;
-- select * from skillOfPersons;
\qecho '                '
\qecho 'Question 2'
\qecho '                '
\qecho 'Question 2.a'
select p.pid, p.name 
from person p
where isIn(p.pid, array(select k.pid
                          from knowsPersons k
                          where cardinality(array(select w.pid
                                                  from worksfor w
                                                  where w.cname = 'Amazon' 
                                                  and isIn(w.pid,k.persons))) >=2))
order by 1;

\qecho '                '
\qecho 'Question 2.b'
select  p.pid, p.name 
from    person p
where   isIn(p.pid, array(select k.pid
                          from   knowsPersons k
                          where  superset(k.persons,array(select w.pid 
                                                          from   worksfor w 
                                                          where  w.cname = 'Amazon' and
                                                                 w.salary <= 40000))))
order by 1;


\qecho '                '
\qecho 'Question 2.c'
select unnest(setdifference) as skill
from setdifference(array(select skill from jobskill), array(select distinct unnest(skills) as skills
                                                            from personHasSkills
                                                            where isIn(pid, array(select unnest(employees)
                                                                            from companyEmployees 
                                                                            where isIn(cname, (select companies
                                                                                                from cityHasCompanies
                                                                                                where city = 'Bloomington'))))))
order by 1;

\qecho '                '
\qecho 'Question 2.d'
select unnest(setdifference) as skill
from setdifference(array(select skill from jobskill), array(select distinct unnest(skills) as skills
                                                            from personHasSkills
                                                            where isIn(pid, (select employees
                                                                                from companyEmployees
                                                                                where cardinality(employees)>5))))
order by 1;

\qecho '                '
\qecho 'Question 2.e'
select p.pid 
from person p
where subset((select p1.skills 
                from personHasSkills p1 
                where p1.pid = p.pid ),
            (array(select distinct unnest(skills)
                    from personHasSkills
                    where isIn(pid, array(select pid 
                                    from worksfor 
                                    where cname = 'Amazon' 
                                    and salary<50000)))))
order by 1;

\qecho '                '
\qecho 'Question 2.f'
select p.pid 
from person p
where cardinality(setdifference((array(select * from jobskill)),(select skills 
                                                                 from personHasSkills p1
                                                                 where p.pid = p1.pid))) = 4
order by 1;

\qecho '                '
\qecho 'Question 2.g'
select p.pid, p.name, setintersection((select k.persons
                               from   knowsPersons k
                               where  k.pid = p.pid),
                              (select employees
                               from   companyEmployees
                               where  cname = 'Amazon'))
from   person p
order by 1;

\qecho '                '
\qecho 'Question 2.h'
select count(*)
from (select p1.pid, p2.pid
        from   person p1, person p2
        where  not subset((select persons
                        from   isKnownbyPersons k
                        where  k.pid = p1.pid),
                        (select persons
                        from   KnowsPersons k
                        where  k.pid = p2.pid))) subquery;

\qecho '                '
\qecho 'Question 2.i'
select pid, setintersection(skills, array(select unnest(skills)
                                            from personHasSkills 
                                            where isIn(pid, (select setunion((select employees
                                                            from companyEmployees
                                                            where cname = 'Google'), 
                                                            (select employees
                                                            from companyEmployees
                                                            where cname = 'Amazon'))))))
from personHasSkills
order by 1;

\qecho '                '
\qecho 'Question 2.j'
select c1.cname, c2.cname
from   company c1, company c2
where  cardinality(array(select w.pid
                         from   worksfor w
                         where  w.salary > 50000 and
                                isIn(w.pid, (select employees
                                             from   companyEmployees
                                             where  cname = c1.cname))))
       =
       cardinality(array(select w.pid
                         from   worksfor w
                         where  w.salary < 50000 and
                                isIn(w.pid, (select employees
                                             from   companyEmployees
                                             where  cname = c2.cname))))
order by 1,2;

\qecho '                '
\qecho 'Question 2.k'
with yahooEmployeeSkills as (select array(select unnest(skills)
                                    from personHasSkills
                                    where isIn(pid, (select employees 
                                                    from companyEmployees
                                                    where cname = 'Yahoo'))) as skills),
subquery as (select array(select p.pid
            from person p 
            where subset((select skills 
                        from personHasSkills 
                        where pid = p.pid), 
                        (select skills from yahooEmployeeSkills)))as persons) 
select p.pid, p.name
from   person p
where  not superset( (select k.persons
                      from   knowsPersons k
                      where  k.pid = p.pid),
                     (select persons
                      from   subquery))
order by 1;


\qecho '                '
\qecho 'Question 2.l'
-- select array (select unnest(persons)
--                 from knowsPersons 
--                 where isIn(pid, (select employees 
--                                 from companyEmployees
--                                 where cname = 'Amazon')));


-- select array(select distinct unnest(ce.employees)
--                                   from   companyEmployees ce
--                                   where  not isIn('Bloomington', (select cl.locations
--                                                                   from   companylocations cl
--                                                                   where  ce.cname = cl.cname)));

-- select setunion((select array (select unnest(persons)
--                 from knowsPersons 
--                 where isIn(pid, (select employees 
--                                 from companyEmployees
--                                 where cname = 'Amazon')))),
--                 (select array(select distinct unnest(ce.employees)
--                                         from   companyEmployees ce
--                                         where  not isIn('Bloomington', (select cl.locations
--                                                                         from   companylocations cl
--                                                                         where  ce.cname = cl.cname)))));

select p.pid, p.name
from   person p
where  cardinality((select k.persons
                    from   knowsPersons k
                    where  k.pid = p.pid)) 
       <
       cardinality(setunion((select array (select unnest(persons)
                from knowsPersons 
                where isIn(pid, (select employees 
                                from companyEmployees
                                where cname = 'Amazon')))),
                (select array(select distinct unnest(ce.employees)
                                        from   companyEmployees ce
                                        where  not isIn('Bloomington', (select cl.locations
                                                                        from   companylocations cl
                                                                        where  ce.cname = cl.cname))))));


\c postgres;

drop database osh;
