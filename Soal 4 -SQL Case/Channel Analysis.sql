with top_5_countries as (
	select country, sum(totalTransactionRevenue) as total_revenue_country
    from ecommerce_session
    group by country
    order by total_revenue_country desc
    limit 5)

select channelGrouping, sum(totalTransactionRevenue) as total_revenue_channel
from ecommerce_session
where country in (select country from top_5_countries)
group by channelGrouping
order by total_revenue_channel desc

-- First I query the 5 countries that had highest revenue on top_5_countries cte
-- After I get the list of top 5 countries, i put it on the where condition to filter the data
-- Then I query the total revenue per channel with where condition I explain above