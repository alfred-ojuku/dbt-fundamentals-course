{#My first Jinja code. A for loop that prints numbers in the for loop range except the last one#}

{%for i in range(10)%}

  SELECT {{i}} as number {%if not loop.last %} union all {%endif%}

{%endfor%}



{#Setting Variables in Jinja#}

{% set var = "Hello World!"%}
{% set var1 = "This is the first time I'm templating in Jinja"%}
{{var}} {{var1}}


{#Practicing with a list#}
{% set pizza_toppings = ['chicken', 'pineapple', 'beef',  'pepperoni', 'Hawaian'] %}

{#selecting individual elements in a list#}
{{ pizza_toppings[0] }}
{{ pizza_toppings[1] }}
{{ pizza_toppings[2] }}
{{ pizza_toppings[3] }}
{{ pizza_toppings[4] }}

{#Iterating over a pizza_toppings#}
{% set pizza_toppings = ['chicken', 'pineapple', 'beef',  'pepperoni', 'Hawaian'] %}
{%for topping in pizza_toppings%}
{{topping}}
{%endfor%}

{#if statements#}
{% set age = 24 %}
{%if age < 18 %}
 You are still and underage
{%else%}
 You are an adult  
 {%endif%}

{#If an for loop together#}
{#To eliminate whitespaces in the compiled code a - sign is added after the % sign#}
{%- set ages = [24, 67, 2,5, 78, 34, 7] -%}
{%- for age in ages -%}
{% if age < 18 %}
 Age {{age}} is still an underage
{% else %}
 Age {{age}} is an adult  
{% endif %}
{%- endfor -%}

{#dictionaries#}

{% set dict = {
    'word': 'data',
    'speech_part': 'noun',
    'defination': 'if you know you know'
}%}
{{dict['word']}}


{%- set dic = {"OdometerTrip":"0","ntcT1":"23.20","ntcT2":"20.00","ntcT3":"18.60","cb16":"0","cb33":"0","batS":"20","ntcP":"3","ps":"0","fc":"45000","dc":"73","rc":"22060","rc_p":"49","curr":"0","tv":"74340","c1v":"3716","c2v":"3716","c3v":"3718","c4v":"3716","c5v":"3717","c6v":"3716","c7v":"3716","c8v":"3715"} -%}

{%- set list = [] -%}
{%- for key in dic.keys() -%}
  {% set _ = list.append(key) %}
{%- endfor -%}

   WITH expanded AS (
    
    SELECT 
    {% for key in list %}
    JSON_EXTRACT_SCALAR(CanBusData, '$.{{key}}') AS {{key}}
    {%- if not loop.last -%}
      ,
    {%- endif -%}
    {% endfor %}
   FROM `analytics-383819`.`telemetry`.`data`
   WHERE CanBusData IS NOT NULL

)
SELECT * FROM expanded


SELECT
  {% for key in dic.keys() %}
  JSON_EXTRACT(CanBusData, '$.{{key}}') AS {{key}}
  {%- if not loop.last -%}
    ,
  {%- endif -%}
  {% endfor %}
FROM
  `analytics-383819`.`telemetry`.`data`



-- Hubspot JSON
{%- set list = ['hs_avatar_filemanager_key', 'createdate', 'total_money_raised', 'hs_analytics_last_touch_converting_campaign_timestamp_latest_value_81a64e30', 'type', 'hs_last_sales_activity_date', 'hs_target_account_recommendation_state', 'recent_conversion_event_name', 'hs_analytics_latest_source_timestamp', 'hubspot_owner_id', 'about_us', 'hs_date_entered_subscriber', 'annualrevenue', 'hs_created_by_user_id', 'num_associated_deals', 'hs_analytics_num_page_views', 'hs_date_entered_customer', 'state', 'engagements_last_meeting_booked_campaign', 'hs_last_sales_activity_timestamp', 'zip', 'hubspotscore', 'recent_conversion_event_name_timestamp_latest_value_66c820bf', 'recent_deal_close_date', 'hs_analytics_last_visit_timestamp_timestamp_latest_value_999a0fce', 'hs_time_in_customer', 'hs_time_in_salesqualifiedlead', 'twitterhandle', 'hs_date_entered_opportunity', 'phone', 'hs_additional_domains', 'hs_analytics_first_visit_timestamp_timestamp_earliest_value_accc17ae', 'domain', 'hs_last_logged_call_date', 'hs_analytics_latest_source', 'hs_analytics_num_page_views_cardinality_sum_e46e85b0', 'closedate_timestamp_earliest_value_a2a17e6e', 'first_conversion_event_name', 'hs_updated_by_user_id', 'city', 'hs_predictivecontactscore_v2_next_max_max_d4e58c1e', 'facebook_company_page', 'hs_all_team_ids', 'hs_pipeline', 'hs_read_only', 'hs_analytics_first_timestamp_timestamp_earliest_value_11e3a63a', 'hs_num_blockers', 'industry', 'web_technologies', 'engagements_last_meeting_booked_medium', 'hubspot_team_id', 'first_conversion_event_name_timestamp_earliest_value_68ddae0a', 'hs_analytics_source', 'hs_user_ids_of_all_notification_followers', 'recent_deal_amount', 'hs_analytics_first_touch_converting_campaign', 'hs_all_owner_ids', 'hs_ideal_customer_profile', 'website', 'address', 'hs_pinned_engagement_id', 'hs_analytics_first_timestamp', 'hs_analytics_last_touch_converting_campaign', 'hs_date_entered_evangelist', 'hs_date_entered_161123005', 'hs_date_exited_lead', 'engagements_last_meeting_booked', 'hs_time_in_lead', 'hs_user_ids_of_all_owners', 'hs_target_account_recommendation_snooze_time', 'hs_date_exited_other', 'hs_lastmodifieddate', 'hubspot_owner_assigneddate', 'notes_last_contacted', 'is_public', 'hs_lead_status', 'hs_object_source_user_id', 'num_notes', 'hs_last_sales_activity_type', 'twitterfollowers', 'country', 'hs_all_accessible_team_ids', 'hs_date_exited_evangelist', 'hs_latest_createdate_of_active_subscriptions', 'hs_user_ids_of_all_notification_unfollowers', 'num_associated_contacts', 'hs_date_entered_lead', 'hs_analytics_last_timestamp_timestamp_latest_value_4e16365a', 'first_conversion_date_timestamp_earliest_value_61f58f2c', 'hs_time_in_subscriber', 'days_to_close', 'hs_total_deal_value', 'hs_date_exited_marketingqualifiedlead', 'hs_time_in_161680072', 'linkedin_company_page', 'hs_date_entered_marketingqualifiedlead', 'first_deal_created_date', 'hs_analytics_source_data_1_timestamp_earliest_value_9b2f1fa1', 'hs_object_source_id', 'hs_time_in_161123005', 'hs_date_entered_other', 'hs_time_in_marketingqualifiedlead', 'hs_was_imported', 'hs_num_open_deals', 'notes_last_updated', 'first_contact_createdate_timestamp_earliest_value_78b50eea', 'hs_time_in_other', 'first_conversion_date', 'hs_target_account', 'hs_time_in_opportunity', 'hs_is_target_account', 'hs_analytics_first_touch_converting_campaign_timestamp_earliest_value_4757fe10', 'hs_analytics_source_data_2_timestamp_earliest_value_9b2f9400', 'first_contact_createdate', 'hs_date_exited_subscriber', 'hs_date_entered_salesqualifiedlead', 'num_conversion_events', 'hs_object_id', 'name', 'hs_merged_object_ids', 'hs_time_in_evangelist', 'hs_sales_email_last_replied', 'hs_analytics_num_visits_cardinality_sum_53d952a6', 'hs_parent_company_id', 'timezone', 'description', 'hs_analytics_latest_source_data_2', 'hs_date_exited_161680072', 'hs_analytics_latest_source_data_1', 'hs_analytics_last_timestamp', 'hs_date_exited_salesqualifiedlead', 'numberofemployees', 'hs_date_exited_opportunity', 'hs_analytics_num_visits', 'twitterbio', 'hs_last_booked_meeting_date', 'hs_analytics_last_visit_timestamp', 'hs_unique_creation_key', 'recent_conversion_date_timestamp_latest_value_72856da1', 'num_contacted_notes', 'founded_year', 'hs_createdate', 'hs_annual_revenue_currency_code', 'hs_date_entered_161680072', 'hs_date_exited_161123005', 'num_conversion_events_cardinality_sum_d095f14b', 'facebookfans', 'linkedinbio', 'notes_next_activity_date', 'closedate', 'engagements_last_meeting_booked_source', 'address2', 'hs_analytics_first_visit_timestamp', 'hs_last_open_task_date', 'hs_analytics_source_timestamp_earliest_value_25a3a52c', 'hs_target_account_probability', 'hs_num_decision_makers', 'total_revenue', 'hs_num_child_companies', 'hs_num_contacts_with_buying_roles', 'recent_conversion_date', 'hs_object_source', 'hs_analytics_source_data_2', 'hs_date_exited_customer', 'hs_analytics_source_data_1', 'hs_latest_meeting_activity', 'lifecyclestage', 'googleplus_page'] -%}

   WITH expanded AS (
    
    SELECT
    id,
    createdAt,
    updatedAt,
    {% for key in list %}
    JSON_EXTRACT_SCALAR(properties, '$.{{key}}') AS {{key}}
    {%- if not loop.last -%}
      ,
    {%- endif -%}
    {% endfor %}
   FROM `analytics-383819`.`telemetry`.`companies`
   WHERE properties IS NOT NULL

)
SELECT * FROM expanded


