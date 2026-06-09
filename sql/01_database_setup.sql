/* =========================================
   DATABASE SETUP
   Video Game Sales Analysis Project
========================================= */
create database vgsales;
use vgsales;

/*
Objective:
Prepare the dataset for analysis by modifying
column types and validating the available data range.
*/
alter table vgsales
modify column `Year` date
;

/* =========================================
   DATA RANGE VALIDATION
========================================= */

-- Verify that the earliest release year in the dataset is 1982.
select year(`Year`) AS `year`
from vgsales
order by `year` desc
;

-- Verifying that the latest release year in the dataset is 2015.
select year(`Year`) AS `year`
from vgsales
order by `year` asc
;

-- Count rows between 2000 and 2014. (If I use a where clause and statement i don't include 2000 and 2014)
select count(*) 
from vgsales
where year(`Year`) between 2000 and 2014;
