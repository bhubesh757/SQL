
select * from employees;
--columns alias
select employee_id as emp_id,first_name,email,hire_date,salary,department_id from employees;
--column concatenation

select employee_id ,first_name , last_name , concat(concat(first_name ,' ') ,last_name) as full_name,salary , department_id from employees;

--columns calculation
select employee_id,first_name,email,hire_date,salary,salary+1000 new_salary,department_id from employees;

select distinct department_id from employees;
select count(distinct department_id) from employees;
--where clause

select * from employees where salary >10000;
select * from employees where salary < 10000;
select * from employees where salary >8000 and salary <12000;
select * from employees where salary >8000 and salary <12000;
select * from employees where salary between 7000 and 10000;
select * from employees where salary not between 8000 and 12000;

select * from employees where department_id = 60;
-- mroe than one values
select * from employees where department_id in (60,90);

select * from employees where job_id in ('ad_vp' , 'it_prog');
--using two condition
select * from employees where department_id = 90  and salary > 10000;
select * from employees where department_id=80 AND salary >10000;
select * from employees where department_id=80 OR salary >10000;

--rownum
select * from employees where rownum <=6;
--row id is unique and only the rownum will change;
select rownum , rowid from employees;
select * from employees where commission_pct is null;

-- counting the no of commission_pct is null
select count (*) from employees where commission_pct is not null;
select count (*) from employees where commission_pct is  null;
select count(commission_pct) from employees; --it tells only not null values

--tochar keyword is used

select employee_id,hire_date,to_char(hire_date,'mm') from employees;
--the employees who joined on the year of 2005
select * from employees where to_char(hire_date , 'yyyy') = 1990;

select * from employees where to_char(hire_date,'mmyyyy') between '091997' and '092000';
select * from employees where to_char(hire_date , 'mmyyyy') between '011987' and '012000';

select sysdate from dual;
select current_Date from dual;

--pattern matching

select * from employees where first_name like 'D%';
--starting with S and ending it by n
select * from employees where first_name like 'S%n';

--order by
select * from employees order by first_name;
select * from employees order by first_name desc;
select * from employees order by salary desc ,hire_date;

--single Row Functions

-- substring functions
--substr(string , from_position , no_of_char) 3 arguements

select substr('Welcome to India!!!',12,5) from dual;
select substr('Welcome to India!!!',-8) from dual;

select job_id,substr(job_id,1,4) from employees;
select job_id , substr(job_id , 2,5) from employees;

-- Instr will return the position of the character

select INSTR('THALAPATHY VIJAY','V') from dual;
select INSTR('THALAPATHY VIJAY','A' , 3) from dual;

--hard coded

--insurance-200
--hr-300  need to remove the numbers from the values

--if i pass the hr-200 into this it won table to give the right answer
 -- dual is empty / dummy variable
--very important example
select substr('insurance-200' , 1,9) from dual;
select instr('insurance-200','-') from dual;
select substr('bill-200' , 1,instr('bill-200','-')-1) from dual;

--lpad , rpad

--replace

select REPLACE('JACK and JUE','J','BL') from dual;
--BLACK and BLUE


--translate

select translate('Are you Witch' , 'W' , 'B') from dual;
-- null values
-- Any Arithmetic values we get only null values

--To deal with null values 
--NVL   - 2 arg
--NVL2  - 3 arg
--Nullif - 2 arg
--Coalesce  - n arg

select NVL(5,6) from dual;
select NVL(6,null) from dual;

select employee_id,salary,commission_pct,salary+(salary*commission_pct) total_salary from employees;
 --to solve this issue

--nullif(arg1,arg2)

  -- if arg1=arg2   ---> null
   --if arg1 != arg2   ---> arg1

   select nullif(5,8) from dual;

   select first_name,last_name from employees 
   where first_name=last_name;

 




