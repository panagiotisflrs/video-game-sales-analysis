
/* =========================================
   BASIC SALES ANALYSIS
========================================= */

/*
Objective:
Identify the top performing games in North America.
This helps highlight blockbuster titles that dominated the gaming market.
*/
select `Name`, 
		Platform, 
        Genre, 
        NA_Sales
from vgsales
order by NA_Sales desc
limit 5; #Wii Sports, Super Mario Bros, Duck Hunt, Tetris, Mario Kart Wii.

/*
Objective:
Analyze average North America sales performance across different game genres.
*/
select Genre, 
	   round(avg(NA_Sales),3) as `average sales in NA`, 
       round(stddev(NA_Sales),3) as `standard deviation of sales in NA`
from vgsales
group by Genre
order by `average sales in NA` desc
;

/*
Observation:
Large standard deviations suggest the existence of major blockbuster titles that strongly 
outperform typical games in their genres. (In other words outliers)
*/