--Analytic Syntax for rank
--RANK ( ) OVER ( [query_partition_clause] order_by_clause )
/*
Query processing using analytic functions takes place in three stages. 
First, all joins, WHERE, GROUP BY, and HAVING clauses are performed. 
Second, the result set is made available to the analytic functions and all their calculations take place. 
Third, if the query has an ORDER BY
clause at its end, the ORDER BY is processed to allow for precise output ordering.
*/

--now how oracle execute this statement
--if you know this, then u will never face any issue :)

select employee_id, first_name, salary, DEPARTMENTS.DEPARTMENT_ID ,RANK ( ) OVER (  order by salary desc ) sal_rank
from
employees  left outer join
DEPARTMENTS
on (employees.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID) 
where employees.DEPARTMENT_ID=100
order by first_name

--stage 1
--oracle will execute this , without the rank and without the select order by clause 
select employee_id, first_name, salary, DEPARTMENTS.DEPARTMENT_ID
from
employees  left outer join
DEPARTMENTS
on (employees.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID) 
where employees.DEPARTMENT_ID=100

--stage 2
--the rank function will work on stage 1 result and he will make defult order acording to function  
select employee_id, first_name, salary, DEPARTMENTS.DEPARTMENT_ID ,RANK ( ) OVER (  order by salary desc ) sal_rank
from
employees  left outer join
DEPARTMENTS
on (employees.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID) 
where employees.DEPARTMENT_ID=100

--stage 3, the order by clause  ( which is in the select ) will be executed, so the ral_rank will be the same
--but the order of records will be changed 
select employee_id, first_name, salary, DEPARTMENTS.DEPARTMENT_ID ,RANK ( ) OVER (  order by salary desc ) sal_rank
from
employees  left outer join
DEPARTMENTS
on (employees.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID) 
where employees.DEPARTMENT_ID=100
order by first_name
