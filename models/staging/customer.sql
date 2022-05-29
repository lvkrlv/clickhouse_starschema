{{
    config(
        engine='MergeTree()',
        order_by='(C_CUSTKEY)'
    )
}}

SELECT

    {{ dbt_utils.star(from = source('ssb-dbgen', 'customer')) }}

FROM {{ source('ssb-dbgen', 'customer') }}