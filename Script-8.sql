--Question 1. List all customers who live in Texas (use JOINs)
SELECT c.customer_id, c.first_name, c.last_name, c.address_id,
a.address_id , a.district
FROM customer c
JOIN address a 
ON c.customer_id = a.address_id
WHERE a.district = 'Texas';


--Question 2. List all payments of more than $7.00 with the customer’s first and last name
SELECT c.customer_id, c.first_name, c.last_name, c.address_id,
p.payment_id, p.amount 
FROM customer c
JOIN payment p 
ON c.customer_id = p.payment_id 
WHERE p.amount > 7;

--Question 3.Show all customer names who have made over $175 in payments (use subqueries)
SELECT customer_id, first_name, last_name
FROM customer 
WHERE payment_id IN (
	SELECT payment_id , amount
	FROM payment 
	GROUP BY customer_id, amount
	HAVING SUM(amount) > $175
);

--Question 4. List all customers that live in Argentina (use the city table)
SELECT c.first_name, c.last_name, a.district, d.city, e.country
FROM customer c
JOIN address a 
ON c.customer_id = a.address_id
JOIN city d 
ON a.address_id = d.city_id 
JOIN country e 
ON d.city_id = e.country_id 
WHERE e.country  = 'Argentina';

--Question 5. Show all the film categories with their count in descending order5. Show all the film categories with their count in descending order






