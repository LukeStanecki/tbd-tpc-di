-- Cel: Upewnij się, że wszystkie sk_account_id w fact_cash_transactions istnieją w dim_account.

select 
    fct.sk_account_id
from {{ ref('fact_cash_transactions') }} fct
left join {{ ref('dim_account') }} a
on fct.sk_account_id = a.sk_account_id
where a.sk_account_id is null