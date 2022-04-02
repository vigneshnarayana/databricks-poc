/*
--Analytic Syntax  for CUME_DIST 
CUME_DIST () OVER ([query_partition_clause] order_by_clause)
CUME_DIST calculates the cumulative distribution of a value in a group of values. 
The range of values returned by CUME_DIST is >0 to <=1
CUME_DIST=( the last record number of rank  in its partition ) / (number of rows in the partition )
*/
drop table test_scores;
create table test_scores
(name varchar2(100),
 score number 
 )

insert into test_scores values ('khaled',1);
insert into test_scores values ('John',2);
insert into test_scores values ('Ali',3);
insert into test_scores values ('Salah',4);
insert into test_scores values ('Lex',5);
insert into test_scores values ('Dani',6);
insert into test_scores values ('Lara',7);
insert into test_scores values ('Sara',8);
insert into test_scores values ('Sajed',9);
insert into test_scores values ('Rao',10);
commit;

SELECT name, score ,
RANK() OVER ( ORDER BY score) AS "RANK" ,
PERCENT_RANK() OVER ( ORDER BY score) AS "PERCENT_RANK" ,
CUME_DIST() OVER ( ORDER BY score) AS "CUME_DIST"
FROM test_scores

--PERCENT_RANK: Sajed has score better then 88% of the studnets, so his score execluded form the calcaltion 
--CUME_DIST : 90% of the scores less than or equal Sajed score 9/10
--CUME_DIST=( the last record number of rank  in its partition ) / (number of rows in the partition )

drop table test_scores;
create table test_scores
(name varchar2(100),
 score number 
 )

insert into test_scores values ('khaled',1);
insert into test_scores values ('John',5);
insert into test_scores values ('Ali',5);
insert into test_scores values ('Salah',6);
insert into test_scores values ('Lex',6);
insert into test_scores values ('Dani',7);
insert into test_scores values ('Lara',8);
insert into test_scores values ('Sara',8);
insert into test_scores values ('Sajed',8);
insert into test_scores values ('Rao',10);
commit;

SELECT name, score ,
RANK() OVER ( ORDER BY score) AS "RANK" ,
PERCENT_RANK() OVER ( ORDER BY score) AS "PERCENT_RANK" ,
CUME_DIST() OVER ( ORDER BY score) AS "CUME_DIST"
FROM test_scores

--PERCENT_RANK: Sajed has score better then 66% of the studnets, 
--CUME_DIST : 90% of the scores less than or equal Sajed score 9/10
--CUME_DIST=( the last record number of rank  in its partition ) / (number of rows in the partition )
-------------------------------

--now
--Aggregate Syntax  for CUME_DIST 
--CUME_DIST(expr [, expr ]...) WITHIN GROUP (ORDER BY expr )
--imgain that you insert new record then , make the formula
--CUME_DIST=( the last record number of rank  in its partition ) / (number of rows in the partition )
select CUME_DIST(7)  WITHIN GROUP (ORDER BY score)
from test_scores
