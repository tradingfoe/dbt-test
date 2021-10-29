{{ config(schema="_airbyte_raw_data", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['uid'], ['uid']) }} as uid,
    {{ json_extract_scalar('_airbyte_data', ['ward'], ['ward']) }} as ward,
    {{ json_extract_scalar('_airbyte_data', ['email'], ['email']) }} as email,
    {{ json_extract_scalar('_airbyte_data', ['phone'], ['phone']) }} as phone,
    {{ json_extract_scalar('_airbyte_data', ['state'], ['state']) }} as state,
    {{ json_extract_scalar('_airbyte_data', ['country'], ['country']) }} as country,
    {{ json_extract_scalar('_airbyte_data', ['user_id'], ['user_id']) }} as user_id,
    {{ json_extract_scalar('_airbyte_data', ['province'], ['province']) }} as province,
    {{ json_extract_scalar('_airbyte_data', ['address_1'], ['address_1']) }} as address_1,
    {{ json_extract_scalar('_airbyte_data', ['address_2'], ['address_2']) }} as address_2,
    {{ json_extract_scalar('_airbyte_data', ['last_name'], ['last_name']) }} as last_name,
    {{ json_extract_scalar('_airbyte_data', ['created_at'], ['created_at']) }} as created_at,
    {{ json_extract_scalar('_airbyte_data', ['first_name'], ['first_name']) }} as first_name,
    {{ json_extract_scalar('_airbyte_data', ['updated_at'], ['updated_at']) }} as updated_at,
    {{ json_extract_scalar('_airbyte_data', ['postal_code'], ['postal_code']) }} as postal_code,
    _airbyte_emitted_at
from {{ source('raw_data', '_airbyte_raw_addresses') }} as table_alias
-- addresses

