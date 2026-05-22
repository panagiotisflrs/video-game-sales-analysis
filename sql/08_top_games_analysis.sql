/* =========================================
   TOP GAMES ANALYSIS
========================================= */

/*
Objective:
Identify the top 10 highest-selling games in Europe
between 1982 and 2015.
*/
select `Name`, 
		Genre, 
        `Year`,
        EU_Sales
from vgsalesbackup
order by EU_Sales desc
limit 10;

/*
Objective:
Retrieve the top 3 best-selling games in Europe for each year.
*/

with name_year_sales as (
select `Name`, year(`Year`) as `year`, EU_Sales
from vgsalesbackup
order by `year` desc
), `2015` as 
(
select `Name`, `year`, EU_Sales
from name_year_sales
where `year` = 2015
order by EU_Sales desc
limit 3
), `2014` as 
(
select `Name`, `year`, EU_Sales
from name_year_sales
where `year` = 2014
order by EU_Sales
limit 3
), `2013` as 
(
select `Name`, `year`, EU_Sales
from name_year_sales
where `year` = 2013
order by EU_Sales
limit 3
), `2012` as 
(
select `Name`, `year`, EU_Sales
from name_year_sales
where `year` = 2012
order by EU_Sales
limit 3
)
select * 
from `2015`
union all
select * 
from `2014`
union all
select * 
from `2013`
union all
select * 
from `2012`
;
/*
Observation:
This method works, but it is difficult to scale and maintain.
The window-function solution below is significantly more efficient.
*/

/*
Objective:
Use DENSE_RANK() to efficiently retrieve the top 3
best-selling games in Europe for every year.
*/

with top_3_from_all_years as (
select `Name`, 
		year(`Year`) as `year`, 
        EU_Sales, 
        dense_rank( ) over(partition by `year` order by EU_Sales desc) as drnk
from vgsalesbackup
)
select `Name`,
		`year`, 
        EU_Sales
from top_3_from_all_years
where drnk <=3 
order by `year` desc, EU_Sales desc;

/*
Observation:
This method is scalable and adaptable to custom year ranges.
*/

/*
Objective:
Identify the top-performing games in Japan between 2000 and 2015
using window functions.
*/
with top_3_from_all_years as (
select `Name`, 
		year(`Year`) as `year`, 
        JP_Sales, 
        dense_rank( ) over(partition by `year` order by JP_Sales desc) as drnk
from vgsalesbackup
)
select `Name`,
		`year`,
        JP_Sales
from top_3_from_all_years
where drnk <=3 and `year` between 2000 and 2015
order by `year` desc, JP_Sales desc;
-- If i wanted a specific range e.g 2000 - 2015 i could use a between statement.
