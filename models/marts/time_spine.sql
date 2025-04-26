{{
    config(
        materialized = 'table',
    )
}}

with days as (

{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2020-01-01' as date)",
    end_date="cast('2026-01-01' as date)"
   )
}}

)

    select cast(date_day as date) as date_day
    , date_trunc(cast(date_day as date), QUARTER) as almost_fiscal_quarter
    from days
