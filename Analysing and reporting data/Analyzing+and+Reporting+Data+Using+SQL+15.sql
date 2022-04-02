--q1
select employee_id, first_name||last_name, department_id, salary,
sum(salary) over (PARTITION BY department_id order by employee_id ) runing_sal_per_dept
from
employees;


--q2
select employee_id, first_name||last_name, department_id, salary,
sum(salary) over (PARTITION BY department_id order by employee_id 
    RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) runing_sal_per_dept
from
employees;

--q3
select employee_id, first_name||last_name, department_id, salary,
sum(salary) over (PARTITION BY department_id order by employee_id 
    rows BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) runing_sal_per_dept
from
employees;

--how we can make the prev query without Analytic fnction

--step 1
select employee_id, first_name||last_name name , department_id, salary
from
employees a
order by department_id,employee_id

--step 2
select employee_id, name, department_id ,salary,
(select sum(salary) from  employees b where b.department_id=main_q.department_id 
and b.employee_id<=main_q.employee_id) runing_sal_per_dept
from
(
select employee_id, first_name||last_name name , department_id, salary
from
employees 
order by department_id,employee_id
) main_q
