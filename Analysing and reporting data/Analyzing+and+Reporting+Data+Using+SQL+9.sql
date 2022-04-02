/*ROWNUM vs ROW_NUMBER
ROWNUM is pseudocolumn ( column behaves like a table column but not stored on disk )

For each row returned by a query, the ROWNUM pseudocolumn returns a number indicating the order in 
which Oracle selects the row from a table or set of joined rows. 
The first row selected has a ROWNUM of 1, the second has 2, and so on.
*/

select employee_id, first_name, salary
from
EMPLOYEES


select rownum,employee_id, first_name, salary
from
EMPLOYEES

--the order is exected last, remember that 
select rownum,employee_id, first_name, salary
from
EMPLOYEES
order by salary

--if the order is important for you, then do subquery like this
select rownum,employee_id, first_name, salary
from
(
select employee_id, first_name, salary
from
EMPLOYEES
order by salary
)


--top N
--i need the highest 2 sal

select employee_id, first_name, salary
from
EMPLOYEES
order by salary desc 


select  employee_id, first_name, salary
from
(
select employee_id, first_name, salary
from
EMPLOYEES
order by salary desc 
)
where rownum<=2

--but we have 2 employees that have sal =17000

select * from employees
order by salary desc

--fetch first 2 rows only  ( will not solve the issue )
select * from employees
order by salary desc
fetch first 2 rows only

--fetch first 2 rows  with ties ( will  solve the issue )
select * from employees
order by salary desc
fetch first 2 rows  with ties
-----------------


-- ROWNUM is pseudocolumn
select rownum,employee_id, first_name, salary
from
EMPLOYEES

--ROW_NUMBER() OVER ([ query_partition_clause ] order_by_clause)
/*
. It is used to assign a unique number from 1-N to the rows within a partition. 
At first glance this may seem similar to the RANK and DENSE_RANK analytic functions, 
but the ROW_NUMBER function ignores ties and always gives a unique number to each row.
*/
select employee_id, first_name, salary, 
ROW_NUMBER() OVER (order by salary desc ) r_num
from
EMPLOYEES

select employee_id, first_name, salary, 
ROW_NUMBER() OVER (order by salary desc ) r_num,
dense_rank() OVER (order by salary desc ) ranking
from
EMPLOYEES


--remember that the orginal order by exected last
select employee_id, first_name, salary, 
ROW_NUMBER() OVER (order by salary desc ) r_num
from
EMPLOYEES
order by first_name


select employee_id, first_name, salary, department_id ,
ROW_NUMBER() OVER (partition by department_id order by employee_id )  emp_rownum_per_dept
from
EMPLOYEES





