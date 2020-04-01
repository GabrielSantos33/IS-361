# IS 361 GABRIEL SANTOS 04/01/2020
# Your task is to create a Pivot table in LibreOffice that shows rates of tuberculosis infection by country.
# 1. Use the tb database that you restored last week. Also, the attached population.csv has populations by country for the years where tuberculosis (tb) cases have been reported.
# 2. Load the population.csv file into a newly created table called "population".
# 3. Join the tables (in SQL) and output the following columns:Country, Year, Rate.   Rate is defined as Cases/Population.  [HINT: You’ll need to sum the cases across gender and age groups.  Ensure you handle NULL (missing values) as you are adding up cases.   In MySQL, 1 + 0 = 0, whereas 1 + null = null.
# To handle NULL values, research (books or internet) how to handle NULLs so that additions are apporiately handled by converting NULLs to zeros.
# 4. Create a CSV file, and load it as a Pivot Table in LibreOffice.

# First create a table called tb
DROP TABLE IF EXISTS tb;
CREATE TABLE tb 
(
  country varchar(100) NOT NULL,
  year int NOT NULL,
  sex varchar(6) NOT NULL,
  child int NULL,
  adult int NULL,
  elderly int NULL
);

# load tb.csv into the table tb
LOAD DATA INFILE 'D:\Users\drake\Documents\CUNY SPS\IS 361- Database Architecture and Programming\Week 9\tb.csv' 
INTO TABLE tb
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(country, year, sex, @child, @adult, @elderly)
SET
child = nullif(@child,-1),
adult = nullif(@adult,-1),
elderly = nullif(@elderly,-1);
# Or use the table data import wizard method

# Create table population using the data import wizard method with the population.csv file from week 8.

# Create a table called tb_cases by adding the child, adult and eldery colummns creating a new collumn called cases.
DROP TABLE IF EXISTS tb_cases;
CREATE TABLE tb_cases AS SELECT country, year, sex, child+adult+elderly AS cases
FROM tb;

# Create a table called total_cases with country, year and total cases to sum the cases across gender and age groups. 
# Ensuring to handle NULL (missing values). 
DROP TABLE IF EXISTS total_cases;
CREATE TABLE total_cases AS SELECT country,year, sum(cases) AS total_cases 
FROM tb_cases
GROUP BY year,country;

# Create select query with the tables population and total_case Joining the tables and creating the following columns: Country, Year, Rate. 
# Rate is defined as total_cases/Population from the table population and total_cases.
SELECT
a.country AS Country,
a.year AS Year,
a.total_cases/b.population AS Rate
FROM total_cases a
INNER JOIN population b ON b.country = a.country and b.year = a.year
ORDER BY country, year;

# Create a CSV file called aggregations_pivot, and load it as a Pivot Table in LibreOffice.