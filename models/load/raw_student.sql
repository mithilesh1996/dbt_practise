
with final as (

select * from {{source('sw_data','student')}}


)

select a.*,'{{var('REC_SRC')}}' as REC_SRC from final a
