create database osh;

\c osh;

\qecho '                '
\qecho 'Question 1 - BiConnected Graph'
\qecho '                '

DROP TABLE IF EXISTS graph;
CREATE TABLE graph(source int, target int);
DROP TABLE IF EXISTS subGraph;
CREATE TABLE subGraph(source int, target int);
DROP TABLE IF EXISTS tc;
CREATE TABLE tc(source int, target int);
DROP TABLE IF EXISTS crossNodes;
CREATE TABLE crossNodes(source int, target int);

create or replace function biConnected() 
returns boolean as 
$$
declare 
    isBiConnected boolean;
    node RECORD;
BEGIN
    isBiConnected := true;
    drop table if exists allNodes;
    create table allNodes(nodes int);
    insert into allNodes 
    select distinct subquery.nodes from (select g.source as nodes from graph g union select g1.target as nodes from graph g1) subquery;
    perform possibleConnections();    

    for node in select nodes from allNodes
    LOOP
        delete from subGraph;
        insert into subGraph 
        select * from graph g where g.source<>node.nodes and g.target<>node.nodes;
        
        perform tc();

		SELECT INTO isBiConnected NOT EXISTS(SELECT c.source, c.target
		FROM crossNodes c
		WHERE c.source <> node.nodes and c.target <> node.nodes
		EXCEPT
		SELECT t.source, t.target
		FROM tc t);

		IF isBiConnected = false
		THEN EXIT;
		END IF;
    END LOOP;
    RETURN isBiConnected;
END;
$$ language 'plpgsql';

create or replace function possibleConnections()
returns void as 
$$
BEGIN
    delete from crossNodes;
    insert into crossNodes
    select a1.nodes , a2.nodes from allNodes a1, allNodes a2 where a1.nodes <> a2.nodes;
END;
$$ language 'plpgsql';


CREATE OR REPLACE FUNCTION TC ()
RETURNS VOID AS $$
BEGIN
   delete from tc;
   insert into tc select * from subGraph;
   WHILE exists(select * from new_TC_pairs()) 
   LOOP
        insert into tc select * from new_TC_pairs();
   END LOOP;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION new_TC_pairs() 
RETURNS TABLE (source integer, target integer)AS
$$
   (SELECT p1.source, p2.target
    FROM TC p1 JOIN TC p2 ON (p1.target=p2.source))
    EXCEPT
   (SELECT source, target
    FROM TC); 
$$ language sql;

\qecho '                '
\qecho 'Output for Test Data 1'
\qecho '                '
DELETE FROM graph;
DELETE FROM subGraph;
DELETE FROM tc;
DELETE FROM crossNodes;
INSERT INTO graph VALUES(1,2), (2,1), (1,3), (3,1), (2,3), (3,2);
SELECT biConnected();

\qecho '                '
\qecho 'Output for Test Data 2'
\qecho '                '
DELETE FROM graph;
DELETE FROM subGraph;
DELETE FROM tc;
DELETE FROM crossNodes;
INSERT INTO graph VALUES(1,2), (2,1), (1,3), (3,1), (2,3), (3,2), (4,4), (5,2), (6,5), (7,2), (8,5), (9,4);
SELECT biConnected();

drop table if exists graph, subGraph, tc, crossNodes;
drop function biConnected;


\qecho '                '
\qecho 'Question 2 - HITS Algorithm'
\qecho '                '

drop table if exists graph;
create table graph(source integer, target integer);


create or replace function hitsAlgorithm()
returns void AS
$$
DECLARE 
    k integer;
    vertex record;
    authNorm float;
    hubNorm float;
BEGIN
    drop table if exists nodeScores;
    create table nodeScores(node integer, authScore float, hubScore float);
    INSERT INTO nodeScores SELECT DISTINCT a.nodes, 1.0, 1.0 FROM (SELECT g.source nodes FROM graph g UNION SELECT g.target FROM graph g) a;

    k := 20;
    for i in 0..k
    LOOP
        for vertex in select nodeScores.node from nodeScores
        LOOP
        update nodeScores
        set authScore = (select sum(n.hubScore) 
                         from nodeScores n 
                         where n.node in (select g.source from graph g where g.target = vertex.node))
        where nodeScores.node = vertex.node;
        END LOOP;

        authNorm :=  (SELECT sqrt(SUM(pow(n.authScore, 2))) FROM nodeScores n);
        for vertex in select nodeScores.node from nodeScores 
        LOOP
			UPDATE nodeScores 
			SET authScore = nodeScores.authScore/authNorm
			WHERE nodeScores.node = vertex.node;
        END LOOP;

        for vertex in select nodeScores.node from nodeScores
        LOOP
        update nodeScores
        set hubScore = (select sum(n.authScore) 
                         from nodeScores n 
                         where n.node in (select g.target from graph g where g.source = vertex.node))
        where nodeScores.node = vertex.node;
        END LOOP;

        hubNorm :=  (SELECT sqrt(SUM(pow(n.hubScore, 2))) FROM nodeScores n);
        for vertex in select nodeScores.node from nodeScores 
        LOOP
			UPDATE nodeScores 
			SET hubScore = nodeScores.hubScore/hubNorm
			WHERE nodeScores.node = vertex.node;
        END LOOP;

    END LOOP;

    UPDATE nodeScores SET authScore = COALESCE(ROUND(authScore::Numeric, 3), 0);
    UPDATE nodeScores SET hubScore = COALESCE(ROUND(hubScore::Numeric, 3), 0);

