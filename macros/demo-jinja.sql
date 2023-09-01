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