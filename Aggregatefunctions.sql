--Aggregate Functions
-- column level
--example one
create table students (
    stu_id number(8),
    stu_name varchar(20),
    year_od_study number(6),
    Maths number(6),
    Chemistry number(6),
    Physics number(6),
    Biology number(6)
);

insert into students values(1000 , 'karan' , 3 , 54 , 67,87,38);
insert into students values(1001 , 'stephen' , 2 , 54 , 87,67,48);
insert into students values(1002 , 'charan' , 1, 59 , 66,17,98);
insert into students values(1003 , 'john' , 5 , 57 , 87,27,68);
insert into students values(1004 , 'jim' , 3 , 50 , 67,37,68);
insert into students values(1005 , 'lucifer' , 6 , 24 , 57,97,98);
insert into students values(1006 , 'harry' , 2 , 56 , 67,87,98);

select * from students;

--using aggregate fucntions used only for the column level
--this is row level addition

select STU_ID,	STU_NAME	,YEAR_OD_STUDY,	MATHS,	CHEMISTRY	,PHYSICS,	BIOLOGY,
(maths+chemistry+physics+biology) as total_marks from students;

select max(maths) from students;
select min(maths) from students;
select count(maths)from students;
select sum(maths) from students;

--find the name of the student who scored max marks in maths
--if it is wise use group by function

select stu_name,max(maths) from students group by stu_name;
select stu_name , maths from students where maths = 59;

select sum(chemistry) from students;
select max(chemistry) from students;
select min(chemistry) from students;
select avg(chemistry) from students;


select * from employees;

select department_id,sum(salary) from employees group by department_id;


--The order of keywords in any oracle SQL statement. 
--1.from
--2.where
--3.group by
--4.having -- filter on group by resultant
--5.order by

select department_id,sum(salary) from employees 
group by department_id having sum(salary) >20000 );

select * from employees where salary =(select max(salary) from employees);
select * from employees where salary = (select min(salary) from employees);
select count(salary) from employees;
select max(salary) from employees;

select department_id from employees where salary =(select max(salary) from employees);
select department_id , sum(salary) from employees group by department_id order by 1;

select department_id,sum(salary) from employees where department_id is not null
group by department_id having sum(salary) >50000 order by 1;

select * from departments;
--ver vey important

select e.department_id,d.department_name ,sum(salary) 
from employees e , departments d 
where e.department_id = d.department_id 
and e.department_id  is not null
group by e.department_id , d.department_name
having sum(salary) >20000 order by 1;

select e.department_id,d.department_name,count(*) 
from employees e inner join departments d
on e.department_id=d.department_id 
group by e.department_id, d.department_name having count(*) > 30;
