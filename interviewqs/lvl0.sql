--Customer Placing the Largest Number Orders

select customer_number from
(select customer_number ,
count(*) as total_order_by_customer 
from orders 
group by customer_number
order by total_order_by_customer desc) as tmp limit 1;

--Second highest salary
select max(salary) as SecondHighestSalary 
from Employee where salary not in 
(
    select max(salary)
    from employee
);

--Patients With a Condition
select *
from patients
where conditions like '%DIAB1%';
