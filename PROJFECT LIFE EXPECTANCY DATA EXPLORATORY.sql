# world_life expectancy data explatory 
	
# looking for min and max of life expectancy by country
SELECT Country, MIN(`Life expectancy`), MAX(`Life expectancy`)
from world_life_expectancy
GROUP BY Country 
ORDER BY Country DESC
;

#increase in 15 obvs the ones with already high expectancy didnt get a much increase
SELECT Country, 
	MIN(`Life expectancy`),
 max(`Life expectancy`),
 ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`),1) AS LIFE_INCREASE_15_YEARS
 FROM world_life_expectancy
 GROUP BY Country
 HAVING MIN(`Life expectancy`) <> 0
 AND max(`Life expectancy`) <> 0
 ORDER BY LIFE_INCREASE_15_YEARS ASC
 ; 	
 
 #Life expectancy by year 
 SELECT year, ROUND(avg(`Life expectancy`),2)
 FROM world_life_expectancy
 where `Life expectancy` <> 0
 AND `Life expectancy` <> 0
 GROUP BY Year
 order by year 
 ;
 #AVG GDP with country and life expectancy 
 SELECT Country, 
 ROUND(AVG(`Life expectancy`),1) AS Life_expectancy, 
 ROUND(AVG(GDP),1) AS GDP
 FROM world_life_expectancy
 GROUP BY country
 HAVING Life_expectancy > 0 
 AND GDP > 0 
 ORDER BY GDP DESC
 ;
 
 SELECT *
 FROM world_life_expectancy 
 order by gdp;
 
 #Correlation between a high and low gdp
 SELECT 
 SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 end) High_GDP_Count,
 AVG(CASE WHEN GDP >= 1500 then `Life expectancy` ELSE NULL  END) High_GDP_expectancy,
 SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 end) Low_GDP_Count,
 AVG(CASE WHEN GDP <= 1500 then `Life expectancy` ELSE NULL  END) Low_GDP_expectancy	
FROM world_life_expectancy
;

#avg expectancy by developed and developing countries 
SELECT Status, 
COUNT(DISTINCT country), 
round(AVG(`Life expectancy`),1)  
FROM world_life_expectancy
GROUP BY Status
;


#BMI with country and life expecantcy 
 SELECT Country, 
 ROUND(AVG(`Life expectancy`),1) AS Life_expectancy, 
 ROUND(AVG(BMI),1) AS BMI
 FROM world_life_expectancy
 GROUP BY country
 HAVING Life_expectancy > 0 
 AND BMI > 0 
 ORDER BY BMI ASC
 ;

#adding up each year the adutl mortality 
SELECT country,
 year,
 `Life expectancy`,
  `Adult Mortality`,
  SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY year ) AS total
 FROM world_life_expectancy
 WHERE country like '%united%'	

