select * from info_sales

/* i need the sum of amount per region,country, city
and also the sum of amount per region
*/

--solution 1

select region,country, city, sum(amount) sum_amount , null note
from info_sales
group by region,country, city
union all
select region,null country, null city , sum(amount) sum_amount ,'SUM Per Region' note
from info_sales
group by region
order by  region,country, city

-----------------------------------
--solution 2

select region,country, city, sum(amount) sum_amount , grouping_id (region,country, city) grp_id
from info_sales
group by 
grouping sets ( (region,country, city ) , (region)  )

-------------------------------------
--solution 3
select region,country, city, sum(amount) sum_amount , grouping_id (region,country, city) grp_id
from info_sales
group by rollup (region,country, city )

--then 

select region,country, city, sum(amount) sum_amount , grouping_id (region,country, city) grp_id
from info_sales
group by rollup (region,country, city )
having  grouping_id (region,country, city) in (0,3)
-------------------------------------

--solution 4
select region,country, city, sum(amount) sum_amount , grouping_id (region,country, city) grp_id
from info_sales
group by cube (region,country, city )

--then

select region,country, city, sum(amount) sum_amount , grouping_id (region,country, city) grp_id
from info_sales
group by cube (region,country, city )
having  grouping_id (region,country, city) in (0,3)





