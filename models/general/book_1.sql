{{
    config(
        materialized='incremental',
        unique_key=['book_id','B_NAME'],
        incremental_strategy='merge'
    )
}}


with final as (

select * from {{source('sw_data','book')}}


)

select * from final
