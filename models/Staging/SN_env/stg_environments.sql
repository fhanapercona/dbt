with 

source as (

    select * from {{ source('dbt_training','sn_envs') }}
),
envs_ver as (

    select
        "Sys ID" as sys_id,
        "U Version Mongodb" as mongo_version,
        "U Version Mysql" as mysql_version,
        "U Version Postgrsql" as postgres_version

    from source

)
select * from envs_ver