drop table info_sales;

create table info_sales
( trans_id number primary key,
  region varchar2(100),
  country varchar2(100), 
  city  varchar2(100),
  amount number
);

insert into info_sales values (1,'Asia','UAE','Abu Dhabi',400) ;
insert into info_sales values (2,'Asia','UAE','Abu Dhabi',600) ;
insert into info_sales values (3,'Asia','UAE','Duabi',300) ;
insert into info_sales values (4,'Asia','UAE','Duabi',120) ;
insert into info_sales values (5,'Africa','Egypt','Cairo',309) ;
insert into info_sales values (6,'Africa','Egypt','Cairo',123) ;
insert into info_sales values (7,'Europe','Spain','Madrid',109) ;
insert into info_sales values (8,'Europe','Spain','Madrid',153) ;
insert into info_sales values (9,'Europe','Spain','Barcelona',193) ;
insert into info_sales values (10,'Asia','Jordan','Amman',300) ;
insert into info_sales values (11,'Asia','Jordan','Zarqa',120) ;
commit;

select * from info_sales

select region, country,city, sum(amount) 
from info_sales
group by region, country,city

select region, country,city, sum(amount) 
from info_sales
group by  rollup (region, country,city )





  