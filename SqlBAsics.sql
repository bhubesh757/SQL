create table customer (
    cus_id number(8),
    cust_name varchar2(30),
    cust_num number(10),
    dob date,
    city varchar2(20)
)

insert into customer values(
    4566 , 'karan' , 987645320,to_date('07/06/2001','mm/dd/yyyy'), 'bengaluru'
);
insert into customer values(
    4567 , 'charan' , 987645320,to_date('06/06/2001','mm/dd/yyyy'), 'chennai'
);

rollback;
commit;
desc customer;

--add a column
alter table customer add country varchar2(20);
update customer set country = 'india';

--create a backup table
--it creates a backup table and it is used in the informatica--
create table customer_bkp as select * from customer;
select * from customer_bkp;
--truncate table , no rollback can be done because its a ddl command
truncate table customer; -- it deletes the table data fully
--lets backup the file which we stored in the backup file
insert into customer(select * from customer_bkp); 
-- removing the particular table using the delete 
delete from customer_bkp where cus_id = 4567;
select * from customer_bkp;
select * from customer;
