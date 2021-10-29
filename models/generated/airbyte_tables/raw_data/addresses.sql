{{ config(schema="raw_data", tags=["top-level"]) }}
-- Final base SQL model
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
    _airbyte_emitted_at,
    _airbyte_addresses_hashid
from {{ ref('addresses_scd') }}
-- addresses from {{ source('raw_data', '_airbyte_raw_addresses') }}
where _airbyte_active_row = 1

