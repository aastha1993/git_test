SELECT fa.film_id, a.first_name, a.last_name
FROM film_actor fa
JOIN actor a ON fa.actor_id = a.actor_id
WHERE fa.film_id = 25;


