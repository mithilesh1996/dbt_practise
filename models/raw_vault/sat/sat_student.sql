{%- set yaml_metadata -%}
source_model: stg_student
src_pk: ['HK_STUDENT','ID']   
src_hashdiff: HDIFF_H_STD
src_payload:
    - NAME
    - CITY
    - DEL_IND
src_ldts: LOAD_TS
src_source: REC_SRC
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

with
    final as (

        {{
            automate_dv.sat
            (   
                source_model=metadata_dict["source_model"],
                src_pk=metadata_dict["src_pk"],                  
                src_payload=metadata_dict["src_payload"],
                src_hashdiff=metadata_dict["src_hashdiff"],   
                src_ldts=metadata_dict["src_ldts"],
                src_source=metadata_dict["src_source"],
                  
            )
        }}
    )

select *
from final
