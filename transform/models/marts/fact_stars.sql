select 
repo_id, 
strftime('%m/%d/%Y', event_date) as date,
count(*) as count 
from (
    {{ fact_event_type('Watch') }}
  ) as events
group by 2, 1