
/**********************************************************************
 * NAME: Samuel Sovi
 * CLASS: CPSC 321 Section 1
 * DATE: 12/5/22
 * HOMEWORK: HW-7
 * DESCRIPTION: SQL queries with subqueries now
 **********************************************************************/


-- TODO: Implement the queries for HW7 below. Include comments as
--       appropriate.


-- Quesiton 1: 

\! echo 'Question 1:';

SELECT f1.film_id, f1.title, f1.length
FROM film f1
WHERE f1.length = (SELECT MAX(f2.length) FROM film f2);

-- Question 2:

\! echo 'Question 2:';

SELECT f1.film_id, f1.title, f1.length
FROM film f1
WHERE f1.length = (SELECT MAX(f2.length) FROM film f2 WHERE f2.rating = 'G') AND f1.rating = 'G';

-- Question 3:

\! echo 'Question 3:';

SELECT a1.first_name, a1.last_name
FROM actor a1
WHERE NOT EXISTS (SELECT * FROM film_actor JOIN film USING (film_id) WHERE actor_id = a1.actor_id AND rating = 'R');

-- Question 4:

\! echo 'Question 4:';

SELECT c.name, COUNT(*)
FROM category c JOIN film_category fc USING(category_id) JOIN film f USING (film_id)
WHERE f.rating = 'G'
GROUP BY c.category_id
HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM category c2 JOIN film_category fc2 USING(category_id) JOIN film f2 USING (film_id) WHERE f2.rating = 'G' GROUP BY c2.category_id);

-- Question 5:

\! echo 'Question 5:';

SELECT f1.title, COUNT(*)
FROM film f1 JOIN inventory i USING(film_id) JOIN rental r1 USING(inventory_id)
WHERE f1.rating = 'PG'
GROUP BY f1.film_id
HAVING COUNT(*) > (SELECT AVG(count) FROM (SELECT f2.title, COUNT(*) count
    FROM film f2 JOIN inventory i2 USING(film_id) JOIN rental r2 USING(inventory_id)
    WHERE f2.rating = 'PG'
    GROUP BY f2.film_id) AS t1)
ORDER BY COUNT(*) DESC;



-- Question 6:

\! echo 'Question 6:';

SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) / 
    (SELECT COUNT(*) FROM film f2 JOIN film_actor fa2 USING(film_id) JOIN actor a2 USING(actor_id) WHERE a2.actor_id = a.actor_id GROUP BY a2.actor_id HAVING COUNT(*) > 0) pct
FROM film f JOIN film_actor fa USING(film_id) JOIN actor a USING(actor_id)
WHERE f.rating = 'PG'
GROUP BY a.actor_id
HAVING COUNT(*) > 0
ORDER BY pct DESC;

-- Question 7:

\! echo 'Question 7:';

SELECT f.title
FROM film f
WHERE NOT EXISTS (SELECT* FROM store s1 WHERE NOT EXISTS (SELECT* FROM store s2 JOIN inventory i2 USING (store_id) WHERE s2.store_id = s1.store_id AND i2.film_id = f.film_id));


-- Question 8:

\! echo 'Question 8:';
\! echo '';
\! echo 'Purpose:';
\! echo 'Find the customer(s) who made the most rentals';
\! echo '';

SELECT c.first_name, c.last_name, COUNT(*)
FROM customer c JOIN rental r USING (customer_id)
GROUP BY c.customer_id
HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM customer c2 JOIN rental r2 USING(customer_id) GROUP BY c2.customer_id);

\! echo '';
\! echo 'Why this is interesting:';
\! echo 'Store may have a promotion that gives some sort of bonus to whatever customer has the most rentals';
\! echo 'This could be for some loyalty program or something';
\! echo 'This query would help them find just those people to automate the reward giving';
\! echo 'The problem with using ORDER BY and then LIMI(1) is that it does not account for ties';
\! echo 'This would be unfair for customers and they would stop being loyal :(';




