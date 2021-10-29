{{ config(schema="raw_data", tags=["top-level"]) }}
-- SQL model to build a Type 2 Slowly Changing Dimension (SCD) table for each record identified by their primary key
select
    id,
    uid,
    ward,
    email,
    phone,
    state,
    country,
    user_id,
    province,
    address_1,
    address_2,
    last_name,
    created_at,
    first_name,
    updated_at,
    postal_code,
  created_at as _airbyte_start_at,
  lag(created_at) over (
    partition by cast(id as {{ dbt_utils.type_string() }})
    order by created_at is null asc, created_at desc, _airbyte_emitted_at desc
  ) as _airbyte_end_at,
  case when lag(created_at) over (
    partition by cast(id as {{ dbt_utils.type_string() }})
    order by created_at is null asc, created_at desc, _airbyte_emitted_at desc
  ) is null  then 1 else 0 end as _airbyte_active_row,
  _airbyte_emitted_at,
  _airbyte_addresses_hashid
from {{ ref('addresses_ab4') }}
-- addresses from {{ source('raw_data', '_airbyte_raw_addresses') }}
where _airbyte_row_num = 1

