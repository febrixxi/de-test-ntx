with user_behavior as (
select fullvisitorid, round(avg(timeonsite), 0) as avg_timeonsite, round(avg(pageviews), 0) as avg_pageviews, 
round(avg(sessionqualitydim), 0) as avg_sessionqualitydim
from ecommerce_session
group by fullVisitorId)

select fullvisitorid
from user_behavior
where avg_timeonsite > (select round(avg(timeonsite), 0) from ecommerce_session)
and avg_pageviews < (select round(avg(pageviews), 0) from ecommerce_session)

-- First I get the average of timeonsite, pageviews and sessionqualitydim and grouping by fullvisitorid
-- Then I select the fullvisitorid that had above avg timeonsite and below avg pageviews