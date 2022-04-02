--note: we created this table in Grouping and Aggregating Data Using SQL 5.sql
select * from  info_sales

select region,country, city , sum(amount) sum_amount
from info_sales
group by region,country, city 

select region,country, city , sum(amount) sum_amount
from info_sales
group by rollup (region,country, city )

--1
select region,country, city , sum(amount) sum_amount ,  GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by 
GROUPING SETS  (
              (region,country, city ) , (country) 
              )
              
--2

select region,country, city , sum(amount) sum_amount ,  GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by 
GROUPING SETS  (
              (region,country, city ) , () 
              )
              
--3

select region,country, city , sum(amount) sum_amount ,  GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by 
GROUPING SETS  (
              (region,country, city ) , (region) 
              )
              
--4

select region,country, city , sum(amount) sum_amount ,  GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by 
GROUPING SETS  (
              (region,country, city ) , (region,country) 
              )
              
              
--5

select region,country, city , sum(amount) sum_amount ,  GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by 
GROUPING SETS  (
              (region,country, city ) , (region,country) ,(city) , ()
              )              
              
              
/*


ROLLUP(a, b,c) =
GROUPING SETS (
                (a,b,c) ,(a,b) ,(a) , ()
              )
              
CUBE(a, b, c)  = 
GROUPING SETS
(
(a, b, c), (a, b), (a, c), (b, c),(a), (b), (c), ()
)


*/

  --this is very very important          
select region,country, city , sum(amount) sum_amount ,  GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by 
GROUPING SETS  (
               (region,country, city )
              )            
                        
 -----------------------           
select region,country, city , sum(amount) sum_amount ,  GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by 
GROUPING SETS  (
               region,country, city 
              )   
              
              
select region,country, city , sum(amount) sum_amount ,  GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by 
GROUPING SETS  ( (region ),(country),( city )
              )  
 -----------------------             
--this will give error   
select region,country, city , sum(amount) sum_amount ,  GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by 
GROUPING SETS  ( (region ),(country)
              )  
-------



  ---try to know this by ur self           
select region,country, city , sum(amount) sum_amount ,  GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by 
GROUPING SETS  (
               (region,country, city ) , cube(region,country)
              )  
              