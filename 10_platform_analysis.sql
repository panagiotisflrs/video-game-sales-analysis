
/* =========================================
   PLATFORM ANALYSIS
========================================= */

/*
Objective:
Compare gaming platforms based on:
- number of released games
- total global sales
*/
select Platform, 
	   count(Platform) as `amount`, 
       round(sum(Global_Sales),3) as `Global sales per Platform`
from vgsales
group by Platform
order by `amount` desc, `Global sales per Platform` desc;
/*
Observation:
Although Xbox 360 and PS3 released more games overall,
the Wii generated significantly higher global sales.
The Nintendo DS also achieved very strong sales despite
having fewer released titles.
*/