select 
sp.name 
from salesperson sp
where sales_id not in (
select 
distinct od.sales_id
from orders od 
inner join company c 
on od.com_id = c.com_id and 
c.name = 'RED' 
)
