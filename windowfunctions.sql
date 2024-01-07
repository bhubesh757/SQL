select * from employees;
--rank() functions
--rank() over(order by ranking_column asc|desc)
--rank() over(partition by ranking column order by ranking_column asc|desc)
--Dense rank
----dense_rank() over(order by ranking_column asc|desc)

select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(order by salary) as RANK from employees;

--this query says that taking the total of the salary and the employee is geeting this much 
--salary from the total salary
select employee_id,first_name,email,phone_number,salary,department_id,sum(salary) over()
from employees;

--dept -total , group by = partitio by
select employee_id,first_name,
email,
phone_number,
salary,
department_id,
sum(salary) over(),
sum(salary) over(partition by department_id ) as deptwise_sumsalary
from employees;

select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(order by salary desc) RANK from employees;

select employee_id,first_name,email,phone_number,salary,department_id,
dense_rank() over(order by salary desc) RANK from employees;

select employee_id,first_name,email,phone_number,salary,department_id,
row_number() over(order by salary desc) RANK from employees;

select employee_id,first_name,
email,phone_number,salary,department_id,
rank() over(partition by department_id order by salary) RANK from employees;

select * from (
select employee_id,first_name,
email,phone_number,salary,department_id,
dense_rank() over( order by salary desc) RANK from employees) 
where RANK <=5
;

-- second highest salary

select * from (
select employee_id,first_name,
email,phone_number,salary,department_id,
row_number() over( order by salary desc) rank from employees) 
where rank =2
;

select employee_id,first_name,email,phone_number,salary,department_id,rank from
(select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(order by salary desc) RANK from employees)  where rank <=5;

--top earners with dept name

--joins and window functions

select a.employee_id,
a.first_name,
a.email,
a.phone_number,
a.salary,
a.department_id,
d.department_name,
a.rank from
(select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(order by salary desc) RANK from employees) a inner join departments d
on a.department_id=d.department_id where a.rank <=5 order by a.rank;

select employee_id,first_name,email,phone_number,hire_date,salary,department_id,
lead (hire_date) over(order by hire_date) after_hire,
lead (first_name) over(order by hire_date) after_hire from employees;


select * from (
select employee_id,first_name,email,phone_number,hire_date,salary,department_id,
lag (hire_date) over(order by hire_date) before_hire_date,
lag (first_name) over(order by hire_date) before_hire_name from employees) where employee_id=142;



--Revision 2

select * from employees

select sum(salary) from employees;

select 
employee_id,
first_name,
sum(salary) over(partition by department_id),
sum(salary) over()
from employees

RANK() OVER(Order by salary desc)
-- rank
select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(order by salary) RANK from employees;
-- dense-rank
select employee_id,first_name,email,phone_number,salary,department_id,
dense_rank() over(order by salary) RANK from employees;

select employee_id,first_name,email,phone_number,hire_date,salary,department_id,
row_number() over(order by salary desc) no_ties from employees;

-- partition by grouping - groupby

select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(partition by department_id order by salary) RANK 
from employees;

-- least 5 salaried person
select 
employee_id,first_name,email,phone_number,salary,department_id,rank
from 
(select employee_id,first_name,email,phone_number,salary,department_id,
rank() over( partition by department_id order by salary) RANK from employees)
where rank <= 5

select employee_id,first_name,email,phone_number,salary,department_id,rank from
(select employee_id,first_name,email,phone_number,salary,department_id,
rank() over(order by salary desc) RANK from employees) where rank <=5;

-- create a rank and then reflect it in the original table
select employee_id,first_name,email,phone_number,salary,department_id,rank from
(select employee_id,first_name,email,phone_number,salary,department_id,
dense_rank() over(order by salary) RANK from employees) where rank <=5;

-- lead and lag

select 
employee_id,first_name,email,phone_number,hire_date,salary,department_id,
lead(hire_date) over(order by hire_date)after_hire,
lead(first_name) over(order by hire_date) after_hire 
from employees


select * from (
select employee_id,first_name,email,phone_number,hire_date,salary,department_id,
lag (hire_date) over(order by hire_date) before_hire_date,
lag (first_name) over(order by hire_date) before_hire_name from employees) where employee_id=142;


select employee_id,first_name,email,phone_number,hire_date,salary,department_id,
lead (FIRST_NAME) over(order by salary) high_salary_person,
lead (salary) over(order by salary) high_salary from employees;


