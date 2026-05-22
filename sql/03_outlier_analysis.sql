/* =========================================
   OUTLIER ANALYSIS
========================================= */
 
/*
Objective:
Identify games with unusually high sales compared to the average sales within their genre.

Method:
A game is considered a high-end outlier if:
Sales >= Average + 2 × Standard Deviation
*/

 -- High end outlier detection.
with outliers_high as(
select Genre,
	   round(stddev(NA_Sales),3) as `stdd`,
       round(avg(NA_Sales),3) as `average` 
from vgsales
group by Genre)
select a.`Name`, 
	   a.Genre, 
       a.NA_Sales,
       b.average, 
       b.stdd
from vgsales as a
join outliers_high as b
on a.Genre = b.Genre
where a.NA_Sales >= b.average + 2*b.stdd
order by NA_Sales desc;

-- Low end outlier detection.
/*
Objective:
Identify games with unusually low sales relative
to their genre averages.
*/
with outliers_low as (
select Genre, 
	   round(stddev(NA_Sales),3) as `stdd`,
       round(avg(NA_Sales),3) as `average` 
from vgsales
group by Genre
)
select a.`Name`, 
	   a.Genre, 
       a.NA_Sales, 
       b.average, 
       b.stdd
from vgsales as a
join outliers_low as b
on a.Genre = b.Genre
where a.NA_Sales <=  b.average - 2*b.stdd
order by NA_Sales desc;
/*
Observation:
Pokemon Stadium appears as a low-end outlier because its genre contains only one observation, itself, resulting
in a standard deviation of zero.
*/