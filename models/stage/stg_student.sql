{% set yaml_metadata %}
source_model: raw_student
hashed_columns:
  HK_STUDENT: ID
derived_columns:
  LOAD_TS: CURRENT_TIMESTAMP()


{% endset %}   

{% set metadata_dict = fromyaml(yaml_metadata) %}
{% set hashed_columns=metadata_dict['hashed_columns']%}
{% set derived_columns=metadata_dict['derived_columns']%}

with staging as (
{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=derived_columns,
                     null_columns=none,
                     hashed_columns=hashed_columns,
                     ranked_columns=none) }})


select * from staging 