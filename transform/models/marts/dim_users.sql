select distinct 
  user 
from {{ ref("stg_gharchive") }} 