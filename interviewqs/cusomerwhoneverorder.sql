select 
namecust as customers
from customers  where not exists
(
    select * from orders  where
    customers.id = orders.customerid 
)

----------

select 
c.namecust as customers
from
customers c left join orders o on 
c.id = o.customerid 
where customerid is null
