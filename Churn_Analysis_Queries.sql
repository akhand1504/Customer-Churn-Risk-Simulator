create database Customer_churn;
use  Customer_churn;


CREATE TABLE Customer_Churn_Data (
    CustomerID VARCHAR(50),
    MonthlyCharges DOUBLE,
    TotalCharges DOUBLE,
    Tenure INT,
    Contract_MonthToMonth INT,
    Contract_OneYear INT,
    Contract_TwoYear INT,
    Churn_Probability DOUBLE,
    Churn_Actual INT
); 
SELECT * FROM Customer_Churn_Data LIMIT 10;
SELECT
    CASE
        WHEN Churn_Probability > 0.75 THEN 'Critical Risk'
        WHEN Churn_Probability BETWEEN 0.5 AND 0.75 THEN 'High Risk'
        ELSE 'Safe'
    END AS Risk_Category,
    COUNT(CustomerID) AS Customer_Count,
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Bill
FROM Customer_Churn_Data
GROUP BY 1
ORDER BY Customer_Count DESC;

SELECT
    SUM(MonthlyCharges) AS Total_Revenue_At_Risk
FROM Customer_Churn_Data
WHERE Churn_Probability > 0.75;
SELECT * FROM Customer_Churn_Data;