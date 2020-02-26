-- IS 361 GABRIEL SANTOS 02/11/2020
-- 1. Show the total number of flights.
SELECT COUNT(*) 
FROM flights; 

-- 2. Show the total number of flights by airline (carrier).
SELECT flights.carrier, COUNT(*) 
FROM flights 
GROUP BY flights.carrier; 

-- 3. Show all of the airlines, ordered by number of flights in descending order.
SELECT flights.carrier, COUNT(*) AS FlightCount 
FROM flights 
GROUP BY flights.carrier 
ORDER BY FlightCount DESC; 

-- 4. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
SELECT flights.carrier, COUNT(*) AS FlightCount 
FROM flights 
GROUP BY flights.carrier 
ORDER BY FlightCount DESC LIMIT 5; 

-- 5. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order.
SELECT flights.carrier, COUNT(*) AS FlightCount 
FROM flights WHERE flights.distance >=1000 
GROUP BY flights.carrier 
ORDER BY FlightCount DESC LIMIT 5; 

-- 6. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question.
-- (show top 5 airlines, by number of flights in the month of July, ordered by flights number)
SELECT flights.carrier, COUNT(*) as FlightCount 
FROM flights 
WHERE MONTH = 7 
GROUP BY flights.carrier 
ORDER BY FlightCount DESC LIMIT 5;
