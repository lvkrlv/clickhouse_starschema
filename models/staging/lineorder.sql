{{
    config(
        engine='MergeTree()',
        partition_by='toYear(LO_ORDERDATE)',
        order_by='(LO_ORDERDATE, LO_ORDERKEY)'
    )
}}

SELECT

    {{ dbt_utils.star(from = source('ssb-dbgen', 'lineorder')) }}

FROM {{ source('ssb-dbgen', 'lineorder') }}

