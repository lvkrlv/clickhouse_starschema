{{
    config(
        engine='MergeTree()',
        order_by='(month)'
    )
}}

SELECT
    date_trunc('month', LO_ORDERDATE) month, 
    S_REGION AS supplier_region,
    {{ dbt_utils.pivot(
        'C_REGION',
        dbt_utils.get_column_values(ref('lineorder_flat'), 'C_REGION'),
        agg='sum',
        then_value='LO_REVENUE',
        suffix='_customers_rev'
    ) }}
FROM {{ ref('lineorder_flat') }}
GROUP BY 
    month,
    S_REGION
ORDER BY 
    month,
    supplier_region

