--Aggregate Syntax for rank RANK or DENSE_RANK
--RANK(expr [, expr ]...) WITHIN GROUP (ORDER BY expr )

--first let us see this query 
select employee_id, first_name, last_name, salary , 
DENSE_RANK ( ) OVER (  order by salary desc nulls last ) sal_rank
from
employees

--now i want to know the rank for salary 10000 in employees table 

select DENSE_RANK (10000) WITHIN GROUP (ORDER BY salary desc ) ranks
from employees ;

--now i want to know the rank for salary 17000 in employees table 
select DENSE_RANK (17000) WITHIN GROUP (ORDER BY salary desc ) ranks
from employees ;

--you can put value not even in the table 
select DENSE_RANK (30000) WITHIN GROUP (ORDER BY salary desc ) ranks
from employees ;


--now this very important 

--the rank for 10000 for the table is 11
select DENSE_RANK (10000) WITHIN GROUP (ORDER BY salary desc ) ranks
from employees ;

--now if we do this
--the where clause will be executed first 
select DENSE_RANK (10000) WITHIN GROUP (ORDER BY salary desc ) ranks
from employees 
where DEPARTMENT_ID=80

--here is the proof
select employee_id,first_name,last_name, DEPARTMENT_ID, salary , 
DENSE_RANK ( ) OVER (  order by salary desc nulls last ) sal_rank
from employees 
where DEPARTMENT_ID=80
order by salary desc 



-------------------------
--the order of the First_name Lex in table employees
select DENSE_RANK ('Lex') WITHIN GROUP (ORDER BY First_name  ) ranks
from employees ;

select employee_id,first_name, DENSE_RANK ( ) OVER (  ORDER BY First_name ) sal_rank
from employees 

---

select DENSE_RANK ( 30, 'Lex' ) WITHIN GROUP (ORDER BY DEPARTMENT_ID,First_name  ) ranks
from employees ;

select DEPARTMENT_ID,First_name
from employees
ORDER BY DEPARTMENT_ID,First_name 

