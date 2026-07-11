-- Retail Sales Performance Analysis
-- SQL Business Analysis Queries

USE RetailAnalytics;

SELECT TOP 5 *
FROM dbo.superstore_cleaned;

sp_help 'dbo.superstore_cleaned';

USE RetailAnalytics;

SELECT 
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT Product_ID) AS Total_Products
FROM dbo.superstore_cleaned;

SELECT
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100,2) AS Profit_Margin_Percentage,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID),2) AS Average_Order_Value
FROM dbo.superstore_cleaned;


SELECT
    COUNT(*) AS Loss_Making_Orders,
    ROUND(SUM(Sales),2) AS Sales_From_Losses,
    ROUND(SUM(Profit),2) AS Total_Loss
FROM dbo.superstore_cleaned
WHERE Profit < 0;

SELECT TOP 10
    Sales,
    Profit
FROM dbo.superstore_cleaned;


DROP TABLE dbo.superstore_cleaned;


CREATE TABLE dbo.superstore_cleaned (
    Row_ID INT,
    Order_ID NVARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode NVARCHAR(50),
    Customer_ID NVARCHAR(50),
    Customer_Name NVARCHAR(100),
    Segment NVARCHAR(50),
    Country NVARCHAR(50),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Postal_Code INT,
    Region NVARCHAR(50),
    Product_ID NVARCHAR(50),
    Category NVARCHAR(50),
    Sub_Category NVARCHAR(50),
    Product_Name NVARCHAR(300),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,4)
);


USE RetailAnalytics;

DROP TABLE IF EXISTS dbo.superstore_cleaned;


SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'superstore_cleaned';


CREATE TABLE dbo.superstore_cleaned (
    Row_ID INT,
    Order_ID NVARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode NVARCHAR(50),
    Customer_ID NVARCHAR(50),
    Customer_Name NVARCHAR(100),
    Segment NVARCHAR(50),
    Country NVARCHAR(50),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Postal_Code INT,
    Region NVARCHAR(50),
    Product_ID NVARCHAR(50),
    Category NVARCHAR(50),
    Sub_Category NVARCHAR(50),
    Product_Name NVARCHAR(300),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,4)
);


SELECT TOP 5 *
FROM dbo.superstore_cleaned;


USE RetailAnalytics;

SELECT 
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT Product_ID) AS Total_Products
FROM dbo.superstore_cleaned;


SELECT
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100,2) AS Profit_Margin_Percentage,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID),2) AS Average_Order_Value
FROM dbo.superstore_cleaned;


SELECT
    COUNT(*) AS Loss_Making_Orders,
    ROUND(SUM(Sales),2) AS Sales_From_Losses,
    ROUND(SUM(Profit),2) AS Total_Loss
FROM dbo.superstore_cleaned
WHERE Profit < 0;


-- Sales and Profit by Category

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin
FROM dbo.superstore_cleaned
GROUP BY Category
ORDER BY Total_Sales DESC;


-- Sales and Profit by Customer Segment

SELECT
    Segment,
    COUNT(DISTINCT Customer_ID) AS Customers,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM dbo.superstore_cleaned
GROUP BY Segment
ORDER BY Total_Sales DESC;


SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin
FROM dbo.superstore_cleaned
GROUP BY Segment
ORDER BY Profit_Margin DESC;


SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin
FROM dbo.superstore_cleaned
GROUP BY Region
ORDER BY Total_Sales DESC;


-- Loss Making Products

SELECT TOP 10
    Product_Name,
    Category,
    Sub_Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM dbo.superstore_cleaned
GROUP BY 
    Product_Name,
    Category,
    Sub_Category
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;


-- Discount Impact

SELECT
    Discount,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin
FROM dbo.superstore_cleaned
GROUP BY Discount
ORDER BY Discount;


-- Monthly Sales Trend

SELECT
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM dbo.superstore_cleaned
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    Order_Year,
    Order_Month;


    -- Sub-category profitability

SELECT
    Sub_Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin
FROM dbo.superstore_cleaned
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;