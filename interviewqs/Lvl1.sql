--Running Total for Different Genders

select gender , 
day ,
sum(score_points) over(partition by gender order by day) as total
from scores order by 1 ;

--- Delete Duplicate emails
--use of sub querries and aggregat functions
delete 
from person
where id not in
(select min(id) from person group by email  );

select * from person;



