with monthly_pushes as (
  select 
    strftime('%Y-%m', event_date) as date_month, 
    repo_id,
    count(*) as count_pushes
  from {{ ref("stg_gharchive") }}
  where event_type = 'Push'
  group by 1, 2
),

monthly_pushes_with_lag as (
  select
    mp.date_month,
    mp.repo_id,
    mp.count_pushes,
    lag(mp.count_pushes, 12) over (
      partition by mp.repo_id 
      order by mp.date_month
    ) as last_year_count_pushes
  from monthly_pushes as mp
)

select 
  mpwl.date_month, 
  mpwl.repo_id, 
  mpwl.count_pushes, 
  mpwl.last_year_count_pushes,
  (mpwl.count_pushes / nullif(mpwl.last_year_count_pushes, 0)) - 1 as yoy_growth
from monthly_pushes_with_lag as mpwl
order by 1, 2
