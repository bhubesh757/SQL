select 
id 
from
(
select 
* ,
coalesce( lag(temperature , 1 ) over(order by recorddate),999) as prev_temp
from weather 
) as tmp
where temperature > prev_temp;
