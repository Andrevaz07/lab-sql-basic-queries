USE sakila ;

#1 Display all available tables in the Sakila database.
 SHOW TABLES ;
 
 #2 Retrieve all the data from the tables actor, film and customer.
 
 SELECT * FROM actor ;
 SELECT * FROM film ;
 SELECT * FROM customer ;
 
 #Retrieve the following columns from their respective tables:

#3.1 Titles of all films from the film table

SELECT title FROM film ;

#3.2 List of languages used in films, with the column aliased as language from the language table

SELECT language_id AS language FROM film ;

#3.3 List of first names of all employees from the staff table

SELECT first_name FROM staff ;

#4 Retrieve unique release years.

SELECT DISTINCT release_year FROM film;

#5 Counting records for database insights:
	#5.1 Determine the number of stores that the company has.
SELECT COUNT(*) FROM store;
	#5.2 Determine the number of employees that the company has.
SELECT COUNT(*) FROM staff;
	#5.3 Determine how many films are available for rent and how many have been rented.
SELECT 
SUM(CASE WHEN r.return_date IS NULL THEN 1 ELSE 0 END) AS films_rented,
COUNT(DISTINCT i.inventory_id) - SUM(CASE WHEN r.return_date IS NULL THEN 1 ELSE 0 END) AS film_available
FROM film f 
JOIN inventory i 
	ON f.film_id = i.film_id
LEFT JOIN rental r
	ON i.inventory_id = r.inventory_id;
 ; 
	#5.4 Determine the number of distinct last names of the actors in the database.
SELECT DISTINCT last_name FROM actor;
#6 Retrieve the 10 longest films.
SELECT length FROM film
ORDER BY length DESC
LIMIT 10; 
#7 Use filtering techniques in order to:
	#7.1 Retrieve all actors with the first name "SCARLETT".
SELECT first_name FROM actor 
WHERE first_name LIKE '%SCARLETT%'  ;
