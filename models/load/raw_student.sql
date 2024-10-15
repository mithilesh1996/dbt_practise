
with final as (

select * from {{source('sw_data','student')}}


)

select * from final
