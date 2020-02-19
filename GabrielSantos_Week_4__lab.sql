-- IS 361 GABRIEL SANTOS 02/19/2020
-- 1.Write a script to select all data from the planes table.
SELECT * 
FROM flights.planes;

-- 2. Update the planes table so that rows that have no year will be assigned the year 2013. (missing values will display as NULL).
UPDATE flights.planes SET year='2013' 
WHERE year is NULL;

-- 3. Insert a new record to the planes table with the following values:
-- Tailnum: N15501
-- Year: 2013
-- type: Fixed wing  single engine
-- Manufacturer: BOEING
-- Model: A222-101
-- Engines: 3
-- Seats: 100
-- Speed:  NULL  (notice this is not a text value but truly the absence of any value: "empty".  As such, don't use single or double quotes around NULL when inserting this value).
-- Engine: Turbo-fan
INSERT INTO planes(Tailnum, Year, type, manufacturer, Model, Engines, Seats, Speed, Engine)
values('N15501',2013,'Fixed wing  single engine','BOEING','A222-101',3,100,NULL,'Turbo-fan');

-- 4. Delete the newly inserted record on step.
DELETE  FROM Planes 
WHERE Tailnum in(SELECT max(Tailnum) from planes);
-- Or you can use the select statement to find the record, then delete the records to be sure and specific on what are you deleting.
-- Using primary key with auto increment it will delete the last record using this sql query (SELECT max(Tailnum) from planes;)



