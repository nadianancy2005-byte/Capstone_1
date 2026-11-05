
-- CAPSTONE 1: TEXAS SALES ANALYSIS
-- Territory: Texas
-- Region: Central


-- QUESTION 1:
-- What is the total revenue for Texas?
-- What are the earliest and latest transaction dates?

SELECT
    SUM(store_sales.Sale_Amount) AS Total_Revenue,
    MIN(store_sales.Transaction_Date) AS Earliest_Date,
    MAX(store_sales.Transaction_Date) AS Latest_Date
FROM sample_sales.store_sales
JOIN sample_sales.store_locations
ON store_sales.Store_ID = store_locations.StoreId
WHERE store_locations.State = 'Texas';


-- QUESTION 2:
-- How much revenue did Texas generate each month and year?

SELECT
    SUM(store_sales.Sale_Amount) AS Total_Revenue,
    YEAR(store_sales.Transaction_Date) AS year,
    MONTH(store_sales.Transaction_Date) AS month
FROM sample_sales.store_sales
JOIN sample_sales.store_locations
ON store_sales.Store_ID = store_locations.StoreId
WHERE store_locations.State = 'Texas'
GROUP BY
    YEAR(store_sales.Transaction_Date),
    MONTH(store_sales.Transaction_Date)
ORDER BY
    year,
    month;
