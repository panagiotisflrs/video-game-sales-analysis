
/* =========================================
   PUBLISHER ANALYSIS
========================================= */

/*
Objective:
Analyze publisher activity and sales performance.
*/
select Publisher, 
	   count(Publisher) as "amount of games published"
from vgsalesbackup
group by Publisher
order by count(Publisher) desc;

select Publisher, 
	   round(sum(NA_Sales),3) `vg sales NA per Publisher`, 
       round(sum(EU_Sales),3) `vg sales EU per Publisher`,
       round(sum(JP_Sales),3) `vg sales Japan per Publisher`,
       round(sum(Other_Sales),3) `vg sales Other countries per Publisher`
from vgsalesbackup
group by Publisher
order by Publisher;

-- Global publisher sales
select Publisher, 
	   round(sum(Global_Sales),3) as `Global sales`
from vgsalesbackup
group by Publisher
order by Publisher;

-- Publisher genre distribution
select Publisher, 
	   Genre, 
       count(Genre) as `vg per Publisher per Genre`
from vgsalesbackup
group by Publisher, Genre
order by Publisher, count(Genre) desc;

-- Top 10 Publisher genre
select Publisher, 
	   Genre, 
       count(Genre) as `vg per Publisher per Genre`
from vgsalesbackup
group by Publisher, Genre
order by count(Genre) desc
limit 10;