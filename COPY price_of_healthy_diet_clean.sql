COPY price_of_healthy_diet_clean
FROM 'C:\csv1\price_of_healthy_diet_clean.csv'
DELIMITER ','
CSV HEADER;
 
 select *
 from price_of_healthy_diet_clean
 limit 100;

 select *
 from price_of_healthy_diet_clean
 where cost_vegetables IS NOT NULL;

 SELECT ROUND(total_food_components, 2) AS total_food_components_2dp
FROM price_of_healthy_diet_clean
WHERE total_food_components IS NOT NULL;

 SELECT ROUND(annual_cost_healthy, 2) AS annual_cost_healthy_2dp
FROM price_of_healthy_diet_clean
where annual_cost_healthy IS NOT NULL;

select DISTINCT country_names, year, cost_healthy_diet, annual_cost_healthy, cost_category
FROM price_of_healthy_diet_clean
where year = 2024
ORDER BY year ASC
LIMIT 10;

select DISTINCT country_names, year, cost_healthy_diet, annual_cost_healthy, cost_category
FROM price_of_healthy_diet_clean
where year= 2020
ORDER BY annual_cost_healthy ASC
LIMIT 100;

SELECT country_names,
avg (annual_cost_healthy) As avg_annual_cost_healthy_8_yrs
from price_of_healthy_diet_clean
where year BETWEEN 2017 AND 2024
GROUP BY country_names, annual_cost_healthy
order by annual_cost_healthy DESC;

ALTER TABLE price_of_healthy_diet_clean
ADD COLUMN annual_cost_healthy_two_decimals DECIMAL(10,2);

SELECT DISTINCT region, year, cost_category, annual_cost_healthy
FROM price_of_healthy_diet_clean
where year = 2024
ORDER BY annual_cost_healthy DESC;
