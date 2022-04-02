/*windowing_clause

RANGE BETWEEN start_point AND end_point
ROWS BETWEEN start_point AND end_point

Possible values for "start_point" and "end_point" are:
UNBOUNDED PRECEDING  (Only available for start points )
UNBOUNDED FOLLOWING  (Only available for end points )
CURRENT ROW   (Can be used as start or end point.)
value_expr PRECEDING : A physical or logical offset before the current row using a constant or expression 
value_expr FOLLOWING :As above, but an offset after the current row
*/
drop table test_windowing_clause;

create table test_windowing_clause
(val number );

insert into test_windowing_clause values (1);
insert into test_windowing_clause values (2);
insert into test_windowing_clause values (3);
insert into test_windowing_clause values (3);
insert into test_windowing_clause values (4);
insert into test_windowing_clause values (4);
insert into test_windowing_clause values (5);
commit;

select * from test_windowing_clause
order by val;

--q1
select val, 
sum(val) over(order by val ) , 
sum(val) over(order by val RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW )  
from test_windowing_clause 


--q2
select val, 
sum(val) over(order by val RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING )  
from test_windowing_clause 

--q3
select val, 
sum(val) over(order by val RANGE BETWEEN 1 PRECEDING AND CURRENT ROW )
from test_windowing_clause 

--q4
select val, 
sum(val) over(order by val rows BETWEEN 1 PRECEDING AND CURRENT ROW )
from test_windowing_clause 

--q5
select val, 
sum(val) over(order by val rows BETWEEN 1 PRECEDING AND 1 FOLLOWING )
from test_windowing_clause 

--q6 --error
select val, 
sum(val) over(order by val rows BETWEEN 1 FOLLOWING  AND 1 PRECEDING )
from test_windowing_clause 

