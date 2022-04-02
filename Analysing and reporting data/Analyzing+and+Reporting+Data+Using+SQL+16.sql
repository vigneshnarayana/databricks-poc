--first_value & last_value
--allow the full syntax
/*
first_value|LAST_VALUE (expr) [ { RESPECT | IGNORE } NULLS ]
OVER (analytic_clause)
*/
  
select employee_id, salary 
from employees
order by salary



--q1
select employee_id, salary , first_value(salary) over ( )
from employees
order by salary

/*
how oracle execute this over ( )???
it will execute this first

select employee_id, salary 
from employees
order by salary

then will apply the first_value
*/

--q2
select employee_id, salary , min(salary) over ( )
from employees
order by salary 



--q3
select employee_id, salary , first_value(salary) over ( order by salary )
from employees

--q4
select employee_id, salary , first_value(salary) over ( order by salary )
from employees
order by salary

--q5
select employee_id, salary , 
first_value(salary) over ( order by salary range between unbounded PRECEDING  and current row )
from employees
order by salary


--q6
select employee_id, salary , first_value(salary) over ( order by salary )
from employees
order by employee_id

--so q1,q2,q3,q4,q5 give same result and same order
--q6 same result but not same order
--------------------------------

drop table understand_RESPECT_IGNORE;

create table understand_RESPECT_IGNORE
( val number );

insert into understand_RESPECT_IGNORE values (10);
insert into understand_RESPECT_IGNORE values (20);
insert into understand_RESPECT_IGNORE values (null);
insert into understand_RESPECT_IGNORE values (30);
commit;

select * from understand_RESPECT_IGNORE
order by val;

select * from understand_RESPECT_IGNORE
order by val desc;

select val,first_value(val) over ( order by val desc )
from understand_RESPECT_IGNORE


select val,first_value(val) IGNORE nulls over (  order by val desc   RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW )
from understand_RESPECT_IGNORE 




