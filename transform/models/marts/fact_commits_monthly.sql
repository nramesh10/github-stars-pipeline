with repo_date_range as (
  select
    repo_id,
    min(event_date) as min_date,
    max(event_date) as max_date
  from {{ ref('fact_commits')}}
  group by 1
),

repo_month_spine as (
  select
    rd.repo_id,
    d.date_month
  from {{ ref('dim_date') }} as d
  join repo_date_range as rd
    on d.date_month
    between date_trunc('month', rd.min_date)
    and date_trunc('month', rd.max_date)
)

select
  rm.date_month,
  rm.repo_id,
  sum(case when s.event_date is null then 0 else 1 end) as commit_count,
  lag(commit_count, 12) over (partition by rm.repo_id order by rm.date_month) as last_year_commit_count,
  (commit_count / last_year_commit_count) - 1 as yoy_growth
from repo_month_spine as rm
  left join {{ ref('fact_commits') }} as s
  on rm.date_month = date_trunc('month', s.event_date)
  and rm.repo_id = s.repo_id
group by 1, 2