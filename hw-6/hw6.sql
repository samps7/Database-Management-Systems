
/**********************************************************************
 * NAME: Samuel Sovi
 * CLASS: CPSC 321 Section 1
 * DATE: 11/22/22
 * HOMEWORK: HW-6
 * DESCRIPTION: Queries practice
 **********************************************************************/


-- TODO: Implement the queries for HW6 below. Include comments as
--       appropriate.


-- Quesiton 1: 

\! echo 'Question 1:';
SELECT COUNT(*), MIN(length), MAX(length), AVG(length), COUNT(DISTINCT special_features)
FROM film;


-- Question 2:

\! echo 'Question 2:';
SELECT rating, COUNT(*), ROUND(AVG(length), 2)
FROM film
GROUP BY rating
ORDER BY AVG(length) DESC;

-- Question 3:

\! echo 'Question 3:';
SELECT f.rating, COUNT(*)
FROM film f JOIN film_actor fa on (f.film_id = fa.film_id)
GROUP BY f.rating
ORDER BY COUNT(*) DESC;

-- Question 4:

\! echo 'Question 4:';
SELECT c.name, COUNT(*), ROUND(MIN(f.rental_rate), 2), ROUND(MAX(f.rental_rate), 2), ROUND(AVG(f.rental_rate), 2), ROUND(MIN(f.replacement_cost), 2), ROUND(MAX(f.replacement_cost), 2), ROUND(AVG(f.replacement_cost), 2)
FROM film f JOIN film_category fc ON (f.film_id = fc.film_id) JOIN category c ON (c.category_id = fc.category_id)
GROUP BY c.category_id
ORDER BY c.name ASC;

-- Question 5:

\! echo 'Question 5:';
SELECT f.rating, COUNT(*)
FROM rental r JOIN inventory i ON (r.inventory_id = i.inventory_id) JOIN film f ON (i.film_id = f.film_id) JOIN film_category fc ON (f.film_id = fc.film_id) JOIN category c ON (c.category_id = fc.category_id)
WHERE c.name = "Horror" AND i.store_id = 1
GROUP BY f.rating
ORDER BY COUNT(*) DESC;

-- Question 6:

\! echo 'Question 6:';
SELECT f.title, f.rating, COUNT(*)
FROM rental r JOIN inventory i ON (r.inventory_id = i.inventory_id) JOIN film f ON (i.film_id = f.film_id) JOIN film_category fc ON (f.film_id = fc.film_id) JOIN category c ON (c.category_id = fc.category_id)
WHERE c.name = "Horror"
GROUP BY f.film_id
ORDER BY COUNT(*) DESC, f.rating DESC -- note: the f.rating in ORDER BY is here to match the example
LIMIT 15;


-- Question 7:

\! echo 'Question 7:';
SELECT f.title, COUNT(*)
FROM rental r JOIN inventory i ON (r.inventory_id = i.inventory_id) JOIN film f ON (i.film_id = f.film_id) JOIN film_category fc ON (f.film_id = fc.film_id) JOIN category c ON (c.category_id = fc.category_id)
WHERE f.rating = "G" AND c.name = "Action"
GROUP BY f.film_id
HAVING COUNT(*) >= 15
ORDER BY COUNT(*) DESC;


-- Question 8:

\! echo 'Question 8:';
SELECT a.first_name, a.last_name, COUNT(*)
FROM film f JOIN film_category fc ON (f.film_id = fc.film_id) JOIN category c ON (c.category_id = fc.category_id) JOIN film_actor fa ON (f.film_id = fa.film_id) JOIN actor a ON (a.actor_id = fa.actor_id)
WHERE c.name = "Horror"
GROUP BY a.actor_id
HAVING COUNT(*) >= 4
ORDER BY COUNT(*) DESC, a.last_name, a.first_name; 

-- Question 9:

\! echo 'Question 9:';
SELECT c.first_name, c.last_name, COUNT(*)
FROM rental r JOIN inventory i ON (r.inventory_id = i.inventory_id) JOIN film f ON (i.film_id = f.film_id) JOIN customer c ON (r.customer_id = c.customer_id)
WHERE f.rating = "PG"
GROUP BY c.customer_id
HAVING COUNT(*) > 10
ORDER BY COUNT(*) DESC, c.last_name, c.first_name; 

-- Question 10:

\! echo 'Question 10:';
\! echo '';
\! echo 'Purpose:';
\! echo 'Find number of movie rentals, number of distinct customers, total revenue generated and average replacment cost of each movie category ordered by most revenue to least';
\! echo '';

SELECT c.name, ROUND(SUM(p.amount), 2), COUNT(*), COUNT(DISTINCT cu.customer_id), ROUND(AVG(f.replacement_cost), 2)
FROM payment p JOIN rental r ON (p.rental_id = r.rental_id) JOIN inventory i ON (r.inventory_id = i.inventory_id) JOIN film f ON (i.film_id = f.film_id) JOIN film_category fc ON (f.film_id = fc.film_id) JOIN category c ON (c.category_id = fc.category_id) JOIN customer cu ON (r.customer_id = cu.customer_id)
GROUP BY c.category_id
ORDER BY SUM(p.amount) DESC;

\! echo '';
\! echo 'Why this is interesting:';
\! echo 'As we can see, rental count does not necessarily correspond with the total revenue generated from each rental';
\! echo 'This is because some genres have better sale prices than others and can generate more money per rental';
\! echo 'This query would be of interest to a marketer because it shows the total revenue as well as the number of sales and number of unique customers';
\! echo 'This allows a shop to stock up on movies based on whichever of these metrics meets their desires more';
\! echo 'They have the option of being more customer-oriented or focusing more on what generates the most revenue';
\! echo 'Furthermore, they can see the replacement cost to gauge how worth it would be to replace a stolen film';
