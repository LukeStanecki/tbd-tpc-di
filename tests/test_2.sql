-- Cel: Upewnij się, że trade_timestamp w fact_holdings mieści się w zakresie dat effective_timestamp i end_timestamp w dim_account.
select
    fh.sk_current_trade_id,
    fh.trade_timestamp,
    a.effective_timestamp,
    a.end_timestamp
from {{ ref('fact_holdings') }} fh
join {{ ref('dim_account') }} a
on fh.sk_account_id = a.sk_account_id
where fh.trade_timestamp < a.effective_timestamp
   or fh.trade_timestamp > a.end_timestamp