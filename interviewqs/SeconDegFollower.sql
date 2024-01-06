select 
f1.followee  as follower ,
count(*) as num
from follow f1
where f1.followee in (select follower from follow)
group by 1
order by 2 desc;
