/*
The CUBE operator is an additional switch in the GROUP BY clause in a SELECT statement. The
CUBE operator can be applied to all aggregate functions, including AVG, SUM, MAX, MIN, and COUNT. 
It is used to produce result sets that are typically used for cross-tabular reports. 

ROLLUP vs CUBE
ROLLUP produces only a fraction of possible subtotal combinations, 
whereas CUBE produces subtotals for all
possible combinations of groupings specified in the GROUP BY clause, and a grand total.
*/

--one column rollup vs cube
select department_id , count(employee_id) emp_count 
FROM
employees
where department_id is not null
group by rollup (department_id);

select department_id , count(employee_id) emp_count 
FROM
employees
where department_id is not null
group by cube (department_id)


select department_id ,job_id, sum(salary) sum_sal 
FROM
employees
where department_id is not null
group by ROLLUP (department_id ,job_id) 
--now go to Rollup_vs_Cube.xlsx


select department_id ,job_id, sum(salary) sum_sal 
FROM
employees
where department_id is not null
group by cube (department_id ,job_id) 



--without rollup
--the grand total
select null department_id , null job_id , sum(salary) sum_sal
from employees
where department_id is not null 
---
union all
--the total per each job
select  null department_id ,  job_id , sum(salary) sum_sal
from employees
where department_id is not null
group by job_id
union all
--the toal per department_id,job_id
select  department_id ,  job_id , sum(salary) sum_sal
from employees
where department_id is not null
group by department_id, job_id
union all
--the total per each dept
select  department_id , null job_id , sum(salary) sum_sal
from employees
where department_id is not null
group by department_id
order by 1,2



-------------------------------------
select * from info_sales


select region, country,city, sum(amount) 
from info_sales
group by  rollup (region, country,city )


select region, country,city, sum(amount) 
from info_sales
  group by  cube (region, country,city )
  
select region, country,city,shop, sum(amount) 
from info_sales2
group by  cube (region, country,city ,shop)





