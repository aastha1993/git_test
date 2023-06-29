CREATE TABLE customer_reviews (
  review_id SERIAL PRIMARY KEY,
  customer_id INT,
  review_text TEXT
);

INSERT INTO customer_reviews (customer_id, review_text)
VALUES (1, 'This film was fantastic! I highly recommend it.');


Select concat(first_name,' ',last_name) as full_name
From actor
Where first_name='Tom';

select*from actor;

Select*from payment
where staff_id <> 1
order by amount ASC;

select count(distinct staff_id)
from payment;

select distinct staff_id
from payment;



Select*from payment 
where (amount>5) and (payment_date>'2007-03-17')
and (payment_date<'2007-03-18');



select*from actor
where first_name In('Tom', 'Jack', 'Nick','Jill');

Select*from language
where not name ='English';

Select*from language
where name not like 'E%';

Select*from language
where name not in ('English');

select*from film
where title like 'Ad%';

Select*from film
where description like '%Moose%Cat%';

Select*from film
where description like '%Cat%' AND description LIKE '%Moose%';

Select*from actor
where length (last_name)>
all(select length(first_name) from actor);

select length(first_name) from actor;

Select*from film
where description like '%Cat%' or description LIKE '%Moose%';


--the following uses the ALL clause to find all customers who have no outstanding DVD's
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id <> ALL (
    SELECT customer_id
    FROM rental
    WHERE return_date IS NULL
);


--the following uses the ALL clause to find all customers who have no outstanding DVD's
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id <> any (
    SELECT customer_id
    FROM rental
    WHERE return_date IS NULL
);

SELECT customer_id, first_name, last_name

FROM customer c
WHERE EXISTS (
    SELECT 1
    FROM rental r
    WHERE r.customer_id = c.customer_id
    AND r.return_date IS NULL
)
limit 20;

select distinct return_date
from rental;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_count DESC;
