--Question 1. List all customers who live in Texas (use JOINs)
SELECT c.customer_id, c.first_name, c.last_name, c.address_id,
a.address_id , a.district
FROM address a
JOIN customer c
ON a.address_id = c.customer_id
WHERE a.district = 'Texas';


--Question 2. List all payments of more than $7.00 with the customer’s first and last name
SELECT c.first_name, c.last_name, p.amount 
FROM customer c
JOIN payment p 
ON c.customer_id = p.payment_id 
WHERE p.amount > 7;

--Question 3.Show all customer names who have made over $175 in payments (use subqueries)
SELECT customer_id, first_name, last_name
FROM customer 
WHERE customer_id IN (
	SELECT customer_id
	FROM payment 
	GROUP BY customer_id
	HAVING SUM(amount) > $175
);

--Question 4. List all customers that live in Argentina (use the city table)
SELECT c.first_name, c.last_name, a.district, d.city, e.country
FROM customer c
JOIN address a 
ON c.address_id = a.address_id
JOIN city d 
ON a.city_id = d.city_id 
JOIN country e 
ON d.country_id = e.country_id 
WHERE country  = 'Argentina';

--Question 5. Show all the film categories with their count in descending order5. Show all the film categories with their count in descending order
SELECT category.category_id, name, COUNT(*)
FROM film_category
JOIN category 
ON film_category.category_id = category.category_id
GROUP BY category.category_id
ORDER BY COUNT(*) DESC;

--Question 6. What film had the most actors in it (show film info)?
SELECT fa.film_id, f.title, COUNT(*) AS num_actors
FROM film_actor fa
JOIN film f 
ON fa.film_id = f.film_id
GROUP BY fa.film_id, f.title
ORDER BY num_actors DESC
LIMIT 1;

--Question 7. Which actor has been in the least movies?
SELECT fa.actor_id, a.first_name, a.last_name, COUNT(*) AS num_films
FROM film_actor fa
JOIN actor a 
ON a.actor_id = fa.actor_id
GROUP BY fa.actor_id, a.first_name, a.last_name
ORDER BY num_films
LIMIT 1;

--Question 8. 
SELECT ci.country_id, co.country, COUNT(*) AS num_cities
FROM city ci
JOIN country co
ON ci.country_id = co.country_id
GROUP BY ci.country_id, co.country
ORDER BY num_cities DESC;


--Question 9.
SELECT fa.actor_id, a.first_name, a.last_name, COUNT(*) AS num_films
FROM film_actor fa
JOIN actor a
ON fa.actor_id = a.actor_id 
GROUP BY fa.actor_id, a.first_name, a.last_name 
HAVING COUNT(*) BETWEEN 20 AND 25;






