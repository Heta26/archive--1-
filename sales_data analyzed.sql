
SELECT *
FROM sales_data
where category = 'Electronics' AND region = 'East' AND quantity > 5;

--Changing data type for date from timestamp to date 
ALTER TABLE sales_data
ALTER COLUMN order_date TYPE DATE
USING order_date::date;

SELECT *
from sales_data
where order_date BETWEEN '2024-01-01' AND '2024-12-31';

--To identify the different categories
SELECT DISTINCT category
from sales_data;

--To identify different product names
SELECT DISTINCT product_name
FROM sales_data;

-- checking for missing values
SELECT count (*)
FROM sales_data
WHERE sales IS NULL;

-- checking duplicates
SELECT count (*)
FROM sales_data
GROUP BY product_name
HAVING count (*) > 1;  ---- duplicates available because they share the same product name

-- Average sales of accessories in North region 
SELECT AVG(sales)
from sales_data
where region = 'North' AND category = 'Accessories'
Group by category;

--Average sales and Avg profit of Accessories, Office, Electronics in All regions 
SELECT region, category, category, AVG(sales) as avg_sales, AVG(profit) as avg_profit
from sales_data
where region in ('East', 'West', 'South', 'North') AND category in ('Accessories', 'Office', 'Electronics')
Group by region, category
order by region, category;

--Total profit made in year 2024
select sum(profit) as total_profit
from sales_data
where order_date BETWEEN '2024-01-01' AND '2024-12-31'
order by total_profit Desc;

--Total profit of products in 2024 
select product_name, sum(profit) as total_profit
from sales_data
where order_date BETWEEN '2024-01-01' AND '2024-12-31' AND product_name in ('Keyboard', 'Smartphone', 'Tablet', 'Monitor', 'Printer', 'Headphones', 'Camera', 'Mouse', 'Laptop', 'Smartwatch')
GROUP BY product_name
order by total_profit DESC; --Monitor had the highest profit in 2024

--Overall profit on all products throughout
select product_name, sum(profit) as total_profit
from sales_data
where product_name in ('Keyboard', 'Smartphone', 'Tablet', 'Monitor', 'Printer', 'Headphones', 'Camera', 'Mouse', 'Laptop', 'Smartwatch')
GROUP BY product_name
order by total_profit DESC;---Camera sales made the highest profit while Tablet made the lowest

--calculating unit price of all products using total sales / total quantity
select product_name, sum(profit) as total_profit, sum(sales) / sum(quantity) AS unit_price
from sales_data
where product_name in ('Keyboard', 'Smartphone', 'Tablet', 'Monitor', 'Printer', 'Headphones', 'Camera', 'Mouse', 'Laptop', 'Smartwatch')
GROUP BY product_name
order by total_profit DESC;

