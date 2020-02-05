-- IS 361 GABRIEL SANTOS 02/05/2020
-- 1. Write a SELECT statement that returns all of the rows and columns in the planes table
SELECT *
FROM flights.planes;

-- 2. Using the weather table, concatenate the year, month, and day columns to display a date in the form "3/17/2013"
SELECT concat(month,'/',day,'/',year) as date 
FROM flights.weather;

-- 3. Order by planes table by number of seats, in descending order.
SELECT *
FROM flights.planes
ORDER BY seats DESC;

-- 4. List only those planes that have an engine that is 'Reciprocating'
SELECT *
FROM flights.planes
WHERE engine = 'Reciprocating';

-- 5. List only the first 5 rows in the flights table
SELECT *
FROM flights.flights
LIMIT 5;

-- 6. What was the longest (non-blank) air time?
SELECT MAX(air_time)
FROM flights.flights;

-- 7. What was the shortest (non-blank) air time for Delta?
SELECT MIN(air_time)
FROM flights.flights f
JOIN flights.airlines a
ON (f.carrier = a.carrier)
WHERE a.name = 'Delta Air Lines Inc.';


-- 8. Show all of the Alaska Airlines flights between June 1st, 2013 and June 3rd, 2013.
-- Is the way the data is stored in the database helpful to you in making your query?

SELECT *
FROM flights.flights f
JOIN flights.airlines a
ON (f.carrier = a.carrier)
WHERE a.name = 'Alaska Airlines Inc.' 
AND month = 6 
AND day >=1 
AND day <= 4 
AND year= 2013;
-- The way the dates are stored is not helpfull. using datatypes fields would increase the performance, the quality and speed of the queries.

-- 9.  Show all of the airlines whose names contain 'America'

SELECT a.name
FROM flights.airlines a
WHERE a.name LIKE '%America%';

-- 10. How many flights went to Miami?

SELECT COUNT(*)
FROM flights.flights a
JOIN flights.airports b
ON a.dest=b.faa
WHERE b.name LIKE '%Miami%';


-- 11. Were there more flights to Miami in January 2013 or July 2013?  (Multiple queries are OK)

SELECT COUNT(*)
FROM flights.flights
WHERE dest = 'MIA' 
AND month = 1 
AND year = 2013;

SELECT COUNT(*)
FROM flights.flights
WHERE dest = 'MIA' 
AND month = 7 
AND year = 2013;

-- 12. what is the average altitude of airports?

SELECT AVG(alt)
FROM flights.airports;