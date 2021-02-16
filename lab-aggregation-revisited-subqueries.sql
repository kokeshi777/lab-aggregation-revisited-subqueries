#Question 1
select distinct(c.first_name),c.last_name,c.email from customer as c
right join rental as r using (customer_id);
#Question 2
select distinct(p.customer_id) as customer_n, concat(c.first_name,' ',c.last_name) as name,c.email, avg(p.amount) from customer as c
right join payment as p using (customer_id)
group by customer_n;
#Question 3.1
select distinct(customer_id), c.name, concat(cu.first_name,' ', cu.last_name),cu.email from category as c
right join film_category as fc using (category_id)
right join inventory as i using (film_id)
right join rental as r using (inventory_id)
right join customer as cu using(customer_id)
where c.name = 'action';
#Question 3.2
select distinct(c.first_name),c.last_name,c.email from customer as c
right join rental as r
using(customer_id)
join inventory as i
using(inventory_id)
where i.film_id in (select f.film_id from film as f
join film_category as fc
using (film_id)
join category as c
using(category_id)
where c.name in ("action"));
# Question 4
select payment_id, amount,
case 
when amount <= 2 then "low" 
when amount > 4 then "high" 
else "medium"
end as classification 
from payment;