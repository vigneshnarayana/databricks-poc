/*

The LAG function provides access to a row
at a given offset prior to the current position, 
The LEAD function provides access to a row at a
given offset after the current position.


LAG(value_expr [, offset ] [, default ])
   OVER ([ query_partition_clause ] order_by_clause)
  
LEAD(value_expr [, offset ] [, default ])
   OVER ([ query_partition_clause ] order_by_clause)
   
value_expr - Can be a column or a built-in function
offset - The number of rows preceeding/following the current row, 
from which the data is to be retrieved. The default value is 1.
default - The value returned if the offset is outside the scope of the window. The default value is NULL
   
*/

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE 
FROM EMPLOYEES
ORDER BY HIRE_DATE

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE ,
LAG(HIRE_DATE) OVER ( ORDER BY HIRE_DATE ) prev_hire_date ,
lead(HIRE_DATE) OVER ( ORDER BY HIRE_DATE ) next_hire_date 
FROM EMPLOYEES

--If you do not specify the offset, the default is 1.


SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE ,
LAG(HIRE_DATE,1) OVER ( ORDER BY HIRE_DATE ) prev_hire_date ,
lead(HIRE_DATE,1) OVER ( ORDER BY HIRE_DATE ) next_hire_date 
FROM EMPLOYEES

--now see this 
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE ,
LAG(HIRE_DATE,3) OVER ( ORDER BY HIRE_DATE ) prev_3_hire_date ,
lead(HIRE_DATE,3) OVER ( ORDER BY HIRE_DATE ) next_3_hire_date 
FROM EMPLOYEES

--now let see how to use the default  
--LAG(value_expr [, offset ] [, default ])
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE ,
LAG(HIRE_DATE,3,0) OVER ( ORDER BY HIRE_DATE ) prev_3_hire_date ,
lead(HIRE_DATE,3,0) OVER ( ORDER BY HIRE_DATE ) next_3_hire_date 
FROM EMPLOYEES



SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE ,
LAG(to_char(HIRE_DATE),3,'no data') OVER ( ORDER BY HIRE_DATE ) prev_3_hire_date ,
lead(to_char(HIRE_DATE),3,'no data') OVER ( ORDER BY HIRE_DATE ) next_3_hire_date 
FROM EMPLOYEES
-------------------

--let us use partition

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE ,department_id,
LAG(HIRE_DATE) OVER ( partition by department_id ORDER BY HIRE_DATE ) prev_hire_date ,
lead(HIRE_DATE) OVER ( partition by department_id ORDER BY HIRE_DATE ) next_hire_date 
FROM EMPLOYEES

