
with final as (

select * from {{source('source_data','student')}}


)

select *,'{{ var('REC_SRC')}}' AS REC_SRC, '{{ var('DEL_IND')}}' AS DEL_IND from final
