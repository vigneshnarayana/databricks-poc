--all group functions ignore null values except count(*)
drop table test;

create table test
(val number );

insert into test values (10 );
insert into test values (10 );
insert into test values (20 );
insert into test values (30 );
insert into test values (null );

select * from test;

select count(val) from test;
select count(*) from test;


select 1 from test

select count(1) from test;

select count( distinct val) from test;

