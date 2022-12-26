create table customer
(
cust_id	number,
cust_name	varchar2(50),
mob_no	number(10),
email	varchar2(50),
country_id number(3)
);

Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1000,'Kannan',8989898989,'kannan@gmail.com',200);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1001,'Arun',8989898990,'arun@gmail.com',204);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1002,'Karthik',8989898991,'Karthik@gmail.com',202);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1003,'Shankar',8989898992,'shankar@gmail.com',203);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1004,'Sree',8989898993,'Sree@gmail.com',205);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1005,'Babu',8989898994,'Babu@gmail.com',200);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1006,'Radha',8989898995,'Radha@gmail.com',202);
Insert into customer (CUST_ID,CUST_NAME,MOB_NO,EMAIL,COUNTRY_ID) values (1007,'Senthil',8989898996,'Senthil@gmail.com',200);

create table country
(
Country_id	number(3),
Country_name varchar2(50)
);

Insert into country (COUNTRY_ID,COUNTRY_NAME) values (200,'INDIA');
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (201,'CHINA');
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (202,'USA');
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (203,'SINGAPORE');
Insert into country (COUNTRY_ID,COUNTRY_NAME) values (204,'UK');

select * from customer;
select * from country;

-- implicit method
--join condition
--Inner join condition
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name from customer a , country b 
where a.country_id = b.country_id;

--ANSI method

select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name 
from customer a inner join country b on a.country_id = b.country_id;

select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name 
from customer a inner join country b on a.country_id = b.country_id where COUNTRY_NAME = 'INDIA';

--practice assigned another name for it and using ansi method to inner join
select c1.CUST_ID,c1.cust_name , c1.mob_no , c1.email,c1.country_id ,c2.country_name  
from customer c1 inner join country c2 on c1.country_id = c2.country_id; 

 select c1.CUST_ID,c1.cust_name , c1.mob_no , c1.email,c1.country_id ,c2.country_name  
from customer c1 inner join country c2 on c1.country_id = c2.country_id where country_name = 'UK';  

--Left outer Join
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name 
from customer a , country b 
where a.country_id = b.country_id(+);
--Ansi method
--Must use of join and on keyword to make error free
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name 
from customer a left join country b 
on a.country_id = b.country_id;

--right Outer join
select a.cust_id,a.cust_name,a.mob_no,a.email,a.country_id,b.country_name 
from customer a , country b 
where a.country_id(+) = b.country_id;

select a.cust_id,a.cust_name,a.mob_no,a.email,b.country_id,b.country_name 
from customer a right join country b 
on a.country_id = b.country_id;

--Full outer join
select a.cust_id,a.cust_name,a.mob_no,a.email,b.country_id,b.country_name 
from customer a full join country b 
on a.country_id = b.country_id;

-- with 3 tables

