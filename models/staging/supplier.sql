{{
    config(
        engine='MergeTree()',
        order_by='(S_SUPPKEY)'
    )
}}

SELECT

    {{ dbt_utils.star(from = source('ssb-dbgen', 'supplier')) }}

FROM {{ source('ssb-dbgen', 'supplier') }}