select * from employees;

--single row subqueries
select max(salary) from employees;
-- we canot find the person name who got max salary but we can use subqueries to 
--bring the ouptput using this query
select * from employees where salary = (select max(salary) from employees);

select avg(salary) from employees;
-- no = i will not work
select * from employees where salary > (select avg(salary) from employees);

--from each department select the person who got max salary

select * from employees where salary > (select avg(salary) from employees group by department_id);
--this shows error

--Multirow  subquery

--in
--not in
-->any
--<any
-->all
--<all

select * from employees where salary in (select max(salary) from employees group by department_id);

select * from employees;

--single row subqueries
select max(salary) from employees;
-- we canot find the person name who got max salary but we can use subqueries to 
--bring the ouptput using this query
select * from employees where salary = (select max(salary) from employees);

select avg(salary) from employees;
-- no = i will not work
select * from employees where salary > (select avg(salary) from employees);

--from each department select the person who got max salary

select * from employees where salary > (select avg(salary) from employees group by department_id);
--this shows error

--Multirow  subquery

--in
--not in
-->any
--<any
-->all
--<all

select * from employees where salary in (select max(salary) from employees group by department_id);

select * from employees where (department_id,salary) 
in (select department_id ,max(salary) 
from employees group by department_id)
order by department_id;

--type 2
--greater than any of these dept id
select * from employees where department_id >ANY (30,60,90) order by department_id;
select * from employees where department_id <ANY (30,60,90) order by department_id;
--30 - 80
select * from employees where department_id <ALL (30,60,90) order by department_id;
select * from employees where department_id >all (30,60,90) order by department_id;

--qs
-- whose employees job is the same as the job of John;

select * from employees where job_id = 'FI_ACCOUNT';
select * from employees where job_id =(select job_id from employees where first_name = 'John');
--multi row
select * from employees where (department_id,first_name)  in (select department_id ,first_name from employees where salary > 8000); 

--max salary of the job is sales manager

select * from jobs;
select job_id from jobs where JOB_TITLE = 'Sales Manager';

select * from employees where
 job_id = (select job_id from jobs where JOB_TITLE = 'Purchasing Manager'
);

--nested subqueries
select * from employees where salary >(select max(salary) from employees where
 job_id = (select job_id from jobs where JOB_TITLE = 'Purchasing Manager'
));

--employees job is same as the job of elen and who are earning salary more than elen salary

select * from employees where first_name ='Bruce';

select * from employees where job_id in (select job_id from employees where first_name ='Bruce') 
and salary > (select salary from employees where first_name = 'Bruce') ;
--naming the person who got more salary than bruce from the same job id

--display senior employee among all the employees

select min(hire_date) from employees;

select * from employees where hire_date = (select min(hire_date) from employees);
select * from employees;
--second highest salary

select max(salary) from employees where salary not in
(select max(salary) from employees);
--
select max(salary) from employees where salary <(select max(salary) from employees);

--employee name
select * from employees where salary =(
    select max(salary) from employees where salary <(select max(salary) from employees)
)
--nice bhubesh work hard like hell
--sum of slary of jobs if the sum of salary of jobs are more than the sum of salary of the job is clerk
select sum(salary) from employees where job_id like '%AD_VP%';

select job_id ,sum(salary)
from employees
group by job_id having sum(salary) >(
    select sum(salary) from employees where job_id like '%AD_VP%'
);
select job_id ,sum(salary)
from employees
group by job_id having sum(salary) >(
    select sum(salary) from employees where job_id = 'AD_VP'
);
--same result then ehy like %ADVP%;
-- finding the sum(salary) whose job_id ad_vp , greater than this



