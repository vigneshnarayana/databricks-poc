/*Aggregate functions VS Analytic functions
Aggregate functions:aggregates data from several rows into a single result row.
return one result per group 
(reduce the number of rows returned by the query)
*/

--for example, i have 107 records in employees table
select * from employees

--if we do this

select avg(salary) sal_avg
from
employees


select department_id , avg(salary) sal_avg
from
employees
group by department_id

/*
Analytic functions also operate on subsets of rows, similar to aggregate functions in GROUP BY queries,
but they do not reduce the number of rows returned by the query.
Analytic Function Syntax:
analytic_function([ arguments ]) OVER (analytic_clause)
ex: rank(sal) over (order by sal desc)
The analytic_clause breaks down into the following optional elements.
[ query_partition_clause ] [ order_by_clause [ windowing_clause ] ]

The windowing_clause is an extension of the order_by_clause and as such, 
it can only be used if an order_by_clause is present.
note: some Analytic functions need  order_by_clause Mandatory ( for example rank)

Functions followed by an asterisk (*) allow the full syntax, including the windowing_clause.
AVG *
CORR *
COUNT *
COVAR_POP *
COVAR_SAMP *
CUME_DIST
DENSE_RANK
FIRST
FIRST_VALUE *
LAG
LAST
LAST_VALUE *
LEAD
LISTAGG
MAX *
MEDIAN
MIN *
NTH_VALUE *
NTILE
PERCENT_RANK
PERCENTILE_CONT
PERCENTILE_DISC
RANK
RATIO_TO_REPORT
REGR_ (Linear Regression) Functions *
ROW_NUMBER
STDDEV *
STDDEV_POP *
STDDEV_SAMP *
SUM *
VAR_POP *
VAR_SAMP *
VARIANCE *
*/

select employee_id, first_name, salary
from employees; 

select employee_id, first_name, salary, avg (salary) 
from employees; --this will give error 


select employee_id, first_name, salary, avg (salary) over ()  avg_sal
from employees

--you can do it without Analytic 
select employee_id, first_name, salary, (select  avg (salary) from employees  )  avg_sal
from employees

--the where will be exectued first, then Analytic function
select employee_id, first_name, salary, avg (salary) over ()  avg_sal
from employees
where first_name like 'A%'

--the where will be exectued first, then Analytic function , then finaly the order by
select employee_id, first_name, salary, avg (salary) over ()  avg_sal
from employees
where first_name like 'A%'
order by employee_id


select employee_id, first_name, salary, department_id,
avg (salary) over ( partition by department_id )  avg_sal_per_dept
from employees


select employee_id, first_name, salary, department_id,
count (employee_id) over ( partition by department_id )  count_per_dept
from employees






