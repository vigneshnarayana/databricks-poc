select employee_id, first_name||' '||last_name name, salary,
avg(salary) over () avg_sal
from employees

select employee_id, first_name||' '||last_name, salary,department_id ,
avg(salary) over (partition by department_id ) avg_sal_per_dept
from employees

/*
 
The windowing_clause gives some analytic functions a further degree of control 
over this window within the current partition, or whole result set if no partitioning clause is used. 
The windowing_clause is an extension of the order_by_clause 
it can only be used if an order_by_clause is present. 
The windowing_clause has two basic forms.
RANGE BETWEEN start_point AND end_point
ROWS BETWEEN start_point AND end_point

When using ROWS BETWEEN, you are indicating a specific number of rows relative to the current row, 
either directly, or via an expression (number of rows is fixed in calculation) 
when you use RANGE BETWEEN you are referring to a range of values in a specific column relative 
to the value in the current row. 
As a result,Oracle doesn't know how many rows are included in the range until the ordered set is created.
*/


--because AVG allow the full syntax, so when you put over (order by EMPLOYEE_ID )
-- oracle will make defalt windowing_clause
-- the default windowing_clause is: RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
--so q1 and q2 the same
--note:  EMPLOYEE_ID is PK, and this is the best practice when doing  moving avergae
--q1
select employee_id, first_name||' '||last_name, salary,
avg(salary) over (order by EMPLOYEE_ID ) moving_avg
from employees

--q2
select employee_id, first_name||' '||last_name, salary,
avg(salary) over (order by EMPLOYEE_ID RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) moving_avg
from employees
--UNBOUNDED PRECEDING : The window starts at the first row of the partition, or the whole result set if no partitioning clause is used

--now see what will happen when we do this over (order by salary ) 
--q3 and q4 the same
--q3
select employee_id, first_name||' '||last_name, salary,
avg(salary) over (order by salary ) moving_avg
from employees

--q4
select employee_id, first_name||' '||last_name, salary,
avg(salary) over (order by salary RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW  ) moving_avg
from employees

--but we can do this to change the formula
--q5

select employee_id, first_name||' '||last_name, salary,
avg(salary) over (order by salary ROWS  BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW  ) moving_avg
from employees







