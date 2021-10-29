

  create or replace table `dc-warehouses`.`raw_data`.`raw_data_addresses`
  
  
  OPTIONS()
  as (
    

with raw_data_addresses as (
  select
    json_extract(_airbyte_data, '$.id') AS id,
    json_extract(_airbyte_data, '$.uid') AS uid,
    json_extract(_airbyte_data, '$.user_id') AS user_id,
    json_extract(_airbyte_data, '$.address_1') AS address_1,
    json_extract(_airbyte_data, '$.address_2') AS address_2,
    json_extract(_airbyte_data, '$.state') AS state,
    json_extract(_airbyte_data, '$.province') AS province,
    json_extract(_airbyte_data, '$.postal_code') AS postal_code,
    json_extract(_airbyte_data, '$.country') AS country,
    json_extract(_airbyte_data, '$.phone') AS phone,
    json_extract(_airbyte_data, '$.first_name') AS first_name,
    json_extract(_airbyte_data, '$.last_name') AS last_name,
    json_extract(_airbyte_data, '$.created_at') AS created_at,
    json_extract(_airbyte_data, '$.updated_at') AS updated_at,
    json_extract(_airbyte_data, '$.ward') AS ward,

  from `dc-warehouses.raw_data._airbyte_raw_addresses`

  limit 39
)

select
  *
from raw_data_addresses
  );
    