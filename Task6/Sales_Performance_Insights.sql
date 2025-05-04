Show databases;
/*
Sales Performance Insights
*/
-- 1) Total Sales Revenue
SELECT SUM(SALES) AS total_revenue
FROM sales_data;

-- 2) Monthly Revenue Trend
SELECT YEAR_ID, MONTH_ID, SUM(SALES) AS monthly_revenue
FROM sales_data
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;


-- 3) Top 5 Best-Selling Products (by revenue)
SELECT PRODUCTCODE, SUM(SALES) AS total_revenue
FROM sales_data
GROUP BY PRODUCTCODE
ORDER BY total_revenue DESC
LIMIT 5;

-- 4)Top 5 Best-Selling Product Lines
SELECT PRODUCTLINE, SUM(SALES) AS revenue
FROM sales_data
GROUP BY PRODUCTLINE
ORDER BY revenue DESC
LIMIT 5;

-- 5) Total Orders Per Year
SELECT YEAR_ID, COUNT(DISTINCT ORDERNUMBER) AS order_count
FROM sales_data
GROUP BY YEAR_ID
ORDER BY YEAR_ID;

-- 6) Top 5 Customers by Revenue
SELECT CUSTOMERNAME, SUM(SALES) AS total_spent
FROM sales_data
GROUP BY CUSTOMERNAME
ORDER BY total_spent DESC
LIMIT 5;

-- 7)Top Countries by Revenue
SELECT COUNTRY, SUM(SALES) AS country_revenue
FROM sales_data
GROUP BY COUNTRY
ORDER BY country_revenue DESC
LIMIT 10;

-- 8)Average Monthly Sales
SELECT MONTH_ID, AVG(SALES) AS avg_monthly_sales
FROM sales_data
GROUP BY MONTH_ID
ORDER BY MONTH_ID;

-- 9) Compare Revenue of Each Product Line Between Years
SELECT PRODUCTLINE, YEAR_ID, SUM(SALES) AS total_sales
FROM sales_data
GROUP BY PRODUCTLINE, YEAR_ID
ORDER BY PRODUCTLINE, YEAR_ID;

-- 10) Find the Customers Who Placed Orders in All 3 Years
SELECT CUSTOMERNAME
FROM sales_data
GROUP BY CUSTOMERNAME
HAVING COUNT(DISTINCT YEAR_ID) = 3;


