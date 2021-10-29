select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select *
from `dc-warehouses`.`raw_data`.`raw_data_addresses`
where id is null



      
    ) dbt_internal_test