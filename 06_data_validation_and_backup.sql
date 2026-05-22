
/* =========================================
   DATA VALIDATION AND BACKUP
========================================= */

/*
Objective:
Check whether duplicate entries exist for Wii games.
This ensures the dataset remains reliable before performing
further analysis.
*/
select * 
from vgsales
where `Name`like "Wii %";

/*
Objective:
Create a backup copy of the dataset and add a helper column
to identify potential duplicate rows.
Working on a backup table is safer and considered a more
professional workflow.
*/
create table vgsalesbackup 
like vgsales;
alter table vgsalesbackup
add column row_n int;
insert into vgsalesbackup
select *,
row_number() over(partition by `Name`, `Platform` ,`Year` order by `Year`) as row_n
from vgsales
;

-- Display rows that appear more than once.
select * 
from vgsalesbackup 
where row_n >1;

/*
Observation:
No duplicate rows were detected.

The backup table will be kept for safer analysis,
but the helper column is no longer necessary.
*/

alter table vgsalesbackup
drop row_n;

select * from vgsalesbackup;