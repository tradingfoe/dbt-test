{{ config(schema="_airbyte_raw_data", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        'id',
        'uid',
        'ward',
        'email',
        'phone',
        'state',
        'country',
        'user_id',
        'province',
        'address_1',
        'address_2',
        'last_name',
        'created_at',
        'first_name',
        'updated_at',
        'postal_code',
    ]) }} as _airbyte_addresses_hashid,
    tmp.*
from {{ ref('addresses_ab2') }} tmp
-- addresses

