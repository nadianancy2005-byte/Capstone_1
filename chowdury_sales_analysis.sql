
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


-- QUESTION 3:
-- How does Texas sales revenue compare with the South Region?
SELECT
    SUM(CASE WHEN store_locations.State = 'Texas' THEN store_sales.Sale_Amount ELSE 0 END) AS Texas_Revenue,
    sUM(store_sales.Sale_Amount) AS South_Region_Revenue
FROM sample_sales.store_sales
JOIN sample_sales.store_locations
    ON store_sales.Store_ID = store_locations.StoreId
JOIN sample_sales.management
    ON management.state = store_locations.State
WHERE 
    management.region = 'South';


-- QUESTION 4:
-- How many transactions occurred each month in Texas by product category, and what was the average sale amount?

SELECT
    YEAR(store_sales.Transaction_Date) AS Year,
    MONTH(store_sales.Transaction_Date) AS Month,
    inventory_categories.Category,
    COUNT(store_sales.id) AS Total_Transactions,
    ROUND(AVG(store_sales.Sale_Amount), 2) AS Average_Sale

FROM sample_sales.store_sales

JOIN sample_sales.store_locations
    ON store_sales.Store_ID = store_locations.StoreId

JOIN sample_sales.products
    ON store_sales.Prod_Num = products.ProdNum

JOIN sample_sales.inventory_categories
    ON products.Categoryid = inventory_categories.Categoryid

WHERE store_locations.State = 'Texas'

GROUP BY
    YEAR(store_sales.Transaction_Date),
    MONTH(store_sales.Transaction_Date),
    inventory_categories.Category

ORDER BY
    Year,
    Month,
    inventory_categories.Category;


-- QUESTION 5:
-- How do Texas stores rank by total sales revenue?

SELECT
    store_locations.StoreId,
    store_locations.StoreLocation,
    store_locations.State,
    SUM(store_sales.Sale_Amount) AS Total_Revenue

FROM sample_sales.store_sales

JOIN sample_sales.store_locations
    ON store_sales.Store_ID = store_locations.StoreId

WHERE store_locations.State = 'Texas'

GROUP BY
    store_locations.StoreId,
    store_locations.StoreLocation,
    store_locations.State

ORDER BY Total_Revenue DESC;


