/*
LISTAGG function Syntax
Aggregate Syntax: LISTAGG(measure_expr [, 'delimiter']) WITHIN GROUP (order_by_clause) 
Analytic Syntax : LISTAGG(measure_expr [, 'delimiter']) WITHIN GROUP (order_by_clause)[OVER query_partition_clause]
For a specified measure, LISTAGG orders data within each group specified 
in the ORDER BY clause and then concatenates the values of the measure column.
*/
--first lets execute this select

select DEPARTMENT_ID, first_name
FROM 
EMPLOYEES
WHERE  DEPARTMENT_ID = 30
order by FIRST_NAME;

--Aggregate Examples
SELECT LISTAGG(FIRST_NAME, ', ')
         WITHIN GROUP (ORDER BY  FIRST_NAME) "Emp_list" 
FROM EMPLOYEES
WHERE department_id = 30;
  
SELECT DEPARTMENT_ID, LISTAGG(FIRST_NAME, ', ')
         WITHIN GROUP (ORDER BY  FIRST_NAME) "Emp_list" 
FROM EMPLOYEES
WHERE department_id = 30
group by DEPARTMENT_ID
  
SELECT DEPARTMENT_ID, LISTAGG(FIRST_NAME, '|')
         WITHIN GROUP (ORDER BY  FIRST_NAME) "Emp_list" 
FROM EMPLOYEES
group by DEPARTMENT_ID
  
-----------------------------------------------------------------

 
-- i need a list of jobs in each department_id
--
SELECT DEPARTMENT_ID, LISTAGG(job_id, ', ')
         WITHIN GROUP (ORDER BY  job_id)     "jobs_list" 
FROM EMPLOYEES
group by DEPARTMENT_ID
--how to pick the distinct job_id in each DEPARTMENT_ID ???

--step 1

SELECT  DEPARTMENT_ID, job_id 
 FROM EMPLOYEES  
group by DEPARTMENT_ID, job_id
order by 1,2

--step 2
select DEPARTMENT_ID, 
LISTAGG(job_id, ', ') WITHIN GROUP (ORDER BY  job_id)     "Emp_list" 
from
(
SELECT  DEPARTMENT_ID, job_id 
 FROM EMPLOYEES  
group by DEPARTMENT_ID, job_id
order by 1,2
)
group by DEPARTMENT_ID
  

  
---------
--in most cases we use  LISTAGG as Aggregate , not as Analytic

SELECT DEPARTMENT_ID, LISTAGG(FIRST_NAME, '|')
         WITHIN GROUP (ORDER BY  FIRST_NAME) "Emp_list" 
FROM EMPLOYEES
group by DEPARTMENT_ID

--see now what will happen if we did this 
  
SELECT DEPARTMENT_ID, LISTAGG(FIRST_NAME, '|')
         WITHIN GROUP (ORDER BY  FIRST_NAME) OVER (PARTITION BY department_id) "Emp_list" 
FROM EMPLOYEES

SELECT employee_id, FIRST_NAME, DEPARTMENT_ID, LISTAGG(FIRST_NAME, '|')
         WITHIN GROUP (ORDER BY  FIRST_NAME) OVER (PARTITION BY department_id) "Emp_list" 
FROM EMPLOYEES



  