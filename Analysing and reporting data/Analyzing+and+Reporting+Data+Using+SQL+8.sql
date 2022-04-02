/*
NTILE(expr) OVER ([ query_partition_clause ] order_by_clause)
The NTILE analytic function allows you to break a result set into a specified number of approximately equal groups
*/

drop table class_list;

create table class_list
(student_id number,
 name varchar2(100)
);

insert into class_list values (1,'David');
insert into class_list values (2,'Alexis');
insert into class_list values (3,'Khaled');
insert into class_list values (4,'Ali');
insert into class_list values (5,'Ford');
insert into class_list values (6,'Max');
insert into class_list values (7,'Noor');
insert into class_list values (8,'Sara');
insert into class_list values (9,'Leen');
insert into class_list values (10,'Sajed');
insert into class_list values (11,'Mazen');
insert into class_list values (12,'Randi');

commit;


select * from class_list;

--now i need to split the studnets to 4 groups 

--here will be based on order by name
select student_id,name , NTILE(4) over (order by name )
from class_list;

--let us add one more studnet
insert into class_list values (13,'Fatima');

select student_id,name , NTILE(4) over (order by name )
from class_list;

--let us add one more studnet
insert into class_list values (14,'Aya');

select student_id,name , NTILE(4) over (order by name )
from class_list;




