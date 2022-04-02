select department_id , count(employee_id) emp_count 
FROM
employees
group by department_id
order by department_id ;

select * from EMPLOYEES
where department_id is null;

select department_id , count(employee_id) emp_count 
FROM
employees
where department_id is not null
group by department_id
order by department_id ;

select to_char(department_id ) , count(employee_id) emp_count 
FROM
employees
where department_id is not null
group by department_id
union all
select 'Grand Total' , count(employee_id) emp_count
from EMPLOYEES
where department_id is not null

--ROLLUP is an extension of the GROUP BY clause.
--Use the ROLLUP operation to produce cumulative aggregates, such as Grandtotals & subtotals.
/*
The ROLLUP operator creates groupings by moving in one direction, 
from right to left, along the list
of columns specified in the GROUP BY clause. 
It then applies the aggregate function to these groupings.
*/

select department_id , count(employee_id) emp_count 
FROM
employees
where department_id is not null
group by ROLLUP (department_id )
order by department_id ;

select department_id , sum(salary) sum_sal
FROM
employees
where department_id is not null
group by ROLLUP (department_id )
order by department_id ;

--very important to know 
select department_id , avg(salary) avg_sal
FROM
employees
where department_id is not null
group by ROLLUP (department_id )
order by department_id ;

select  avg(salary) avg_sal
FROM
employees
where department_id is not null




























