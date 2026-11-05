
-- Capstone 1: Texas Sales Analysis
-- Territory: Texas

-- Learning Note: Find all stores located in Texas.
SELECT *
FROM sample_sales.store_locations
WHERE State = 'Texas';


SELECT *
FROM sample_sales.store_sales;


-- Question 1: Texas Revenue and Transaction Dates
-- Learning Note: Match Texas stores to their sales,
-- add their sale amounts, and find the first and last dates.

SELECT
    SUM(store_sales.Sale_Amount) AS Total_Revenue,
    MIN(store_sales.Transaction_Date) AS Earliest_Date,
    MAX(store_sales.Transaction_Date) AS Latest_Date
FROM sample_sales.store_sales
JOIN sample_sales.store_locations
    ON store_sales.Store_ID = store_locations.StoreId
WHERE store_locations.State = 'Texas';
