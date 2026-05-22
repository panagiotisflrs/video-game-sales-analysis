
/* =========================================
   REGIONAL SALES ANALYSIS
========================================= */

/*
Objective:
Compare genre popularity across global regions.
This analysis helps identify regional gaming preferences.
*/

-- Genre sales per region. Focusing on EU.
select Genre, 
	   round(sum(NA_Sales),3) as `NA sales`, 
       round(sum(EU_Sales),3) as `EU sales`, 
       round(sum(JP_Sales),3) as `Japan sales`, 
       round(sum(Other_Sales),3) as `Other countries sales`
from vgsales
group by Genre
order by `EU sales` desc;

-- Genre sales per region. Focusing on Japan.
select Genre,
	   round(sum(NA_Sales),3) as `NA sales`, 
       round(sum(EU_Sales),3) as `EU sales`, 
       round(sum(JP_Sales),3) as `Japan sales`, 
       round(sum(Other_Sales),3) as `Other countries sales` 
from vgsales
group by Genre
order by `Japan sales` desc;

/*
Observation:
Europe and North America show similar genre preferences,
while Japan displays noticeably different gaming trends.
*/