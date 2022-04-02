drop table info_sales2;

create table info_sales2
( trans_id number primary key,
  region varchar2(100),
  country varchar2(100), 
  city  varchar2(100),
  Shop varchar2(100),
  amount number
);

insert into info_sales2 values (1,'Asia','UAE','Abu Dhabi','ABC',400) ;
insert into info_sales2 values (2,'Asia','UAE','Abu Dhabi','ABC',600) ;
insert into info_sales2 values (3,'Asia','UAE','Duabi','z1',300) ;
insert into info_sales2 values (4,'Asia','UAE','Duabi','z1',120) ;
insert into info_sales2 values (5,'Africa','Egypt','Cairo','c1',309) ;
insert into info_sales2 values (6,'Africa','Egypt','Cairo','c2',123) ;
insert into info_sales2 values (7,'Europe','Spain','Madrid','e1',109) ;
insert into info_sales2 values (8,'Europe','Spain','Madrid','e2',153) ;
insert into info_sales2 values (9,'Europe','Spain','Barcelona','b1',193) ;
insert into info_sales2 values (10,'Asia','Jordan','Amman','ABC',300) ;
insert into info_sales2 values (11,'Asia','Jordan','Zarqa','ABC',120) ;
commit;

select * from info_sales2

select region, country,city,shop, sum(amount) 
from info_sales2
group by region, country,city,shop

select region, country,city,shop, sum(amount) 
from info_sales2
group by  rollup (region, country,city ,shop)


-- group by  rollup same rules of group by  
--all cols in the select list should be in group by rollup clause
--this will give error
select region, country,city,shop, sum(amount) 
from info_sales2
group by  rollup (region, country,city)

