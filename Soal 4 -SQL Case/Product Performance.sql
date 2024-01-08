with 
    total_revenue_per_product as (
	select v2productname, ifnull(sum(totaltransactionrevenue),0) as product_revenue
    from ecommerce_session
    group by v2productname),
    
    total_product_sold as (
    select v2productname, ifnull(sum(productQuantity),0) as product_sold
    from ecommerce_session
    group by v2productname),
    
    total_refund_amount as (
    select v2productname, ifnull(sum(productRefundAmount),0) as product_refund
    from ecommerce_session
    group by v2productname)

select e.v2productname, (product_revenue - product_refund) as net_revenue, 
if(product_revenue*0.1<product_refund,'>10%','<10%') refund_more_than_10percent
from ecommerce_session e
join total_revenue_per_product r on e.v2productname = r.v2productname
join total_product_sold s on e.v2productname = s.v2productname
join total_refund_amount f on e.v2productname = f.v2productname
group by e.v2ProductName
order by net_revenue desc

-- First i create CTE based on task requested, I identify product revenue, product sold and product refund amount
-- Then i select v2productname from the table and join it with cte to combine the result and doing the calculation