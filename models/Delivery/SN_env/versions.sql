with 

environments as  (
    select * from {{ ref('stg_environments' )}}
),

mysql_versions as (
    select sys_id, unnest(string_to_array(mysql_version,',')) as mysql_ver, NULL as mongo_ver, NULL as postgres_ver from environments
),

mongo_versions as (
     select sys_id, NULL as mysql_ver, unnest(string_to_array(mongo_version,',')) as mongo_ver, NULL as postgres_ver from environments
),
postgres_versions as (
     select sys_id, NULL as mysql_ver, NULL as mongo_ver, unnest(string_to_array(postgres_version,',')) as postgres_ver from environments
),

versions as (

    select * from mysql_versions
    union all
    select * from mongo_versions
    union all
    select * from postgres_versions
)
select * from versions
