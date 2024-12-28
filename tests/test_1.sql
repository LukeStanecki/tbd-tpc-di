-- Cel: Upewnij się, że kolumna sk_trade_id jest unikalna i nie zawiera duplikatów.
select
    sk_trade_id,
    count(*) cnt
from {{ ref('dim_trade') }}
group by sk_trade_id
having cnt > 1