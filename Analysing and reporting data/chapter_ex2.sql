show con_name

select name,open_mode
from v$pdbs;

alter session set container=training

show con_name

create user hr identified by hr;
grant create session to hr;
grant create table,create view to hr; 
grant  create procedure to hr;
grant create synonym, create trigger to hr;
grant unlimited tablespace to hr;

