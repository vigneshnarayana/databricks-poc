select department_id ,job_id, count(employee_id) emp_count 
FROM
employees
where department_id is not null
group by  department_id ,job_id 
order by department_id ;
--take the results on excel Rollup_desc.xls

--without ROLLUP
select department_id ,job_id, count(employee_id) emp_count 
FROM
employees
where department_id is not null
group by  department_id ,job_id 
    union all
select department_id , null job_id, count(employee_id) emp_count 
FROM
employees
where department_id is not null
group by  department_id 
    union all
select null department_id , null job_id, count(employee_id) emp_count 
FROM
employees
where department_id is not null
order by department_id ,job_id

--with ROLLUP
select department_id ,job_id, count(employee_id) emp_count 
FROM
employees
where department_id is not null
group by ROLLUP (department_id ,job_id) 


select department_id ,job_id, sum(salary) sum_sal 
FROM
employees
where department_id is not null
group by ROLLUP (department_id ,job_id) 