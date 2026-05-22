/* =========================================
   BEST-SELLING GAMES AND GENRES
========================================= */

/*
Objective:
Identify the highest-selling games across different regions and genres.
This helps highlight regional market leaders.
*/

-- Finding the best seller game in different regions per genre. Slight focus on Japan.
select Genre, 
	   max(NA_Sales) as `Best seller in NA`,  
       max(EU_Sales) as `Best seller in EU`, 
       max(JP_Sales) as ` Best seller in Japan`,  
       max(Other_Sales) as `Best seller in Other countries` 
from vgsales
group by Genre
order by `Best seller in Japan` desc;

select `Name`, 
		Genre, 
        JP_Sales
from vgsales
where JP_Sales = 10.22; #Pokemon Red/Pokemon Blue.

/*
Objective:
Identify the highest-selling video games across different global regions, regardless of genre.
This helps highlight the strongest-performing titles in each market.
*/

select max(NA_Sales) as `Best seller in NA`, 
	   max(EU_Sales) as `Best seller in EU`, 
       max(JP_Sales) as ` Best seller in Japan`, 
       max(Other_Sales) as `Best seller in Other countries` 
from vgsales;

-- Japan.
select `Name`, 
		Genre, 
        year(`Year`),
        JP_Sales
from vgsales
where JP_Sales = 10.22;#Pokemon Red/Blue.

-- North America.
select `Name`, 
		Genre, 
        year(`Year`),
        NA_Sales
from vgsales
where NA_Sales = 41.49; #Wii Sports.

-- Europe.
select `Name`, 
		Genre, 
        year(`Year`),
        EU_Sales
from vgsales
where EU_Sales = 29.02; #Wii Sports.

-- Other regions.
select `Name`, 
		Genre, 
        year(`Year`),
        Other_Sales
from vgsales
where Other_Sales = 10.57; #GTA San Adreas.

/*
Objective:
Identify the best-selling video game genre in each region.
This method works correctly, but it becomes difficult to scale
because additional queries are required to retrieve supporting details.
For better readability and scalability, the CTE method below is preferred.
*/
select max(na) as `best seller in NA`,  
	   max(eu) as `best seller in EU`, 
       max(jp) as `best seller in Japan`, 
       max(other) as `best seller in Other countries`
from (
select Genre, 
	   round(sum(NA_Sales),3) as na,
       round(sum(EU_Sales),3) as eu, 
	   round(sum(JP_Sales),3) as jp,
       round(sum(Other_Sales),3) as other
from vgsales
group by Genre
)as max_sales
order by `best seller in NA` desc;

/*
Objective:
Use Common Table Expressions (CTEs) to identify the top-performing
video game genre in each region.

This approach is cleaner, easier to read, and more scalable
than the previous method.
*/
with genre_sales as
(
select Genre, 
	   round(sum(NA_Sales),3) as na,
       round(sum(EU_Sales),3) as eu, 
       round(sum(JP_Sales),3) as jp, 
       round(sum(Other_Sales),3) as other
from vgsales
group by Genre
), 
na_best_seller as (
select Genre, 
	   na as sales
from genre_sales
order by sales desc
limit 1
),
eu_best_seller as (
select Genre,
	   eu as sales
from genre_sales
order by sales desc
limit 1
),
jp_best_seller as (
select Genre, 
	   jp as sales
from genre_sales
order by sales desc
limit 1
),
Other_best_seller as (
select Genre,
	   other as sales
from genre_sales
order by sales desc
limit 1
)
select * 
from 
na_best_seller #Shooter.
union all
select * 
from
eu_best_seller #Shooter.
union all
select * 
from
jp_best_seller #Role-Playing.
union all
select * 
from
Other_best_seller; #Action.