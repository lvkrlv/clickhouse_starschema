---

{%- macro surrogate_key_ch(field_list) -%}

    {%- set fields = [] -%}

    {%- for field in field_list -%}

        {%- set _ = fields.append(
            "coalesce(cast(" ~ field ~ " as String), '')"
        ) -%}

        {%- if not loop.last %}
            {%- set _ = fields.append("'-'") -%}
        {%- endif -%}

    {%- endfor -%}

{{ concat_(fields) }}

{%- endmacro -%}

---

{%- macro concat_(fields) -%}

    {{ fields|join(' || ') }}

{%- endmacro -%}

---

{%- macro hash_(field) -%}

    hex(MD5( {{field}} ))

{%- endmacro -%}

---