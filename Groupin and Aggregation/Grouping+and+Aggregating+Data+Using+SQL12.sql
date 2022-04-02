--Concatenated Groupings
select region,country, city , sum(amount) sum_amount,GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by  
GROUPING SETS (
        (region), (country, city  )
      )
      
 
--The result is a cross-product of groupings from each GROUPING SET.     
select region,country, city , sum(amount) sum_amount,GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by  
GROUPING SETS (region ) , GROUPING SETS (country,city)

--The result is a cross-product of groupings from each GROUPING SET.     
select region,country, city , shop, sum(amount) sum_amount,GROUPING_ID(region, country,city) AS grouping_id
from info_sales2
group by  
GROUPING SETS (region ) , GROUPING SETS (country,city,shop)

--The result is a cross-product of groupings from each GROUPING SET.  
select region,country, city , shop, sum(amount) sum_amount,GROUPING_ID(region, country,city) AS grouping_id
from info_sales2
group by  
GROUPING SETS (region ,country) , GROUPING SETS (city,shop)