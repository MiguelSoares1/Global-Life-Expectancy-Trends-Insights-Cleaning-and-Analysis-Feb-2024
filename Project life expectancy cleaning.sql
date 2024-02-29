# World life Expectancy project ( Data cleaning)
	
# Looking for duplicates    
SELECT Country, Year, COUNT(CONCAT(Country,year))
FROM world_life_expectancy
GROUP BY Country, year, concat(CONCAT(Country,year))
HAVING COUNT(CONCAT(Country,year)) > 1;


#Identifying the row id with duplicates
SELECT *
FROM (
	SELECT Row_ID, 
	CONCAT(country, year),
	ROW_NUMBER() 
	OVER(PARTITION BY CONCAT(country, year) order by CONCAT(country, year))
	AS Row_num
	FROM world_life_expectancy 
) AS Row_table
WHERE Row_Num > 1
;

#deleting the duplicates
DELETE FROM world_life_expectancy
WHERE Row_ID IN (
	SELECT Row_ID
FROM (
	SELECT Row_ID, 
	CONCAT(country, year),
	ROW_NUMBER() 
	OVER(PARTITION BY CONCAT(country, year) order by CONCAT(country, year))
	AS Row_num
	FROM world_life_expectancy 
) AS Row_table
WHERE Row_Num > 1
)
;

#blank values from status
SELECT * FROM world_life_expectancy
WHERE status = '';

#cheking what kinda of status we have
SELECT DISTINCT(Status)
FROM world_life_expectancy
WHERE status <> ''
;
#looking for all countries that are Developing
SELECT DISTINCT(country)
FROM world_life_expectancy
WHERE Status = 'Developing';

#updating the values that are blank for developing
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2 
	ON t1.country = t2.country
SET t1.STATUS = 'Developing'
WHERE	t1.status = ''
AND t2.status <> ''
and t2.status = 'developing' ;

#updating blank values for developed countries
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2 
	ON t1.country = t2.country
SET t1.STATUS = 'Developed'
WHERE	t1.status = ''
AND t2.status <> ''
and t2.status = 'Developed' ;


SELECT * FROM world_life_expectancy;

#looking for blank values in life expectancy
SELECT * FROM world_life_expectancy
WHERE `Life expectancy` = '';


#using this so we can fill the blank values
SELECT t1.country, t1.year,  t1.`Life expectancy`,
t2.country, t2.year,  t2.`Life expectancy`,
t3.country, t3.year,  t3.`Life expectancy`,
round((t2.`Life expectancy` + t3.`Life expectancy`) / 2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.year = t2.year - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.year = t3.year + 1
WHERE t1.`Life expectancy` = ''
;
#updating the blank values
UPDATE  world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.year = t2.year - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.year = t3.year + 1
SET t1.`Life expectancy` = round((t2.`Life expectancy` + t3.`Life expectancy`) / 2,1)
WHERE t1.`Life expectancy` = ''
;
    