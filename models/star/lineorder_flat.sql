{{
    config(
        engine='MergeTree()',
        partition_by='toYear(LO_ORDERDATE)',
        order_by='(LO_ORDERDATE, LO_ORDERKEY)'
    )
}}

SELECT
    {{ hash_(surrogate_key_ch(['LO_ORDERKEY','LO_LINENUMBER'])) }} AS hash_key,
    {{ surrogate_key_ch(['LO_ORDERKEY','LO_LINENUMBER']) }} AS surrogate_key,
    {{ dbt_utils.star(from = source('ssb-dbgen', 'lineorder')) }},
    {{ dbt_utils.star(from = source('ssb-dbgen', 'customer')) }},
    {{ dbt_utils.star(from = source('ssb-dbgen', 'supplier')) }},
    {{ dbt_utils.star(from = source('ssb-dbgen', 'part')) }}

FROM {{ source('ssb-dbgen', 'lineorder') }} l
INNER JOIN {{ source('ssb-dbgen', 'customer') }} AS c ON c.C_CUSTKEY = l.LO_CUSTKEY
INNER JOIN {{ source('ssb-dbgen', 'supplier') }} AS s ON s.S_SUPPKEY = l.LO_SUPPKEY
INNER JOIN {{ source('ssb-dbgen', 'part') }} AS p ON p.P_PARTKEY = l.LO_PARTKEY




