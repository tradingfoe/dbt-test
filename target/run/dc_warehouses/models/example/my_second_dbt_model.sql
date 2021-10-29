

  create or replace view `dc-warehouses`.`raw_data`.`my_second_dbt_model`
  OPTIONS()
  as -- Use the `ref` function to select from other models

select *
from `dc-warehouses`.`raw_data`.`my_first_dbt_model`
where id = 1;

