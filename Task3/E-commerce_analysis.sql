show databases;
create database E_Commerece;
use E_Commerece;
-- 1. Show all high-priority orders made using mobile devices.
SELECT * 
FROM ecommerce_data
WHERE Order_Priority = 'High' 
  AND Device_Type = 'Mobile';

-- 2 Find the total sales and average profit for each product category.
SELECT 
    Product_Category, 
    SUM(Sales) AS Total_Sales, 
    AVG(Profit) AS Average_Profit
FROM ecommerce_data
GROUP BY Product_Category
ORDER BY Total_Sales DESC;

-- 3 List top 5 customers by total spending.
SELECT 
    Customer_id, 
    SUM(Sales) AS Total_Spent
FROM ecommerce_data
GROUP BY Customer_id
ORDER BY Total_Spent DESC
LIMIT 5;

-- 4. Join customer details with order data to show gender and login type for each order.
SELECT 
    e.Order_Date, e.Product, e.Sales, 
    c.Gender, c.Customer_Login_Type
FROM ecommerce_data e
INNER JOIN customers c ON e.Customer_id = c.Customer_id;


-- 5. Find all orders where the product was delivered more than the average delivery time.
SELECT * 
FROM ecommerce_data
WHERE Aging > (
    SELECT AVG(Aging) 
    FROM ecommerce_data
);

-- 6. Create a view to summarize monthly sales and profit.
CREATE VIEW Monthly_Sales_Report AS
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Order_Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_data
GROUP BY Order_Month;

-- 7. Create an index to speed up queries filtering by Customer_id.
CREATE INDEX idx_customer_id 
ON ecommerce_data (Customer_id);

-- 8. Compare average shipping cost between mobile and web orders.
SELECT 
    Device_Type, 
    AVG(Shipping_cost) AS Avg_Shipping_Cost
FROM ecommerce_data
GROUP BY Device_Type;

-- 9. Get all orders from customers who have ordered more than 3 times.
SELECT * 
FROM ecommerce_data
WHERE Customer_id IN (
    SELECT Customer_id
    FROM ecommerce_data
    GROUP BY Customer_id
    HAVING COUNT(*) > 3
);

-- 10. Total Orders and Sales by Gender
SELECT 
    Gender, 
    COUNT(*) AS Total_Orders, 
    SUM(Sales) AS Total_Sales
FROM ecommerce_data
GROUP BY Gender;

