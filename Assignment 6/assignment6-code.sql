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


-- Views
-- Example 1

-- Consider the view {\tt companyEmployees(cname,employees)} which
-- associates with each company, identified by a cname, the set of pids
-- of persons who work for that company.  This view can be defined as
-- follows:

create or replace view companyEmployees as
   select distinct cname, array(select w.pid 
                                from   worksfor w
                                where  w.cname = c.cname order by pid) as employees
   from   company c
   order by cname;

-- An alternative definition is as follows

create or replace view companyEmployees as
  (select cname, array_agg(pid order by pid) as employees
   from   worksfor
   group by cname
   union 
   select cname, array[]::int[]
   from   company
   where  cname not in (select cname from worksfor)
   order by cname);

-- Example 2
-- Find the pid of each person who knows a person who has a salary greater than 55000.

-- In relational style

select distinct k.pid1
from   knows k, worksfor w
where  k.pid2 = w.pid and w.salary > 55000
order by 1;

-- In object-relational SQL style
-- Version 1

select distinct k.pid
from   knowsPersons k, worksfor w
where  isIn(w.pid, k.Persons)  and w.salary > 55000
order by 1;

-- In object-relational SQL style
-- Version 2

select distinct unnest(k.persons)
from   worksfor w, knownByPersons k
where  w.pid = k.pid  and w.salary > 55000;

-- Example 3
-- Find the pid and name of each person who has both the `Databases' and
-- `Programming' skills

select p.pid, p.name
from   person p
where  p.pid in (select ps.pid
                 from   personHasSkills ps
                 where  subset(array['Databases', 'Programming'], ps.skills))
order by 1,2;

-- Alternatively, and preferred 

select p.pid, p.name
from   person p
where  isIn(p.pid, array(select ps.pid
                         from   personHasSkills ps
                         where  subset(array['Databases', 'Programming'], ps.skills)))
order by 1,2;


-- Example 4

-- Consider the query ``\emph{Find the pid and name of each person who
-- knows at least 5 persons."}

select p.pid, p.name
from   person p
where  cardinality((select k.persons
                    from   knowsPersons k
                    where  k.pid = p.pid)) >= 5;

-- Example 5

-- Consider the query ``Find the pid and name of each person along
-- with the set of his of her skills that are not among the skills of
-- person who work for `Amazon'."

select p.pid, p.name, setdifference((select ps.skills
                                     from   personHasSkills ps
                                     where  ps.pid = p.pid),
                                     array(select unnest(ps.skills)
                                           from   personHasSkills ps
                                           where  isIn(ps.pid, (select ce.employees
                                                                from   companyEmployees ce
                                                                where  ce.cname = 'Amazon'))))
from   person p;


-- Example 6

-- Find each $(p,c)$ pair where $p$ is the pid of a person and $c$ is the
-- name of a company located in 'Bloomington' and such that each person
-- with birthyear less that 1990 who is known by $p$ is an employee of
-- company $c$."

select p.pid, c.cname
from   person p, company c
where  isIn(c.cname, (select companies
                      from   cityHasCompanies
                      where  city = 'Bloomington')) and
       subset(array(select p1.pid
                    from   person p1
                    where  p1.birthyear <= 1990 and 
                           isIn(p1.pid, (select k.persons
                                         from   knowspersons k
                                         where  k.pid = p.pid))),
              array(select p1.pid
                    from   person p1
                    where  isIn(p1.pid, (select c1.employees
                                         from   companyEmployees c1
                                         where  c1.cname = c.cname))));


