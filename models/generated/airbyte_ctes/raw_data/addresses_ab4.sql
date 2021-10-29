{{ config(schema="_airbyte_raw_data", tags=["top-level-intermediate"]) }}
-- SQL model to prepare for deduplicating records based on the hash record column
select
  row_number() over (
    partition by _airbyte_addresses_hashid
    order by _airbyte_emitted_at asc
  ) as _airbyte_row_num,
  tmp.*
from {{ ref('addresses_ab3') }} tmp
-- addresses from {{ source('raw_data', '_airbyte_raw_addresses') }}

