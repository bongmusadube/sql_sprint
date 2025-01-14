-- -- 1. Basic Customer Segmentation
-- -- Group customers by income group and calculate basic statistics for each group.
-- SELECT 
--     i.income_group_desc AS income_group,
--     COUNT(c.customer_identifier) AS Total_Customers,
--     ROUND(AVG(c.age)) AS Avg_Age,
--     ROUND(AVG(c.number_of_accounts)) AS Avg_Number_of_Accounts
-- FROM 
--     customers c
-- JOIN 
--     income_group i
-- ON 
--     c.income_group_code = i.income_group_code
-- GROUP BY 
--     i.income_group_desc, i.income_group_code
-- ORDER BY 
--     i.income_group_code;


-- -- 2.Segmentation by Age Groups
-- -- Create age brackets to analyze behavior
-- SELECT 
--     CASE 
--         WHEN c.age < 20 THEN 'Below 20'
--         WHEN c.age BETWEEN 20 AND 29 THEN '20-29'
--         WHEN c.age BETWEEN 30 AND 39 THEN '30-39'
--         WHEN c.age BETWEEN 40 AND 49 THEN '40-49'
--         WHEN c.age BETWEEN 50 AND 59 THEN '50-59'
--         ELSE '60 and above'
--     END AS Age_Group,
--     COUNT(c.customer_identifier) AS Total_Customers,
--     ROUND(AVG(c.number_of_accounts)) AS Avg_Number_of_Accounts
-- FROM 
--     customers c
-- GROUP BY 
--     Age_Group
-- ORDER BY 
--     Age_Group;


-- -- 3. Cross-Analysis of Income and Age
-- -- Combining income group and age group for deeper insights.
-- SELECT 
--     i.income_group_desc AS Income_Group,
--     CASE 
--         WHEN c.age < 20 THEN 'Below 20'
--         WHEN c.age BETWEEN 20 AND 29 THEN '20-29'
--         WHEN c.age BETWEEN 30 AND 39 THEN '30-39'
--         WHEN c.age BETWEEN 40 AND 49 THEN '40-49'
--         WHEN c.age BETWEEN 50 AND 59 THEN '50-59'
--         ELSE '60 and above'
--     END AS age_group,
--     COUNT(c.customer_identifier) AS Total_Customers,
--     ROUND(AVG(c.number_of_accounts)) AS Avg_Number_of_Accounts
-- FROM 
--     customers c
-- JOIN 
--     income_group i
-- ON 
--     c.income_group_code = i.income_group_code
-- GROUP BY 
--     i.income_group_desc, age_group, i.income_group_code
-- ORDER BY 
--     i.income_group_code, age_group;


-- -- 4. Identify Top Segments with High Account Usage
-- -- Focus on customers with the highest number of accounts.
-- SELECT 
--     c.customer_identifier,
--     i.income_group_desc AS Income_Group,
--     c.age,
--     c.number_of_accounts
-- FROM 
--     customers c
-- JOIN 
--     income_group i
-- ON 
--     c.income_group_code = i.income_group_code
-- WHERE 
--     c.number_of_accounts = (
--         SELECT MAX(number_of_accounts) FROM customers
--     )
-- ORDER BY 
--     c.number_of_accounts DESC;

