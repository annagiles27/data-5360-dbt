{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT 
    e.Employee_Key,
    d.Date_Key,
    ec.certification_name,
    ec.certification_cost
FROM {{ ref('stg_employee_certifications')}} ec 
INNER JOIN {{ ref('oliver_dim_date') }} d on d.Date_Day = ec.certification_awarded_date
INNER JOIN {{ ref('oliver_dim_employee') }} e on e.Employee_ID = ec.employee_id