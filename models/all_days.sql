{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2023-09-01' as date)",
    end_date="cast('2023-09-07' as date)"
   )
}}