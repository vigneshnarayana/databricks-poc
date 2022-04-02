/*
--Analytic Syntax  for PERCENT_RANK 
PERCENT_RANK () OVER ([query_partition_clause] order_by_clause)

returns the percent
rank of a value relative to a group of values

(rank of row in its partition - 1) / (number of rows in the partition - 1)
*/

select employee_id, first_name, salary, rank () over (order by salary desc ) 
from employees

--now when using PERCENT_RANK, the logic is to make order using Asc
--PERCENT_RANK =(rank of row in its partition - 1) / (number of rows in the partition - 1)
select employee_id, first_name, salary, 
rank () over (order by salary  ) sal_rank_in_Asc ,
PERCENT_RANK () over (order by salary  ) sal_PERCENT_RANK
from employees

--The following query returns the top 30% of employees in the company based on their pay.
select * from
(
select employee_id, first_name, salary, 
rank () over (order by salary  ) sal_rank_in_Asc ,
PERCENT_RANK () over (order by salary  ) sal_PERCENT_RANK
from employees 
)
where sal_PERCENT_RANK>=0.7
-----------------------------------------------------------------------------------------------
--PERCENT_RANK =(rank of row in its partition - 1) / (number of rows in the partition - 1)
select employee_id, first_name, department_id,salary, 
rank () over ( PARTITION BY department_id order by salary  ) sal_rank_in_Asc ,
PERCENT_RANK () over (PARTITION BY department_id order by salary  ) sal_PERCENT_RANK
from employees


select employee_id, first_name, department_id,salary, 
rank () over ( PARTITION BY department_id order by salary  ) sal_rank_in_Asc ,
PERCENT_RANK () over (PARTITION BY department_id order by salary  ) sal_PERCENT_RANK
from employees
where department_id=30

select employee_id, first_name, department_id,salary, 
rank () over (  order by salary  ) sal_rank_in_Asc ,
PERCENT_RANK () over ( order by salary  ) sal_PERCENT_RANK
from employees
where department_id=30
------------------------------------------------------------------------------------------------

drop table movies;

create table movies
(movie_name varchar2(100),
 no_of_votes number
 );

insert into movies values ('Smurfs: The Lost Village',1000);
insert into movies values ('Fifty Shades Darker',1500);
insert into movies values ('Power Rangers',500);
insert into movies values ('The Mummy',2000);
commit;

select movie_name, no_of_votes , 
no_of_votes/ ( select  sum(no_of_votes) from movies   ) *100  votes_PERCENT
from movies



select movie_name, no_of_votes , 
no_of_votes/ ( select  sum(no_of_votes) from movies   ) *100 ||'%'  votes_PERCENT,
PERCENT_RANK () OVER ( order by no_of_votes)  votes_PERCENT_rank
from movies


--Aggregate Syntax  for PERCENT_RANK 
--PERCENT_RANK(expr [, expr ]...) WITHIN GROUP (ORDER BY expr )
--the formula will be like this
--imgain that you insert new record 
--the it will be PERCENT_RANK =(rank of row in its partition - 1) / (number of rows in the partition - 1)
select PERCENT_RANK (1500) WITHIN GROUP (order by no_of_votes)
from movies

select PERCENT_RANK (600) WITHIN GROUP (order by no_of_votes)
from movies

select PERCENT_RANK (1900) WITHIN GROUP (order by no_of_votes)
from movies
