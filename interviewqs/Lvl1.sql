--Running Total for Different Genders

select gender , 
day ,
sum(score_points) over(partition by gender order by day) as total
from scores order by 1 ;

---Biggest Single Number

-- finding the seconf largest number from the table
--group by them and using windo function and ranking them and 
select num  from(
select num ,
row_number() 
    over(order by num desc) rank  from my_numbers 
    group by num ) tmp
    where rank = 2 
    order by num
    ;

--- Delete Duplicate emails
--use of sub querries and aggregat functions
delete 
from person
where id not in
(select min(id) from person group by email  );

select * from person;



