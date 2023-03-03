
/**********************************************************************
 * NAME: Samuel Sovi
 * CLASS:CPSC 321
 * DATE: 12/9/22
 * HOMEWORK: HW 8
 * DESCRIPTION: PRACTING MORE COMPLICATED QUERIES
 **********************************************************************/


-- TODO: Implement the queries for HW8 below. Include comments as
--       appropriate.


-- Quesiton 1: 

CREATE VIEW customer_rental as
    SELECT customer_id, first_name, last_name, rental_date, film_id, title
    FROM cpsc321.customer JOIN cpsc321.rental USING (customer_id) JOIN cpsc321.inventory USING(inventory_id) JOIN cpsc321.film USING (film_id)
    ORDER BY last_name ASC, first_name ASC, rental_date ASC;

-- Testing:
-- SELECT *
-- FROM customer_rental
-- LIMIT 10;

-- Question 2:

WITH film_update AS(
    (SELECT film_id, last_update, 'actor' as type FROM film_actor)
    UNION
    (SELECT film_id, last_update, 'category' as type FROM film_category)
    UNION
    (SELECT film_id, last_update, 'inventory' as type FROM inventory)
)
SELECT film_id, title, fu.last_update, type
FROM film_update fu JOIN film f USING(film_id) JOIN film_category USING(film_id) JOIN category c USING(category_id)
WHERE c.name = 'Action'
ORDER BY title ASC, fu.last_update ASC;




-- Question 3:

SELECT film_id, title, rating, length, 
    CASE
        WHEN length > 80 THEN 'feature'
        WHEN length > 50 THEN 'featurette'
        ELSE 'short'
    END AS type
FROM film;

-- Question 4:

SELECT film_id, title, rating, length, 
    DENSE_RANK() OVER (PARTITION BY RATING ORDER BY length ASC) rank
FROM film;


-- Question 5:

SELECT film_id, title, rating, length
FROM (SELECT film_id, title, rating, length, DENSE_RANK() OVER (PARTITION BY RATING ORDER BY length ASC) AS rank
        FROM film) AS ranking
WHERE rank <= 5;


