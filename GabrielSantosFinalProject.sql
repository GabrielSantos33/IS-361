
SELECT flights.origin, flights.tailnum, p.manufacturer, concat(flights.year,'/', flights.month,'/', flights.day) as FlightDate, 
flights.arr_delay, flights.flight
FROM flights.flights 
INNER JOIN planes p on p.tailnum = flights.tailnum;

SELECT  avg(arr_delay)
FROM flights.flights 
INNER JOIN planes p on p.tailnum = flights.tailnum;

SELECT  count(flights.flight)
FROM flights.flights 
INNER JOIN planes p on p.tailnum = flights.tailnum;


