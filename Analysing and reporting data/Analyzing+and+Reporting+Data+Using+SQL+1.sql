--Analytic Syntax for rank
--RANK ( ) OVER ( [query_partition_clause] order_by_clause )
/*
Query processing using analytic functions takes place in three stages. 
First, all joins, WHERE, GROUP BY, and HAVING clauses are performed. 
Second, the result set is made available to the analytic functions and all their calculations take place. 
Third, if the query has an ORDER BY
clause at its end, the ORDER BY is processed to allow for precise output ordering.
*/

--we will start by simple table
drop table emp;

create table emp
(emp_id number primary key,
 name varchar2(100),
 salary number
);

insert into emp values (100,'khaled' ,400);
insert into emp values (200,'Steven' ,100);
insert into emp values (300,'Lex' ,300);
insert into emp values (400,'John' ,320);

commit;

select emp_id, name, salary 
from emp

select emp_id, name, salary , RANK ( ) OVER (  order by salary desc) sal_rank
from emp

--now let us add another record with salary 300
insert into emp values (500,'Ahmed' ,300);
commit;

--using rank could lead to gaps
select emp_id, name, salary , RANK ( ) OVER (  order by salary desc) sal_rank
from emp

--we can solve this by using DENSE_RANK

select emp_id, name, salary , DENSE_RANK ( ) OVER (  order by salary desc) sal_rank
from emp

--now let us add one record to the table with empty salary
insert into emp values (600,'ali' ,null);
commit;

--when using order by desc , the null appear first
select emp_id, name, salary , DENSE_RANK ( ) OVER (  order by salary desc) sal_rank
from emp

-- we have 2 solutions

select emp_id, name, salary , DENSE_RANK ( ) OVER (  order by nvl(salary ,0) desc) sal_rank
from emp


select emp_id, name, salary , DENSE_RANK ( ) OVER (  order by salary desc nulls last) sal_rank
from emp