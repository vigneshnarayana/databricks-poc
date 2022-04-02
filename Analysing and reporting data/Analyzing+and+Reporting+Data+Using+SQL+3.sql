--Analytic Syntax for rank
--RANK ( ) OVER ( [query_partition_clause] order_by_clause )
/*
Query processing using analytic functions takes place in three stages. 
First, all joins, WHERE, GROUP BY, and HAVING clauses are performed. 
Second, the result set is made available to the analytic functions and all their calculations take place. 
Third, if the query has an ORDER BY
clause at its end, the ORDER BY is processed to allow for precise output ordering.
*/

select employee_id, first_name, last_name, salary , DENSE_RANK ( ) OVER (  order by salary desc nulls last ) sal_rank
from
employees


--now we can add partition , so will rank acoring to the partition
--the rank gets reset whenever the group changes
select employee_id, first_name, last_name, department_id, salary , 
DENSE_RANK ( ) OVER (  partition by department_id order by salary desc nulls last ) sal_rank
from
employees

--now the ranking will be based on 2 columns department_id,job_id
select employee_id, first_name, last_name, department_id,job_id, salary , 
DENSE_RANK ( ) OVER (  partition by department_id,job_id order by salary desc nulls last ) sal_rank
from
employees


select department_id ,  sum(salary) ,
DENSE_RANK ( ) OVER (   order by sum(salary)  desc  ) sum_sal_rank
from
employees
group by department_id




--the rank for the employee's hire_date

select employee_id, first_name, last_name, department_id,job_id, salary ,hire_date ,
DENSE_RANK ( ) OVER (  order by hire_date  nulls last ) hire_date_rank
from
employees

----------

--the rank for the employee's hire_date per dept

select employee_id, first_name, last_name, department_id ,hire_date ,
DENSE_RANK ( ) OVER (  partition by department_id order by hire_date  nulls last ) hire_date_rank
from
employees

--------------------------
-- we need the list of employees for highest sal for each dept 


--solution 1


select nvl(department_id,0) , max(salary) max_sal_per_dept
from employees
group by department_id
order by 2

--then 

select employee_id, first_name, last_name , department_id, salary
from employees
where (nvl(department_id,0),salary) in (select nvl(department_id,0) , max(salary) max_sal_per_dept
                                from employees
                                group by department_id
                                )
order by salary

--solution 2

select employee_id, first_name, last_name, department_id, salary , 
DENSE_RANK ( ) OVER (  partition by department_id order by salary desc nulls last ) sal_rank
from
employees

select * from
(
select employee_id, first_name, last_name, department_id, salary , 
DENSE_RANK ( ) OVER (  partition by department_id order by salary desc nulls last ) sal_rank
from
employees
)
where sal_rank=1

--solution 3

select employee_id, first_name, last_name , department_id, salary
from employees a
where exists ( select 1 from 
               (select nvl(department_id,0) department_id , max(salary) max_sal_per_dept
                                  from employees
                                  group by department_id ) b
            where nvl(b.department_id,0)=nvl(a.department_id,0)
            and b.max_sal_per_dept=a.salary
             )
order by salary
