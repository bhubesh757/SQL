1) --Running Total for Different Genders

select gender , 
day ,
sum(score_points) over(partition by gender order by day) as total
from scores order by 1 ;

2)---Biggest Single Number

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

3) Delete Duplicate emails
--use of sub querries and aggregat functions
delete 
from person
where id not in
(select min(id) from person group by email  );

select * from person;


4) Apples & Oranges

select sale_date , diff
from 
(
select * , 
    sold_num - lead(sold_num ,1) 
    over(partition by sale_date) as diff from sales 
) tmp
where fruit = 'apples' --this shows only the table contains apple
order by sale_date
;

5)
select 'Low Salary ' as category ,
count(*) as accounts_count from accounts 
where income < 20000
union
select 'Average Salary ' as category ,
count(*) as accounts_count from accounts 
where income >=20000 and income <=50000
union
select 'High Salary ' as category ,
count(*) as accounts_count from accounts 
where income > 50000
;


6) All the Pairs With the Maximum Number of Common Followers 

with follower_count as 
(
    select r1.user_id as user1_id,
     r2.user_id as user2_id,
    count(*) as common_follower_count
    from relations r1 inner join relations r2 on
    r1.follower_id = r2.follower_id 
    and r1.user_id < r2.user_id
    group by r1.user_id ,  r2.user_id
)

select user1_id , user2_id from follower_count where common_follower_count = 
(
select max(common_follower_count) from follower_count ) 
;

7) The Latest Login in 2020
select user_id , 
max(time_stamp) as last_stamp
from logins
where extract (yaear from time_stamp) =2020
group by user_id ;

8)Consecutive Available Seats

select 
distinct c1.seat_id as seat_id
from 
cinema c1  join cinema c2 
on  abs(c1.seat_id - c2.seat_id) = 1 and
c1.free = true and c2.free = true
order by c1.seat_id
;

9)

select  *    from cinema 
where mod(id,2)<>0 and description <> 'boring'
order by id desc;
--its my answer 25 min of thinking worked hard , so , from this i learned is practise only gives u wings to succeed , now i am able know some basics and
i can able to solve some basic problems , stepping into the next level medium lvl need to develop the code capability and content 
