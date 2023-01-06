select
distinct l1.id as consecutiveNums
from logs l1 join logs l2 on 
l1.num = l2.num and l2.id = l1.id + 1
join logs l3 on
l1.num = l3.num and l3.id = l1.id + 2;
-------------------
-- second method
--using lag and lead method and using the subqueries into the and subtracting the previous number with present number

SELECT Num AS ConsecutiveNums 

FROM (SELECT Num,       

             LAG(Num,1) OVER() AS next_number,      

             LEAD(Num,1) OVER() AS previous_number      

             FROM Logs) AS T1 

WHERE next_number = previous_number AND previous_number = Num;
