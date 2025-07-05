SELECT TOP (1000) [Row_ID]
      ,[Order_ID]
      ,[Order_Date]
      ,[Order_Priority]
      ,[Order_Quantity]
      ,[Sales]
      ,[Discount]
      ,[Ship_Mode]
      ,[Profit]
      ,[Unit_Price]
      ,[Shipping_Cost]
      ,[Customer_Name]
      ,[Province]
      ,[Region]
      ,[Customer_Segment]
      ,[Product_Category]
      ,[Product_Sub_Category]
      ,[Product_Name]
      ,[Product_Container]
      ,[Product_Base_Margin]
      ,[Ship_Date]
  FROM [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
  SELECT TOP 1 
    product_category, 
    SUM(sales) AS total_sales
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
GROUP BY 
    product_category
ORDER BY 
    total_sales DESC;
	SELECT * FROM sys.tables WHERE name = 'product_name'
	SELECT TOP 1 
    product_category, 
    SUM(sales) AS total_sales
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
GROUP BY 
    product_category
ORDER BY 
    total_sales DESC;
	-------TOP 3 AND BOTTOM 3 REGIONS IN TERMS OF SALES-----
	WITH RegionSales AS (
    SELECT 
        region, 
        SUM(sales) AS total_sales
    FROM 
        [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
    GROUP BY 
        region
),
TopRegions AS (
    SELECT TOP 3 *
    FROM RegionSales
    ORDER BY total_sales DESC
),
BottomRegions AS (
    SELECT TOP 3 *
    FROM RegionSales
    ORDER BY total_sales ASC
)
;WITH RegionSales AS (
    SELECT 
        region, 
        SUM(sales) AS total_sales
    FROM 
        [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
    GROUP BY 
        region
),
TopRegions AS (
    SELECT TOP 3 
        region, 
        total_sales
    FROM RegionSales
    ORDER BY total_sales DESC
),
BottomRegions AS (
    SELECT TOP 3 
        region, 
        total_sales
    FROM RegionSales
    ORDER BY total_sales ASC
)

SELECT * FROM TopRegions
UNION ALL
SELECT * FROM BottomRegions;
;WITH RegionSales AS (
    SELECT 
        region, 
        SUM(sales) AS total_sales
    FROM 
        [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
    GROUP BY 
        region
),
TopRegions AS (
    SELECT TOP 3 
        region, 
        total_sales,
        'Top 3' AS RankType,
        1 AS SortGroup
    FROM RegionSales
    ORDER BY total_sales DESC
),
BottomRegions AS (
    SELECT TOP 3 
        region, 
        total_sales,
        'Bottom 3' AS RankType,
        2 AS SortGroup
    FROM RegionSales
    ORDER BY total_sales ASC
)

SELECT 
    RankType,
    region, 
    total_sales
FROM (
    SELECT * FROM TopRegions
    UNION ALL
    SELECT * FROM BottomRegions
) AS Combined
ORDER BY 
    SortGroup, 
    total_sales DESC;
	;WITH RegionSales AS (
    SELECT 
        region, 
        SUM(sales) AS total_sales
    FROM 
        [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
    GROUP BY 
        region
),
TopRegions AS (
    SELECT TOP 3 
        region, 
        total_sales,
        'Top 3' AS RankType,
        1 AS SortGroup
    FROM RegionSales
    ORDER BY total_sales DESC
),
BottomRegions AS (
    SELECT TOP 3 
        region, 
        total_sales,
        'Bottom 3' AS RankType,
        2 AS SortGroup
    FROM RegionSales
    ORDER BY total_sales ASC
)

SELECT 
    RankType,
    region, 
    FORMAT(total_sales, 'N2') AS total_sales
FROM (
    SELECT * FROM TopRegions
    UNION ALL
    SELECT * FROM BottomRegions
) AS Combined
ORDER BY 
    SortGroup, 
    total_sales DESC;
SELECT 
    SUM(sales) AS total_sales
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
WHERE 
    Region = 'Ontario' 
    AND [Product_Sub-Category] = 'Appliances';
SELECT 
    SUM(sales) AS total_sales
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
WHERE 
    Region = 'Ontario' 
    AND [Product_Sub-Category] = 'Appliances';
	SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'KMS Sql Case Study Project DATA ANALYSIS';
SELECT 
    SUM(sales) AS total_sales
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
WHERE 
    Region = 'Ontario' 
    AND [Product_Sub_Category] = 'Appliances';
----rounding to 2 decimal places the total sales of appliances in Ontario ---
SELECT 
    ROUND(SUM(sales), 2) AS total_sales
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
WHERE 
    Region = 'Ontario' 
    AND [Product_Sub_Category] = 'Appliances';
	----rounding to 2 decimal places the total sales of appliances in Ontariowithout the string of zeros-----
SELECT  
    CAST(ROUND(SUM(sales), 2) AS DECIMAL(10,2)) AS total_sales
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
WHERE 
    Region = 'Ontario' 
    AND [Product_Sub_Category] = 'Appliances';
	-----bottom 10 customers by revenue total sales ----
	SELECT TOP 10
    [Customer_Name],
    SUM(sales) AS total_sales,
    COUNT(Order_ID) AS total_orders,
    AVG(Order_Quantity) AS avg_quantity,
    AVG(Discount) AS avg_discount,
    SUM(Profit) AS total_profit
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
GROUP BY 
    [Customer_Name]
ORDER BY 
    total_sales ASC;
	----top 10 customers by total sales-----
	SELECT TOP 10
    [Customer_Name],
    SUM(sales) AS total_sales,
    COUNT(Order_ID) AS total_orders,
    AVG(Order_Quantity) AS avg_quantity,
    AVG(Discount) AS avg_discount,
    SUM(Profit) AS total_profit
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
GROUP BY 
    [Customer_Name]
ORDER BY 
    total_sales DESC;
	---BOTTOM 10 CUSTOMERS BY PRODUCT CATEGORY---
SELECT [Customer_Name], [Product_Category], COUNT(*) AS order_count
FROM [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
WHERE [Customer_Name] IN ('Jeremy Farry', 'Natalie DeCherney', ...)  -- bottom 10
GROUP BY [Customer_Name], [Product_Category];
---grouping bottom 10 customers by product category---
SELECT 
    [Customer_Name], 
    [Product_Category], 
    COUNT(*) AS order_count
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
WHERE 
    [Customer_Name] IN (
        'Jeremy Farry',
        'Natalie DeCherney',
        'Nicole Fjeld',
        'Katrina Edelman',
        'Dorothy Dickinson',
        'Christine Kargatis',
        'Eric Murdock',
        'Chris McAfee',
        'Rick Huthwaite',
        'Mark Hamilton'
    )
GROUP BY 
    [Customer_Name], 
    [Product_Category];
---shipping mode with the highest shipping cost---
SELECT TOP 1 
    [Ship_Mode], 
    SUM([Shipping_Cost]) AS total_shipping_cost
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
GROUP BY 
    [Ship_Mode]
ORDER BY 
    total_shipping_cost DESC;
----shipping mode with the highest shipping cost rounded to 2d.p----
SELECT TOP 1 
    [Ship_Mode], 
    ROUND(SUM([Shipping_Cost]), 2) AS total_shipping_cost
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
GROUP BY 
    [Ship_Mode]
ORDER BY 
    total_shipping_cost DESC;
	-----Top 10 Most Valuable Customers and Their Purchase Patterns----
	-- Top 10 Most Valuable Customers and Their Purchase Patterns
SELECT 
    [Customer_Name],
    SUM([Sales]) AS total_sales,
    COUNT(*) AS total_orders,
    COUNT(DISTINCT [Product_Category]) AS product_category_count,
    STRING_AGG(DISTINCT [Product_Category], ', ') AS categories_purchased
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
GROUP BY 
    [Customer_Name]
ORDER BY 
    total_sales DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY; 
----Top 10 Most Valuable Customers and their purchase paterns----
SELECT TOP 10
    cs.[Customer_Name],
    cs.total_sales,
    cs.total_orders,
    cs.product_category_count,
    STUFF(
      (
        SELECT DISTINCT ', ' + sub.[Product_Category]
        FROM [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS] AS sub
        WHERE sub.[Customer_Name] = cs.[Customer_Name]
        FOR XML PATH(''), TYPE
      ).value('.', 'NVARCHAR(MAX)')
    , 1, 2, '') AS categories_purchased
FROM (
    SELECT 
        [Customer_Name],
        SUM([Sales])      AS total_sales,
        COUNT(*)          AS total_orders,
        COUNT(DISTINCT [Product_Category]) AS product_category_count
    FROM 
        [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
    GROUP BY 
        [Customer_Name]
) AS cs
ORDER BY 
    cs.total_sales DESC;
	-Top 10 Most Valuable Customers and their purchase paterns sub-category included----
	SELECT TOP 10
    cs.[Customer_Name],
    cs.total_sales,
    cs.total_orders,
    cs.product_category_count,
    -- Comma‑separated list of distinct categories
    STUFF(
      (
        SELECT DISTINCT ', ' + sub.[Product_Category]
        FROM [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS] AS sub
        WHERE sub.[Customer_Name] = cs.[Customer_Name]
        FOR XML PATH(''), TYPE
      ).value('.', 'NVARCHAR(MAX)')
    , 1, 2, '') AS categories_purchased,
    -- Comma‑separated list of distinct sub‑categories
    STUFF(
      (
        SELECT DISTINCT ', ' + sub.[Product_Sub_Category]
        FROM [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS] AS sub
        WHERE sub.[Customer_Name] = cs.[Customer_Name]
        FOR XML PATH(''), TYPE
      ).value('.', 'NVARCHAR(MAX)')
    , 1, 2, '') AS subcategories_purchased
FROM (
    SELECT 
        [Customer_Name],
        SUM([Sales])      AS total_sales,
        COUNT(*)          AS total_orders,
        COUNT(DISTINCT [Product_Category]) AS product_category_count
    FROM 
        [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
    GROUP BY 
        [Customer_Name]
) AS cs
ORDER BY 
    cs.total_sales DESC;
SELECT TOP 10
    cs.[Customer_Name],
    cs.total_sales,
    cs.total_orders,
    cs.product_category_count,
    -- Comma‑separated list of distinct categories
    STUFF(
      (
        SELECT DISTINCT ', ' + sub.[Product_Category]
        FROM [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS] AS sub
        WHERE sub.[Customer_Name] = cs.[Customer_Name]
        FOR XML PATH(''), TYPE
      ).value('.', 'NVARCHAR(MAX)')
    , 1, 2, '') AS categories_purchased,
    -- Comma‑separated list of distinct sub‑categories
    STUFF(
      (
        SELECT DISTINCT ', ' + sub.[Product_Sub_Category]
        FROM [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS] AS sub
        WHERE sub.[Customer_Name] = cs.[Customer_Name]
        FOR XML PATH(''), TYPE
      ).value('.', 'NVARCHAR(MAX)')
    , 1, 2, '') AS subcategories_purchased
FROM (
    SELECT 
        [Customer_Name],
        SUM([Sales])      AS total_sales,
        COUNT(*)          AS total_orders,
        COUNT(DISTINCT [Product_Category]) AS product_category_count
    FROM 
        [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
    GROUP BY 
        [Customer_Name]
) AS cs
ORDER BY 
    cs.total_sales DESC;
	---top 10 most valuable customers by product category, product subcategory, total orders, total sales---
SELECT TOP 10
    cs.[Customer_Name],
    cs.total_sales,
    cs.total_orders,
    cs.product_category_count,
    -- Comma‑separated list of distinct categories
    STUFF(
      (
        SELECT DISTINCT ', ' + sub.[Product_Category]
        FROM [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS] AS sub
        WHERE sub.[Customer_Name] = cs.[Customer_Name]
        FOR XML PATH(''), TYPE
      ).value('.', 'NVARCHAR(MAX)')
    , 1, 2, '') AS categories_purchased,
    -- Comma‑separated list of distinct sub‑categories
    STUFF(
      (
        SELECT DISTINCT ', ' + sub.[Product_Sub_Category]
        FROM [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS] AS sub
        WHERE sub.[Customer_Name] = cs.[Customer_Name]
        FOR XML PATH(''), TYPE
      ).value('.', 'NVARCHAR(MAX)')
    , 1, 2, '') AS subcategories_purchased
FROM (
    SELECT 
        [Customer_Name],
        SUM([Sales])      AS total_sales,
        COUNT(*)          AS total_orders,
        COUNT(DISTINCT [Product_Category]) AS product_category_count
    FROM 
        [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
    GROUP BY 
        [Customer_Name]
) AS cs
ORDER BY 
    cs.total_sales DESC;
-----SMALL BUSINESS CUSTOMER WITH THE HIGHEST SALES----
SELECT TOP 1
    [Customer_Name],
    FORMAT(ROUND(SUM([Sales]),2),'N2') AS total_sales
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
WHERE 
    [Customer_Segment] = 'Small Business'
GROUP BY 
    [Customer_Name]
ORDER BY 
    SUM([Sales]) DESC;
	----CORPORATE CUSTOMER HIGHEST COUNT ORDERS 2009-2012----
	SELECT TOP 1
    [Customer_Name],
    COUNT([Order_ID])       AS total_orders,
    SUM([Order_Quantity])   AS total_items_ordered
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
WHERE 
    [Customer_Segment] = 'Corporate'
    AND [Order_Date] BETWEEN '2009-01-01' AND '2012-12-31'
GROUP BY 
    [Customer_Name]
ORDER BY 
    total_orders DESC;
---MOST PROFITABLE CONSUMER CUSTOMER---
SELECT TOP 1
    [Customer_Name],
    SUM([Profit]) AS total_profit
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
WHERE 
    [Customer_Segment] = 'Consumer'
GROUP BY 
    [Customer_Name]
ORDER BY 
    total_profit DESC;
----inspect rows with negative sales or negative order quantities---
SELECT TOP 100
    *
FROM 
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
WHERE 
    Sales  < 0
    OR Order_Quantity < 0;
----checking for return-flag column----
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'KMS Sql Case Study Project DATA ANALYSIS'
  AND COLUMN_NAME LIKE '%return%';
----ANALYSING SHIPPING COSTS SPEND BASED ON ORDER PRIORITY---
SELECT
    Order_Priority,
    Ship_Mode,
    COUNT(*)               AS order_count,
    SUM(Shipping_Cost)     AS total_shipping_cost,
    ROUND(AVG(Shipping_Cost), 2) AS avg_shipping_cost
FROM
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
GROUP BY
    Order_Priority,
    Ship_Mode
ORDER BY
    Order_Priority,
    avg_shipping_cost DESC;
----excluding 'not specified' from my KPI query----
SELECT
    Order_Priority,
    Ship_Mode,
    COUNT(*)               AS order_count,
    SUM(Shipping_Cost)     AS total_shipping_cost,
    ROUND(AVG(Shipping_Cost), 2) AS avg_shipping_cost
FROM
    [DSA_DB].[dbo].[KMS Sql Case Study Project DATA ANALYSIS]
WHERE
    Order_Priority <> 'Not Specified'    
GROUP BY
    Order_Priority,
    Ship_Mode
ORDER BY
    Order_Priority,
    avg_shipping_cost DESC;
