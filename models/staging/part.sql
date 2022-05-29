{{
    config(
        engine='MergeTree()',
        order_by='(P_PARTKEY)'
    )
}}

SELECT

    {{ dbt_utils.star(from = source('ssb-dbgen', 'part')) }}

FROM {{ source('ssb-dbgen', 'part') }}
