

  create or replace table `dc-warehouses`.`raw_data`.`test_model`
  
  
  OPTIONS()
  as (
    

with customer_orders as (
  select
    time,
    tag,
    data as jsonData,
    json_extract_scalar(data, '$.log') AS log,

  from `dc-warehouses.raw_data.logs_trackfoe_prod`
  where data like '%GET%tracking%'
  limit 20
)

select
  time,
  tag,
  jsonData,
  log,
  json_extract_scalar(log, '$.message') AS message,
  REGEXP_EXTRACT_ALL(json_extract_scalar(log, '$.path'),r'(?:\?|&)((?:[^=]+)=(?:[^&]*))') as params,
from customer_orders
  );
    