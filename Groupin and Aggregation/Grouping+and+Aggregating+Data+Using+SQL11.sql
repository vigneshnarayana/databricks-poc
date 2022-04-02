--A composite column is a collection of columns that are
--treated as a unit.

select region,country, city , sum(amount) sum_amount,GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by rollup (region,country, city )


select region,country, city , sum(amount) sum_amount, GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by rollup (region, (country, city ) )

--go to Composite Columns.xlsx  Tab=(Composite Columns part 1)
----------------------------

  select region,country, city , sum(amount) sum_amount,GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by cube (region,country, city )


select region,country, city , sum(amount) sum_amount, GROUPING_ID(region, country,city) AS grouping_id
from info_sales
group by cube (region, (country, city ) )

--go to Composite Columns.xlsx  Tab=(Composite Columns part 2)