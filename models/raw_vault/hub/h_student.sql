{%- set yaml_metadata -%}
source_model: 
    - stg_student
src_pk: HK_STUDENT
src_nk: ID
src_ldts: LOAD_TS
src_source: REC_SRC
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

with staging as (
{{ automate_dv.hub(src_pk=metadata_dict["src_pk"],
                   src_nk=metadata_dict["src_nk"], 
                   src_ldts=metadata_dict["src_ldts"],
                   src_source=metadata_dict["src_source"],
                   source_model=metadata_dict["source_model"]) }}

)


select * from staging