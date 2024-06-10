select 
  left(type, len(type) - 5) as event_type, 
  actor.login as user, 
  repo.id as repo_id, 
  repo.name as repo_name, 
  created_at as event_date 
from {{ source("src_gharchive", "src_gharchive") }} 