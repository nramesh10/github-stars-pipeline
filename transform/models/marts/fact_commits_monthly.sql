with monthly_commits as (
  select 
    substr(c.date, 5,2) as date_month, 
    c.repo_id,
    count(count) as commit_count
  from {{ ref('fact_commits') }} as c
  group by 1, 2
)

select 
  mc.date_month, 
  mc.repo_id, 
  mc.commit_count
from monthly_commits as mc
order by mc.date_month, mc.repo_id
