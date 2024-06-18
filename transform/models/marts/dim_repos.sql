with event_dates as (
    select 
        repo_id, 
        repo_name, 
        event_date 
    from {{ ref("stg_gharchive") }}
)

select distinct 
    repo_id, 
    repo_name, 
    min(event_date) as date_start, 
    lead(date_start) over (partition by repo_id order by date_start asc) as lead_date,
    max(event_date) as date_end
from event_dates
group by 1, 2
order by 1, 3