/***************************************************************
Combining 2 Product Tables into 1

The chief growth officer is focused on reducing churn, or the 
number of customers that don't renew their annual subscription. 
She is planning to launch multiple product experiments and 
marketing campaigns throughout 2023 to drive users to renew 
their subscriptions. She's first conducting research to 
understand the potential impact that the churn initiative can 
have on the business. She reaches out to your team and asks 
when all active subscriptions are going to expire.

Because of data modeling limitations, your company was 
prevented from putting both products in the same table, so 
there are currently separate tables for each product, 
subscriptionsproduct1 and subscriptionsproduct2
***************************************************************/

With all_subscriptions as
(
select * from subscriptionsproduct1
where active = 1
union
select * from subscriptionsproduct2
where active = 1
)
select
	date_trunc('year', expirationdate) as exp_year, 
	count(*) as subscriptions
from 
	all_subscriptions
group by 
	date_trunc('year', expirationdate)
