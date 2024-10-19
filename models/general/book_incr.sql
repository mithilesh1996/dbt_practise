{{
    config(
        materialized='incremental',
        unique_key='date_day'
    )
}}