select 
strftime('%m/%d/%Y', event_date) as date,
repo_id,
count(*) as count 
from {{ ref("stg_gharchive") }}
where event_type = 'Push'
group by 1, 2