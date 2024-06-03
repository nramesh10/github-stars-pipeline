select 
repo_id, 
strftime('%m/%d/%Y', event_date) as date,
count(*) as count 
from {{ ref("stg_gharchive") }}
where event_type = 'Watch'
group by date, repo_id