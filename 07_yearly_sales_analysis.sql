 /* =========================================
   YEARLY SALES ANALYSIS
========================================= */

/*
Objective:
Analyze yearly video game sales trends across all regions from 1982 to 2015.
*/
select year(`Year`) as `year`, 
	   round(sum(NA_Sales),3) `yearly vg sales NA`, 
       round(sum(EU_Sales),3) `yearly vg sales EU`,
       round(sum(JP_Sales),3) `yearly vg sales Japan`, 
       round(sum(Other_Sales),3) `yearly vg sales Other countries`
from vgsalesbackup
group by year(`Year`)
order by `year` desc;

select `Name`,
		Genre, 
        `Year`, 
        EU_Sales
from vgsalesbackup
order by `Year` desc, `Name`;

/*
Objective:
Analyze global yearly sales trends between 1982 and 2015.
*/
select
    year(`Year`) as `year`,
    ROUND(SUM(Global_Sales), 2) as `Global yearly sales`
from vgsales
group by `year`
order by `Global yearly sales` desc ;