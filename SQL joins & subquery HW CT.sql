-- Question 1 1)jennifer davis, 2) kim cruz 3) richard mccrary 4)Bryan Hardison 5)Ian Still

select customer.first_name, customer.last_name, district 
from customer
full join address 
on customer.address_id = address.address_id 
where district = 'Texas'

-- Question 2 So it looks like there is 539 lines of names... soooo this is how i got there
select customer.first_name , customer.last_name
from customer
full join payment 
on customer.customer_id = payment.customer_id 
where amount > 6.99
group by customer.first_name, customer.last_name 

-- Question 3 There are 3. 1)Jennifer Davis, 2) Harold Martino, 3) Mary Smith

select first_name, last_name
from customer 
where customer_id in (
	select customer_id
	from payment
	group by customer_id, amount
	having amount > 175.00
	);

--Question 4 Looks like there is only 1!! Kevin Schuler!

select customer.first_name , customer.last_name, country
from customer 
full join address
on customer.address_id = address.address_id
full join city 
on address.city_id = city.city_id 
full join country
on city.country_id = country.country_id 
where country = 'Nepal'

-- Question 5 Jon Stephens had 8 more transactions than Mike Hillyer

select staff.first_name , staff.last_name, count(payment_id)
from staff 
full join payment  
on staff.staff_id = payment.staff_id 
group by  staff.first_name, staff.last_name

-- Question 6 There are : PG-13:223, NC-17:210, R:195, PG:194, G:178

select count(film_id), rating
from film 
group by rating 

-- Question 7 looks like there is 539 again. This is how i got there.
select customer.first_name , customer.last_name
from customer
where customer_id in(
	select customer_id 
	from payment 
	group by customer_id, amount 
	having amount > 6.99
	);
	
-- Question 8 there were 24 rental givaways 

select count(amount) 
from payment
where amount = 0.00