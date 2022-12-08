-- 1. Write a query to display for each store its store ID, city, and country.
select store_id, city, country from store s join address a on s.address_id = a.address_id
join city on a.city_id = city.city_id 
join country on city.country_id = country.country_id;

-- 2. Write a query to display how much business, in dollars, each store brought in.
select s.store_id, sum(amount) from store s join customer c on s.store_id = c.store_id
join payment p on c.customer_id = p.customer_id
group by store_id;

-- 3. What is the average running time of films by category?
select c.name, avg(length) from film f join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
group by c.name;

-- 4. Which film categories are longest?
select c.name, avg(length) as average_running_time from film f join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
group by c.name
order by average_running_time desc limit 1;

-- 5. Display the most frequently rented movies in descending order.
select f.film_id, title, count(rental_id) from film f join inventory i using (film_id) 
join rental r using (inventory_id)
group by film_id, title
order by count(rental_id) desc;

-- 6. List the top five genres in gross revenue in descending order.
select c.name, sum(amount) as gross_revenue from payment p join rental r using (rental_id) join inventory using (inventory_id)
join film_category using (film_id) join category c using (category_id) group by c.name;