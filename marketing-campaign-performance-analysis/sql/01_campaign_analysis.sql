/*
Marketing Campaign Performance Analysis
SQL Business Analysis Queries
*/


-- 1. Channel Performance Analysis

SELECT
    TRIM(value) AS Channel,
    COUNT(*) AS Campaigns,
    SUM(Revenue) AS Total_Revenue,
    SUM(Conversions) AS Total_Conversions,
    AVG(ROI) AS Average_ROI,
    AVG(CPA) AS Average_CPA
FROM marketing_campaigns
CROSS APPLY STRING_SPLIT(Channel_Used, ',')
GROUP BY TRIM(value)
ORDER BY Average_ROI DESC;



-- 2. Customer Segment Performance

SELECT
    Customer_Segment,
    COUNT(*) AS Total_Campaigns,
    SUM(Revenue) AS Total_Revenue,
    SUM(Conversions) AS Total_Conversions,
    AVG(ROI) AS Average_ROI
FROM marketing_campaigns
GROUP BY Customer_Segment
ORDER BY Total_Revenue DESC;



-- 3. Brand Performance

SELECT
    Brand,
    COUNT(*) AS Total_Campaigns,
    SUM(Revenue) AS Total_Revenue,
    SUM(Conversions) AS Total_Conversions,
    AVG(ROI) AS Average_ROI,
    AVG(CPA) AS Average_CPA
FROM marketing_campaigns
GROUP BY Brand
ORDER BY Total_Revenue DESC;



-- 4. Monthly Performance Trend

SELECT
    YEAR(Campaign_Date) AS Campaign_Year,
    MONTH(Campaign_Date) AS Campaign_Month,
    COUNT(*) AS Total_Campaigns,
    SUM(Revenue) AS Total_Revenue,
    SUM(Conversions) AS Total_Conversions,
    AVG(ROI) AS Average_ROI
FROM marketing_campaigns
GROUP BY 
    YEAR(Campaign_Date),
    MONTH(Campaign_Date)
ORDER BY 
    Campaign_Year,
    Campaign_Month;



-- 5. Top Performing Campaigns by ROI

SELECT TOP 10
    Campaign_ID,
    Brand,
    Campaign_Type,
    Channel_Used,
    Customer_Segment,
    Revenue,
    Conversions,
    ROI,
    CPA
FROM marketing_campaigns
ORDER BY ROI DESC;



-- 6. Campaign Type Performance

SELECT
    Campaign_Type,
    COUNT(*) AS Total_Campaigns,
    SUM(Revenue) AS Total_Revenue,
    SUM(Conversions) AS Total_Conversions,
    AVG(ROI) AS Average_ROI,
    AVG(CPA) AS Average_CPA
FROM marketing_campaigns
GROUP BY Campaign_Type
ORDER BY Average_ROI DESC;