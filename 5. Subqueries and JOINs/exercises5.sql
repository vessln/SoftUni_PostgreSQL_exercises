1. Booked for Nights:

SELECT
	CONCAT(a.address, ' ', a.address_2) AS "apartment_address",
	b.booked_for AS nights
FROM apartments AS a
INNER JOIN bookings AS b
	ON a.booking_id = b.booking_id
ORDER BY a.apartment_id ASC;


2. First 10 Apartments Booked At:

SELECT
	a."name",
	a.country,
	b."booked_at"::DATE
FROM apartments AS a
LEFT JOIN bookings AS b
	ON a.booking_id = b.booking_id
LIMIT 10;

# or

SELECT
	a."name",
	a.country,
	b."booked_at"::DATE
FROM apartments AS a
LEFT JOIN bookings AS b
	USING(booking_id)
LIMIT 10;


3. First 10 Customers with Bookings:

SELECT
	b.booking_id,
	b.starts_at::DATE,
	b.apartment_id,
	CONCAT(c.first_name, ' ', c.last_name) AS "customer_name"
FROM bookings AS b
RIGHT JOIN customers AS c
	ON b.customer_id = c.customer_id
ORDER BY "customer_name" ASC
LIMIT 10;


4. Booking Information

SELECT
	b.booking_id,
	a.name AS "apartment_owner",
	a.apartment_id,
	CONCAT(c.first_name, ' ', c.last_name) AS "customer_name"
FROM apartments AS a
FULL JOIN bookings AS b
	ON a.booking_id = b.booking_id
		FULL JOIN customers AS c
				ON b.customer_id = c.customer_id
ORDER BY booking_id,
		apartment_owner,
		customer_name;


5. Multiplication of Information**:

SELECT
	b.booking_id,
	c.first_name
FROM bookings AS b
CROSS JOIN customers AS c
ORDER BY first_name ASC;


6. Unassigned Apartments:

SELECT
	b.booking_id,
	b.apartment_id,
	c.companion_full_name
FROM bookings AS b
JOIN customers AS c
	USING(customer_id)
WHERE b.apartment_id IS NULL;


7. Bookings Made by Lead:

SELECT
	b.apartment_id,
	b.booked_for,
	c.first_name,
	c.country
FROM bookings AS b
INNER JOIN customers AS c
	ON b.customer_id = c.customer_id
WHERE job_type LIKE 'Lead';


8. Hahn`s Bookings:

SELECT
	COUNT(*)
FROM
	customers
WHERE last_name LIKE 'Hahn';


9. Total Sum of Nights:

SELECT
	a.name,
	SUM(booked_for)
FROM
	apartments AS a
JOIN bookings AS b
	ON a.apartment_id = b.apartment_id
GROUP BY a.name
ORDER BY a.name ASC;


10. Popular Vacation Destination:

SELECT
	a.country,
	COUNT(*) AS "booking_count"
FROM
	 apartments AS a
JOIN bookings AS b
	ON a.apartment_id = b.apartment_id
WHERE b.booked_at >'2021-05-18 07:52:09.904+03'
	AND b.booked_at < '2021-09-17 19:48:02.147+03'
GROUP BY a.country
ORDER BY "booking_count" DESC;


11. Bulgaria's Peaks Higher than 2835 Meters:

SELECT
	mc.country_code,
	m.mountain_range,
	p.peak_name,
	p.elevation
FROM mountains_countries AS mc
	JOIN mountains AS m
		ON mc.mountain_id = m.id
			JOIN peaks AS p
				ON m.id = p.mountain_id
WHERE elevation > 2835 AND country_code LIKE 'BG'
ORDER BY elevation DESC;


12. Count Mountain Ranges:



13. Rivers in Africa:



14. Minimum Average Area Across Continents:



15. Countries Without Any Mountains:



16. Monasteries by Country✶:



17. Monasteries by Continents and Countries✶:



18. Retrieving Information about Indexes:



19. Continents and Currencies✶:



20. The Highest Peak in Each Country✶: