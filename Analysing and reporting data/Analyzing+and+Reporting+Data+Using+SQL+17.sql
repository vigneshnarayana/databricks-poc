--case 1

--how oracle execute this
select employee_id, salary , 
first_value(salary) over ( ) fv,
last_value(salary) over ( ) lv
from employees

--1 it will execute 

select employee_id, salary
from employees

--then apply the first_value and last_value


--case 2

--how oracle execute this
select employee_id, salary , 
first_value(salary) over ( ) fv,
last_value(salary) over ( ) lv
from employees
order by salary
--1 it will execute 

select employee_id, salary
from employees
order by salary
--then apply the first_value and last_value


--case 3

--how oracle execute this
select employee_id, salary ,department_id, 
first_value(salary) over (partition by department_id ) fv,
last_value(salary) over ( partition by department_id) lv
from employees
where department_id in (20,30)

--1 it will execute 

select employee_id, salary ,department_id 
from employees
where department_id in (20,30)
order by department_id
--then apply the first_value and last_value



--case 3

--how oracle execute this
select employee_id, salary ,department_id, 
first_value(salary) over (partition by department_id ) fv,
last_value(salary) over ( partition by department_id) lv
from employees
where department_id in (20,30)
order by employee_id

--1 it will execute 

select employee_id, salary ,department_id 
from employees
where department_id in (20,30)
order by department_id
--then apply the first_value and last_value
--then will make order by employee_id






