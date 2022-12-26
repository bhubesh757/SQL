  select * from employees;
   select * from departments;
   select * from locations;

  


  CREATE TABLE departments
   ( department_id NUMBER(4)
   , department_name VARCHAR2(30)
   CONSTRAINT dept_name_nn NOT NULL
   , manager_id NUMBER(6)
   , location_id NUMBER(4)
   ) ;


   INSERT INTO departments VALUES 
   ( 50
   , 'Administration'
   , 200
   , 1700
   );
INSERT INTO departments VALUES 
   ( 100
   , 'Marketing'
   , 201
   , 1800
   );
   
   INSERT INTO departments VALUES 
   ( 110
   , 'Purchasing'
   , 114
   , 1700
   );
   
   INSERT INTO departments VALUES 
   ( 30
   , 'Human Resources'
   , 203
   , 2400
   );
INSERT INTO departments VALUES 
   ( 50
   , 'Shipping'
   , 121
   , 1500
   );
   
   INSERT INTO departments VALUES 
   ( 60 
   , 'IT'
   , 103
   , 1400
   );
   
   INSERT INTO departments VALUES 
   ( 70 
   , 'Public Relations'
   , 204
   , 2700
   );
   
   INSERT INTO departments VALUES 
   ( 80 
   , 'Sales'
   , 145
   , 2500
   );
   
   INSERT INTO departments VALUES 
   ( 90 
   , 'Executive'
   , 100
   , 1700
   );

   INSERT INTO employees VALUES 
   ( 128
   , 'Steven'
   , 'Markle'
   , 'SMARKLE'
   , '650.124.1434'
   , TO_DATE('08-MAR-2000', 'dd-MON-yyyy')
   , 'ST_CLERK'
   , 2200
   , NULL
   , 120
   , 50
   );
--joins

select
e.employee_id,
e.first_name,
e.email,
e.SALARY,
e.department_id,
d.DEPARTMENT_NAME,
d.LOCATION_ID
from Employees e inner join departments d
on e.department_id=d.department_id;

--Left join

select 
e.employee_id,
e.email,
e.salary,
e.department_id,
d.department_name,
d.location_id
from employees e left join departments d 
on e.department_id = d.department_id;

--Right Join
select
e.employee_id,
e.first_name,
e.job_id,
e.salary,
e.department_id,
d.DEPARTMENT_NAME
from employees e right join departments d
on e.department_id=d.department_id;

--Outer join
select
e.employee_id,
e.email,
e.salary,
e.department_id,
d.department_name,
d.location_id
from employees e full join departments d 
on e.department_id = d.department_id;

--Now joining the 3rd table
--eg
select
c1.cust_id,
c1.cust_name,
c1.mob_no,
c1.email,
c1.city_id,
c2.city_name,
c2.region_id country_id,
c3.country_name
from customer c1 inner join city c2
on c1.city_id=c2.city_id
inner join country c3
on c2.region_id=c3.country_id;

--inner join
select
e.employee_id,
e.email,
e.salary,
e.department_id,
d.department_name,
d.location_id,
l.city,
l.country_id
from employees e inner join departments d 
on e.department_id = d.department_id
inner join locations l 
on d.location_id = l.location_id and l.country_id='US' and e.salary >2000;
--this is crazy to learn
--bhubesh nee mas da dei

--Cross Join or Cartesian product
--if we forgot to mention any join conditions

select * from departments;
select
e.employee_id,
e.first_name,
e.email,
e.SALARY,
e.department_id,
d.DEPARTMENT_NAME,
d.LOCATION_ID
from employees e, departments d
where e.department_id=d.department_id;

--self join

select 
e1.employee_id,
e1.first_name,
e2.employee_id,
e2.first_name 
from employees e1 , employees e2 
where e1.manager_id = e2.employee_id order by 1; 