END;
$$ language 'plpgsql';


DELETE FROM graph;
DELETE FROM nodeScores;
INSERT INTO graph VALUES(1,2), (1,3), (3,2), (3,4), (4,1);
\qecho '                '
\qecho 'Graph'
\qecho '                '
SELECT * FROM graph;
\qecho '                '
\qecho 'HITS Algorithm Output'
\qecho '                '
SELECT hitsAlgorithm();
SELECT * FROM nodeScores ORDER BY node;


\qecho '                '
\qecho 'Question 3 - tFrequent Sets'
\qecho '                '

drop table if exists document;
create table document(doc text, words text[]);

create or replace function frequentSets(t int) 
returns table(frequent_sets text[]) as
$$ 
declare w text; sub record; word_array text[];
begin

drop table if exists dist_words;
create table dist_words as (select distinct unnest(words) as word from document);

drop table if exists powerset;
create table powerset as (with recursive powerset_view as 
						  (select '{}'::text[] as subset  
						   union      
						   select array(select * from UNNEST(subset) 
										union 
										select word order by 1)      
						   from   powerset_view S, dist_words dw     
						   where  word not in (select * from UNNEST(subset)))
						  select * from powerset_view);

drop table if exists freq_sets;
create table freq_sets as(select p.subset from powerset p, document d
						  where p.subset <@ d.words group by p.subset 
						  having cardinality(array_agg(d.doc))>=frequentSets.t);

return query (select * from freq_sets);
end;
$$ language 'plpgsql';

insert into document values 
('d7', '{C,B,A}'),
('d1', '{A,B,C}'),
('d8', '{B,A}'),
('d4', '{B,B,A,D}'),
('d2', '{B,C,D}'),
('d6', '{A,D,G}'),
('d3', '{A,E}'),
('d5', '{E,F}');

table document;

\qecho '                '
\qecho 'Output of frequentSets(1)'
\qecho '                '
select frequentSets(1);

\qecho '                '
\qecho 'Output of frequentSets(2)'
\qecho '                '
select frequentsets(2);

\qecho '                '
\qecho 'Output of frequentSets(3)'
\qecho '                '
select frequentsets(3);

\qecho '                '
\qecho 'Output of frequentSets(4)'
\qecho '                '
select frequentsets(4);

\qecho '                '
\qecho 'Output of frequentSets(5)'
\qecho '                '
select frequentsets(5);

drop table if exists document,powerset,freq_sets;
drop function frequentsets;


\qecho '                '
\qecho 'Question 4 - Djikstas Algorithm'
\qecho '                '
-- The approach for this question has been discussed with Aman Kumar.
drop table if exists graph_g;
create table graph_g(source integer,target integer,weight integer);


create or replace function dijkstraAlgorithm(s integer) 
returns table(target integer, distance integer) as
$$
declare
    i record;
    j integer;
begin
    drop table if exists outputTable;
    create table outputTable(source integer,target integer,distance integer);
    insert into outputTable(select g.source,g.target,g.weight from graph_g g where g.source=s);
    j:=(select count(*) from graph_g);
    while(j!=0)
    loop
        j=j-1;
        for i in (select * from new1_TC_pairs())
        loop
            insert into outputTable values(i.source,i.target,i.weight);
        end loop;
    end loop;
    update outputTable set distance=0 where outputTable.source=outputTable.target;
    return query(select d.target,min(d.distance) as distance from outputTable d group by d.source,d.target order by d.target);
end;
$$ language plpgsql;

create or replace function new1_TC_pairs() returns table (source integer,target integer,weight integer) as
$$ begin
return query (select outputTable.source,graph_g.target,(graph_g.weight+outputTable.distance) as weight
from outputTable join graph_g on (outputTable.target=graph_g.source)
except
((select dj.source,graph_g.target,dj.distance
from outputTable dj,graph_g where dj.source=graph_g.target)));
end;
$$ language plpgsql;


drop table if exists graph_g;
create table graph_g(source integer,target integer,weight integer);
insert into graph_g values(0,1,2),(1,0,2),(0,4,10),(4,0,10),(1,3,3),(3,1,3),(1,4,7),(4,1,7),(2,3,4),
(3,2,4),(3,4,5),(4,3,5),(4,2,6),(2,4,6);
\qecho 'Result when input node = 0'
\qecho '                '
select * from dijkstraAlgorithm(0);


