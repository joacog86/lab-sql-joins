USE sakila;

/*Write SQL queries to perform the following tasks using the Sakila database:

1. List the number of films per category.
2. Retrieve the store ID, city, and country for each store.
3. Calculate the total revenue generated by each store in dollars.
4. Determine the average running time of films for each category.
*/

/*
1. List the number of films per category.*/

SELECT fc.category_id, c.name, count(f.film_id) cantidad FROM film_category fc
LEFT JOIN category c on fc.category_id = c.category_id
LEFT JOIN film f on fc.film_id = f.film_id
GROUP BY 1,2;


/*
2. Retrieve the store ID, city, and country for each store.*/

SELECT s.store_id, c.city, co.country FROM store s
LEFT JOIN address a on s.address_id = a.address_id
LEFT JOIN city c on a.city_id = c.city_id
LEFT JOIN country co on c.country_id = co.country_id;


/*
3. Calculate the total revenue generated by each store in dollars.*/

SELECT s.store_id, sum(p.amount) revenue FROM staff s
LEFT JOIN payment p on s.staff_id = p.staff_id
GROUP BY 1 ;



/*
4. Determine the average running time of films for each category.*/

SELECT fc.category_id, c.name, count(f.film_id) cantidad , floor(avg(f.length)) avg_duracion FROM film_category fc
LEFT JOIN category c on fc.category_id = c.category_id
LEFT JOIN film f on fc.film_id = f.film_id
GROUP BY 1,2;






