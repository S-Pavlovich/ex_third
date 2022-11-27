--===> 1
select
    u.name,
    r.result,
    s.name
from
    result as r
    inner join subject as s
        on r.subject = s.id
    inner join user as u
        on r.user_id = u.id
order by
    r.result desc
limit 3

--===> 2

with cte as (
select
    u.name as user_name,
    r.result,
    s.name as subject_name
from
    result as r
    inner join subject as s
        on r.subject = s.id
    inner join user as u
        on r.user_id = u.id
group by
    u.name,
    r.result,
    s.name
having count(s.name) = 3

),
cte_2 as (

select
    user_name,
    subject_name
    sum(result) as total_result
from
    cte
group by
    user_name,
    subject_name
)

select
    user_name,
    total_result
from
    cte_2
where
    total_result > 200
order by
    total_result desc