drop table if exists graph_g;
create table graph_g(source integer,target integer,weight integer);
insert into graph_g values(0,1,2),(1,0,2),(0,4,10),(4,0,10),(1,3,3),(3,1,3),(1,4,7),(4,1,7),(2,3,4),
(3,2,4),(3,4,5),(4,3,5),(4,2,6),(2,4,6);
\qecho 'Result when input node = 1'
\qecho '                '
select * from dijkstraAlgorithm(1);


\qecho '                '
\qecho 'Question 5 - 3-Colourable Graph'
\qecho '                '
-- The approach for this question has been discussed with Sudip Padhye.



CREATE OR REPLACE FUNCTION setColors(currNode integer) 
RETURNS void 
AS $$
DECLARE
	possibleColor RECORD;
	next_node RECORD;
	remainingNodes int;
BEGIN
	FOR possibleColor IN SELECT cp.colors
							FROM colorPalette cp
							EXCEPT
							SELECT nc.color
							FROM graph g, nodeColor nc
							WHERE g.target = nc.node
							AND g.source = currNode 
                            AND nc.color <> 'NA'
	LOOP
		UPDATE nodeColor SET COLOR = possibleColor.colors WHERE node = currNode;
		
		FOR next_node IN SELECT nc1.node
								FROM nodeColor nc, nodeColor nc1, graph g
								WHERE nc.node = g.source
								AND g.target = nc1.node
								AND nc.color <> 'NA' 
                                AND nc1.color = 'NA'
		LOOP
			PERFORM setColors(next_node.node);
		END LOOP;
		
		SELECT INTO remainingNodes COUNT(nc.node) FROM nodeColor nc WHERE nc.color = 'NA';
		
		IF remainingNodes = 0
		THEN 
			UPDATE threeColorable SET result = true; 
			EXIT;
		END IF;
		
	END LOOP;
	
	UPDATE nodeColor SET color = 'NA' WHERE node = currNode;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION threeColorable()
RETURNS boolean
AS $$
DECLARE 
	firstNode int;
	isThreeColorable boolean;
BEGIN
	DROP TABLE IF EXISTS colorPalette;
	CREATE TABLE colorPalette(colors text);
	INSERT INTO colorPalette VALUES('R'), ('G'), ('B');
	DROP TABLE IF EXISTS nodeColor;
	CREATE TABLE nodeColor(node int, color text);
	INSERT INTO nodeColor SELECT DISTINCT g.source, 'NA' FROM graph g;
	DROP TABLE IF EXISTS threeColorable;
	CREATE TABLE threeColorable(result boolean);
	INSERT INTO threeColorable VALUES(false);

	SELECT INTO firstNode MIN(nc.node) FROM nodeColor nc WHERE nc.color = 'NA';
	
	UPDATE nodeColor SET COLOR = 'B' WHERE node = firstNode;
	SELECT INTO firstNode MIN(nc1.node) 
                            FROM nodeColor nc, graph g, nodeColor nc1
                            WHERE nc.node = g.source
                            AND g.target = nc1.node
                            AND nc.color <> 'NA' 
                            AND nc1.color = 'NA';	
	PERFORM setColors(firstNode);
	
	SELECT INTO isThreeColorable result FROM threeColorable;
	RETURN isThreeColorable;
END;
$$ LANGUAGE plpgsql;


\qecho '                '
\qecho 'Test Data 1'
\qecho '                '
DROP TABLE IF EXISTS graph;
CREATE TABLE graph(source int, target int);
INSERT INTO graph VALUES(1,2), (2,3), (3,4), (4,1), (2,1), (3,2), (4,3), (1,4);
\qecho 'Graph'
\qecho '                '
SELECT * FROM graph;
\qecho 'Result'
\qecho '                '
SELECT threeColorable();

\qecho '                '
\qecho 'Test Data 2'
\qecho '                '
DROP TABLE IF EXISTS graph;
CREATE TABLE graph(source int, target int);
INSERT INTO graph VALUES(1,2), (2,3), (3,4), (4,1), (2,1), (3,2), (4,3), (1,4), (1,3), (3,1);
\qecho 'Graph'
\qecho '                '
SELECT * FROM graph;
\qecho 'Result'
\qecho '                '
SELECT threeColorable();

\qecho '                '
\qecho 'Test Data 3'
\qecho '                '
DROP TABLE IF EXISTS graph;
CREATE TABLE graph(source int, target int);
INSERT INTO graph VALUES(1,2), (2,3), (3,4), (4,1), (2,1), (3,2), (4,3), (1,4), (1,3), (3,1), (2,4), (4,2);
\qecho 'Graph'
\qecho '                '
SELECT * FROM graph;
\qecho 'Result'
\qecho '                '
SELECT threeColorable();


\c postgres;

drop database if exists osh;
