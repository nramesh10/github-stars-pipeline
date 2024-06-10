select 
    strftime('%m/%d/%Y', event_date) as date,
    repo_id,
    count(*) as count 
from (
    {{ fact_event_type('Push') }}
  ) as events
group by 1, 2