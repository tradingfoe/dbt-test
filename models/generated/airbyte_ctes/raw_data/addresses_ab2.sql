{{ config(schema="_airbyte_raw_data", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(id as {{ dbt_utils.type_float() }}) as id,
    cast(uid as {{ dbt_utils.type_string() }}) as uid,
    cast(ward as {{ dbt_utils.type_string() }}) as ward,
    cast(email as {{ dbt_utils.type_string() }}) as email,
    cast(phone as {{ dbt_utils.type_string() }}) as phone,
    cast(state as {{ dbt_utils.type_string() }}) as state,
    cast(country as {{ dbt_utils.type_string() }}) as country,
    cast(user_id as {{ dbt_utils.type_float() }}) as user_id,
    cast(province as {{ dbt_utils.type_string() }}) as province,
    cast(address_1 as {{ dbt_utils.type_string() }}) as address_1,
    cast(address_2 as {{ dbt_utils.type_string() }}) as address_2,
    cast(last_name as {{ dbt_utils.type_string() }}) as last_name,
    cast(created_at as {{ dbt_utils.type_string() }}) as created_at,
    cast(first_name as {{ dbt_utils.type_string() }}) as first_name,
    cast(updated_at as {{ dbt_utils.type_string() }}) as updated_at,
    cast(postal_code as {{ dbt_utils.type_string() }}) as postal_code,
    _airbyte_emitted_at
from {{ ref('addresses_ab1') }}
-- addresses

