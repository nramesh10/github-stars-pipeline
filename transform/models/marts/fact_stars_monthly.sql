with monthly_stars as (
  select 
    substr(s.date,5,2) as date_month, 
    s.repo_id,
    count(s.count) as count_stars
  from {{ ref('fact_stars') }} as s
  group by 1, 2
),

monthly_stars_with_lag as (
  select
    ms.date_month,
    ms.repo_id,
    ms.count_stars,
    lag(ms.count_stars, 12) over (
      partition by ms.repo_id 
      order by ms.date_month
    ) as last_year_count_stars
  from monthly_stars as ms
)

select 
  mswl.date_month, 
  mswl.repo_id, 
  mswl.count_stars, 
  mswl.last_year_count_stars,
  (mswl.count_stars / nullif(mswl.last_year_count_stars, 0)) - 1 as yoy_growth
from monthly_stars_with_lag as mswl
order by mswl.date_month, mswl.repo_id
