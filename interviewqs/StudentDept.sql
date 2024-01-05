select 
dt.dept_name ,
coalesce(st.student_number , 0 ) as student_number
from department dt 
left join (
    -- subquery
    select 
    dept_id , 
    count(*) as student_number
    from student
    group by dept_id
) st on dt.dept_id = st.dept_id
order by 2 desc , 1 asc;

