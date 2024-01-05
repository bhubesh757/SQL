select 
t1.name from 
candidate t1
inner join (
    select 
    candidateId,
    count(*) as total_votes
    from 
    vote 
    group by 1
    order by 2 desc
    limit 1
) t2 on t1.id = t2.candidateId
