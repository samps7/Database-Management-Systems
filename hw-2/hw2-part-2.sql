
/**********************************************************************
 * NAME: Samuel Sovi
 * CLASS: CPSC 321 Section 1
 * DATE: 10/11/22
 * HOMEWORK: hw2
 * DESCRIPTION: Implementing Tables and Schemas to practice creating 
 * relationships between tables using foreign keys and using JOINs
 *
 * ADDITIONAL NOTE:
 *      Useful commands
 *      1) mysql -p -h cps-database
 *      2) use ssovi_DB;
 *      3) show tables;
 *      4) exit
 **********************************************************************/


-- Tables:
\! echo 'Country:';
SELECT *
FROM country;

\! echo 'Province:';
SELECT *
FROM province;

\! echo 'City:';
SELECT *
FROM city;

\! echo 'Border:';
SELECT *
FROM border;

-- TODO: Implement the queries in part 2 below. For each be sure to
--       copy each of the problem statements. 



-- Quesiton 1:
\! echo 'Question 1:';
SELECT *
FROM country
WHERE inflation < 3 and gdp > 40000;

-- Question 2:
\! echo 'Question 2:';
SELECT c.country_code, c.country_name, c.inflation, p.province_name, p.area
FROM country c, province p
WHERE c.country_code = p.country_code AND p.area < 10000
ORDER BY c.inflation DESC, c.country_code ASC, p.area ASC;



-- Question 3:
\! echo 'Question 3:';
SELECT c.country_code, c.country_name, c.inflation, p.province_name, p.area
FROM country c JOIN province p ON (c.country_code = p.country_code)
WHERE p.area < 10000
ORDER BY c.inflation DESC, c.country_code ASC, p.area ASC;

-- Question 4:
\! echo 'Question 4:';
SELECT DISTINCT p.province_name
FROM country c, province p, city c1
WHERE c.country_code = p.country_code AND p.province_name = c1.province_name AND c1.population > 30000;

-- Question 5:
\! echo 'Question 5:';
SELECT DISTINCT p.province_name
FROM country c JOIN province p ON (c.country_code = p.country_code) JOIN city c1 ON (p.province_name = c1.province_name)
WHERE c1.population > 30000;

-- Question 6:
\! echo 'Question 6:';
SELECT p.province_name
FROM country c, province p, city c1, city c2
WHERE c.country_code = p.country_code AND p.province_name = c1.province_name AND c1.province_name = c2.province_name 
    AND c1.city_name > c2.city_name AND c1.population > 10000 AND c2.population > 10000;

-- Question 7:
\! echo 'Question 7:';
SELECT p.province_name
FROM country c JOIN province p ON (c.country_code = p.country_code) JOIN city c1 ON (p.province_name = c1.province_name) JOIN city c2 ON (c1.province_name = c2.province_name)
WHERE c1.city_name > c2.city_name AND c1.population > 10000 AND c2.population > 10000;

-- Question 8:
\! echo 'Question 8:';
SELECT c1.city_name, c1.province_name, c1.country_code, c2.city_name, c2.province_name, c2.country_code, c1.population
FROM city c1 JOIN city c2 ON (c1.population = c2.population)
WHERE c1.city_name > c2.city_name OR (c1.province_name > c2.province_name AND c1.city_name = c2.city_name);

-- Question 9:
\! echo 'Question 9:'; 
SELECT c1.country_name, c1.country_code
FROM country c1, country c2, border b
WHERE c1.gdp > 50000 AND c1.inflation < 3 AND c2.gdp < 30000 AND c2. inflation > 4 AND ((c1.country_code = b.country_code_1 
    AND c2.country_code = b.country_code_2) OR (c2.country_code = b.country_code_1 AND c1.country_code = b.country_code_2));



-- Question 10:
\! echo 'Question 10:'; 
SELECT c1.country_name, c1.country_code, c2.country_code
FROM country c1 CROSS JOIN country c2 JOIN border b ON ((c1.country_code = b.country_code_1 
    AND c2.country_code = b.country_code_2) OR (c1.country_code = b.country_code_2 AND c2.country_code = b.country_code_1))
WHERE (c1.gdp > 50000 AND c1.inflation < 3 AND c2.gdp < 30000 AND c2. inflation > 4);
