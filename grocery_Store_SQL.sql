-- Show the total number of orders
SELECT COUNT(DISTINCT Order ID) AS TotalOrders
FROM SuperstoreSales;

-- Calculate the total sales amount:
SELECT SUM(Sales) AS TotalSales
FROM SuperstoreSales;

-- Find the top N products by sales
SELECT Product Name, SUM(Sales) AS TotalSales
FROM SuperstoreSales
GROUP BY Product Name
ORDER BY TotalSales DESC
LIMIT N;

-- Determine the total sales for each category
SELECT Category, SUM(Sales) AS TotalSales
FROM SuperstoreSales
GROUP BY Category;

--- Calculate the average sales per order
SELECT AVG(Sales) AS AvgSalesPerOrder
FROM SuperstoreSales;

-- Identify the customers with the highest total sales
SELECT Customer ID, Customer Name, SUM(Sales) AS TotalSales
FROM SuperstoreSales
GROUP BY Customer ID, Customer Name
ORDER BY TotalSales DESC
LIMIT N;

-- Show the sales trend over time:
SELECT DATE(Order Date) AS OrderDate, SUM(Sales) AS TotalSales
FROM SuperstoreSales
GROUP BY DATE(Order Date)
ORDER BY DATE(Order Date);

-- Determine the most popular shipping mode:
SELECT Ship Mode, COUNT(*) AS NumOrders
FROM SuperstoreSales
GROUP BY Ship Mode
ORDER BY NumOrders DESC
LIMIT 1;

-- Find the orders that had negative profit:
SELECT Order ID, Sales, Profit
FROM SuperstoreSales
WHERE Profit < 0;

-- Calculate the total sales for each state:
SELECT State, SUM(Sales) AS TotalSales
FROM SuperstoreSales
GROUP BY State;

-- Find the customers who made the highest number of orders:
SELECT Customer ID, Customer Name, COUNT(DISTINCT Order ID) AS NumOrders
FROM SuperstoreSales
GROUP BY Customer ID, Customer Name
ORDER BY NumOrders DESC
LIMIT N;

-- Calculate the average sales for each category:
SELECT Category, AVG(Sales) AS AvgSales
FROM SuperstoreSales
GROUP BY Category;

-- Identify the products with the highest profit margin:
SELECT Product Name, (SUM(Profit) / SUM(Sales)) AS ProfitMargin
FROM SuperstoreSales
GROUP BY Product Name
ORDER BY ProfitMargin DESC
LIMIT N;

-- Show the total sales for each year and month:
SELECT EXTRACT(YEAR FROM Order Date) AS Year,
       EXTRACT(MONTH FROM Order Date) AS Month,
       SUM(Sales) AS TotalSales
FROM SuperstoreSales
GROUP BY Year, Month
ORDER BY Year, Month;

-- Calculate the average shipping time for each ship mode:
SELECT Ship Mode, AVG(DATEDIFF(Ship Date, Order Date)) AS AvgShippingTime
FROM SuperstoreSales
GROUP BY Ship Mode;

-- Identify the most popular product category for each state:
SELECT State, Category, COUNT(*) AS NumOrders
FROM SuperstoreSales
GROUP BY State, Category
HAVING COUNT(*) = (
    SELECT MAX(NumOrders)
    FROM (
        SELECT State, Category, COUNT(*) AS NumOrders
        FROM SuperstoreSales
        GROUP BY State, Category
    ) AS TempTable
    WHERE TempTable.State = SuperstoreSales.State
);

-- Show the top N customers with the highest average order sales:
SELECT Customer ID, Customer Name, AVG(Sales) AS AvgOrderSales
FROM SuperstoreSales
GROUP BY Customer ID, Customer Name
ORDER BY AvgOrderSales DESC
LIMIT N;

-- Calculate the total sales for each sub-category within a specific category:
SELECT Category, Sub-Category, SUM(Sales) AS TotalSales
FROM SuperstoreSales
WHERE Category = 'YourCategory'
GROUP BY Category, Sub-Category;

-- Find the customers who have not made any purchases in a specific period:
SELECT Customer ID, Customer Name
FROM SuperstoreSales
WHERE Customer ID NOT IN (
    SELECT DISTINCT Customer ID
    FROM SuperstoreSales
    WHERE Order Date BETWEEN 'Start_Date' AND 'End_Date'
);

-- Calculate the average sales for each city:
SELECT City, AVG(Sales) AS AvgSales
FROM SuperstoreSales
GROUP BY City;


