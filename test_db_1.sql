-- Hellow World SQL Query, SELECT all records from the actor table
select * from customer;

-- Query for first_name and last_name in the actor table 
select first_name, last_name
from actor;

-- Query for a first_name that equals Nick using the WHERE clause
select first_name, last_name
from actor  
where first_name = 'Nick';

-- Query for a first_name that is equal to Nick using the LIKE and WHERE clauses
select first_name, last_name
from actor 
where first_name like 'Nick';

-- Query for all first_name data that starts with a 3 using LIKE and WHERE -- using a wildcard
select first_name, actor_id
from actor 
where first_name like '34';

--  Query for all first_name data that starts with K and has 2 letters after the K using LIKE and WHERE clauses using underscore
select first_name, last_name, actor_id
from actor 
where first_name like 'K__';

-- Query for all first_name data that starts with a K and ends with then 
-- using LIKE and WHERE and using BOTH wildcard and underscore
select first_name, last_name, actor_id
from actor
where first_name like 'K______%';

-- Comparing operators are;
--Greater than (>)
--Less than <
--Greater than or equal to >=
--Less than or equal to <=
--Not equal <>

-- Explore DATA with SELECT all query (specific to changing into a new table)
select *
from payment;

-- Query for data that shows customers who paid an amount GREATER than $2
select customer_id, amount
from payment 
where amount > 2.00;

-- Query for data that shows customers who paid an amount LESS than $7.99
select customer_id, amount
from payment
where amount < 7.99;

-- Query for data that shows customers who paid 
-- an amount LESS or EQUAL to than $7.99
select customer_id, amount
from payment 
where amount <= 7.99;

-- Query for data that shows customers who paid an amount GREATER than or EQUAL to 2.00 in ASCENDING order 
select customer_id, amount
from payment 
where amount >= 2.00
order by amount asc;

-- Query for the data that shows customers who paid
-- an amount BETWEEN 2.00 and 7.99
-- Using the BETWEEN with the AND clause
select customer_id, amount
from payment 
where amount between 2.00 and 7.99;

-- Query for data data that shows customers who paid
-- an amount NOT EQUAL to 0.00
-- Ordered in DESCENDING order
select customer_id, amount
from payment
where amount <> 0.00
order by amount desc; 

-- SQL Aggregations: SUM, AVG, COUNT, MIN, MAX

-- Query to display the sum of amounts paid that are greater than 5.99
select SUM(amount)
from payment
where amount > 5.99;

-- Query to display average of amounts paid that are greater than 5.99
select AVG(amount)
from payment 
where amount > 5.99;

-- Query to display the count of amounts paid that are greater than 5.99
select COUNT(amount) as elephant
from payment p where amount > 5.99;

-- Query to display the count of unique amounts paid that are greater than 5.99
select COUNT(distinct amount)
from payment
where amount > 5.99;

-- Query to display minimum amount greater than 7.99
select MIN(amount) as Min_Num_payments
from payment 
where amount > 7.99;

-- Query to display maximum amount greater than 7.99
select MAX(amount) as Max_Num_payments
from payment 
where amount > 7.99;

-- Query to display all amounts ( as a demon of groupby)
select amount
from payment 
where amount = 7.99;

-- Query to display different amounts grouped together
-- and count the amounts
select amount, COUNT(amount)
from payment
group by amount
order by amount; 

-- Query to display customer_ids with the summed amount for each customer_id 
select customer_id, SUM(amount)
from payment 
group by customer_id 
order by SUM(amount) desc;

-- Query to display customer_ids with the amount for each customer id
-- Separate example of group by
select customer_id, amount
from payment 
group by amount, customer_id 
order by customer_id desc;

-- Query to explore the data inside of the customer table
select * from customer;

-- Query to display customer IDs that show up more than 5 times
-- Group by the customer's email
select COUNT(customer_id), email
from customer 
where email like 'j__.w%'
group by email 
having COUNT(customer_id) > 0;

--Week 5 - Monday Questions
--
--1. How many actors are there with the last name ‘Wahlberg’?
select count(*)
from actor 
where last_name = 'Wahlberg';

--2. edit How many payments were made between $3.99 and $5.99?
select count(*)
from payment 
where amount between 3.99 and 5.99;

-- feel like this code should work?
--3. What film does the store have the most of? (search in inventory)
select film_id, count(*)
from inventory 
group by film_id
order by count(*) desc; 

-- Got 193 with 8 :/

--4. How many customers have the last name ‘William’?
select count(*)
from customers 
where last_name = 'William';

--5. What store employee (get the id) sold the most rentals?
select staff_id, count(rental_id)
from rental
group by staff_id
order by count(rental_id) desc;

--6. edit How many different district names are there?
select district_name, count(district_name)
from district
group by district_name; 

--7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(film_id) as num_actors
from film_actor 
group by film_id 
order by count(film_id) desc;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(*)
from customer
where store_id = 1 and last_name like '%es';

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
select amount, count(rental_id) as rentals
from payment 
where customer_id between 380 and 430
group by amount having count(rental_id) > 250;

--10. Within the film table, how many ratings categories are there? And what rating has the most movies total?
select rating, count(*)
from film 
group by rating;
