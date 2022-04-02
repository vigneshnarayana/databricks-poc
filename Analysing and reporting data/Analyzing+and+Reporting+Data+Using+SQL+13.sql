drop table supermarket_trans;

create table supermarket_trans
( trans_id number,
  trans_date  date,
  product_code varchar2(100),
  qty number,
  price number,
 constraint  supermarket_pk primary key (trans_id)
 )
 
insert into supermarket_trans values (1,sysdate,'AZ0001' ,1,30);
insert into supermarket_trans values (2,sysdate,'AB0003' ,2,10);
insert into supermarket_trans values (3,sysdate,'BB8003' ,3,5);
insert into supermarket_trans values (4,sysdate,'ZB0004' ,1,15);
insert into supermarket_trans values (5,sysdate,'AC0002' ,5,2);
insert into supermarket_trans values (6,sysdate,'AC0d09' ,5,2);
COMMIT;
 
SELECT  trans_id,to_char(trans_date,'dd-mm-yyyy hh24:mi:ss' ) trans_date ,
product_code ,qty* price amount
from supermarket_trans 
where trunc(TRANS_DATE)=trunc(sysdate)

SELECT  trans_id,to_char(trans_date,'dd-mm-yyyy hh24:mi:ss' ) trans_date ,
product_code ,qty* price amount,
sum(qty* price) over () today_total
from supermarket_trans 
where trunc(TRANS_DATE)=trunc(sysdate)


--the best practice of runing_total is to use (order by PK)
--q1
SELECT  trans_id,to_char(trans_date,'dd-mm-yyyy hh24:mi:ss' ) trans_date ,
product_code ,qty* price amount,
sum(qty* price) over ( order by trans_id ) runing_total
from supermarket_trans 
where trunc(TRANS_DATE)=trunc(sysdate)
--q2
--this is the same
-- RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW is the default
SELECT  trans_id,to_char(trans_date,'dd-mm-yyyy hh24:mi:ss' ) trans_date ,
product_code ,qty* price amount,
sum(qty* price) over ( order by trans_id  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) runing_total
from supermarket_trans 
where trunc(TRANS_DATE)=trunc(sysdate)
--q3
--also same result cz number of ranges=number of rows
SELECT  trans_id,to_char(trans_date,'dd-mm-yyyy hh24:mi:ss' ) trans_date ,
product_code ,qty* price amount,
sum(qty* price) over ( order by trans_id  rows BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) runing_total
from supermarket_trans 
where trunc(TRANS_DATE)=trunc(sysdate)

--now see what will happen if we do this
--this is totaly not logic
SELECT  trans_id,to_char(trans_date,'dd-mm-yyyy hh24:mi:ss' ) trans_date ,
product_code ,qty* price amount,
sum(qty* price) over ( order by qty* price ) runing_total
from supermarket_trans 
where trunc(TRANS_DATE)=trunc(sysdate)






 