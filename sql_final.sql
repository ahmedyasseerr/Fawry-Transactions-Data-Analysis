CREATE DATABASE Fawry;
USE Fawry;
-----------------------------------------------------
-----------------------------------------------------
CREATE TABLE Services (
    Service_ID INT PRIMARY KEY,
    Service_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Service_Provider VARCHAR(100) NOT NULL
);
-----------------------------------------------------
-----------------------------------------------------
CREATE TABLE Merchants (
    Merchant_ID INT PRIMARY KEY,
    Merchant_Name VARCHAR(100) NOT NULL,
    Phone_Number CHAR(11) NOT NULL,
    Contract_Date DATE,
    Merchant_Type VARCHAR(50),
    Region VARCHAR(50),
    POS_Status VARCHAR(20)
);
-----------------------------------------------------
-----------------------------------------------------
CREATE TABLE Transactions (
    Transaction_ID INT PRIMARY KEY,
    Service_ID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    fawry_Fee DECIMAL(10,2) DEFAULT 0,
    Transaction_Date DATETIME NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Payment_Method VARCHAR(30) NOT NULL,
    Device_Type VARCHAR(30) NOT NULL,
    Processing_Time_Sec DECIMAL(5,2),
    Merchant_ID INT NOT NULL,
    Year SMALLINT,
    Month TINYINT,
    Month_Name VARCHAR(20),
    Day TINYINT,
    Day_Name VARCHAR(20),
    Transaction_Time TIME,
    Hour TINYINT,
    TotalPrice DECIMAL(10,2),
    Fee_Rate DECIMAL(5,2),
    Price_Category VARCHAR(20),
    Processing_Speed VARCHAR(20),
    Success_Status TINYINT,

    FOREIGN KEY (Service_ID)
    REFERENCES Services(Service_ID),

    FOREIGN KEY (Merchant_ID)
    REFERENCES Merchants(Merchant_ID)
);

-----------------------------------------------------
-----------------------------------------------------
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Services.csv'
INTO TABLE Services
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    Service_ID,
    Service_Name,
    Category,
    Service_Provider
);
-----------------------------------------------------
-----------------------------------------------------

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Merchants22.csv'
INTO TABLE Merchants
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    Merchant_ID,
    Merchant_Name,
    Phone_Number,
    @Contract_Date,
    Merchant_Type,
    Region,
    POS_Status
)
SET
Contract_Date = STR_TO_DATE(@Contract_Date,'%d/%m/%Y');

-----------------------------------------------------
-----------------------------------------------------
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fawry22.csv'
ignore
INTO TABLE Transactions
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    Transaction_ID,
    Service_ID,
    Amount,
    Fawry_Fee,
    @Transaction_Date,
    Status,
    Payment_Method,
    Device_Type,
    Processing_Time_Sec,
    Merchant_ID,
    Year,
    Month,
    Month_Name,
    Day,
    Day_Name,
    @Transaction_Time,
    Hour,
    TotalPrice,
    Fee_Rate,
    Price_Category,
    Processing_Speed,
    Success_Status
)
SET
Transaction_Date = @Transaction_Date,
Transaction_Time = @Transaction_Time;

-----------------------------------------------
-- View  Data
-----------------------------------------------
SELECT *
FROM Transactions
LIMIT 10;
--------------------------------------------------
SELECT *FROM Merchants,Services;
--------------------------------------------------
-- Count Records
--------------------------------------------------
SELECT COUNT(*) AS Total_Records
FROM Transactions;
-------------------------------------------------
SELECT COUNT(*) AS Total_Records
FROM Services;
-------------------------------------------------
SELECT COUNT(*) AS Total_Records
FROM Merchants;
--------------------------------------------------
-- Unique Categories
--------------------------------------------------
SELECT DISTINCT Category
FROM Services;

--------------------------------------------------
-- Filter Data
--------------------------------------------------
SELECT
    Transaction_ID,
    Amount,
    Payment_Method,
    Status
FROM Transactions
WHERE Status = 'Success'
AND Payment_Method = 'Credit Card';

--------------------------------------------------
-- Search & Range
-------------------------------------------------
SELECT
    Merchant_ID,
    Merchant_Name,
    Region
FROM Merchants
WHERE Region IN ('Cairo','Giza','Alexandria')
AND Merchant_ID BETWEEN 10000 AND 30000;
--------------------------------------------------
-- Sort Results
--------------------------------------------------
SELECT
    Transaction_ID,
    Amount,
    Transaction_Date
FROM Transactions
WHERE Status='Success'
ORDER BY Amount DESC
LIMIT 10;

--------------------------------------------------
-- Aggregate Functions
--------------------------------------------------
SELECT
    SUM(Amount) AS Total_Sales,
    AVG(Amount) AS Average_Sales,
    MIN(Amount) AS Min_Sale,
    MAX(Amount) AS Max_Sale,
    COUNT(*) AS Total_Transactions
FROM Transactions
WHERE Status='Success';

--------------------------------------------------
-- Group & Having
--------------------------------------------------
SELECT
    Payment_Method,
    SUM(Amount) AS Total_Sales,
    COUNT(*) AS Transactions_Count
FROM Transactions
WHERE Status='Success'
GROUP BY Payment_Method
HAVING COUNT(*) > 1000;

--------------------------------------------------
-- CASE Statement
--------------------------------------------------
SELECT
    Transaction_ID,
    Amount,
    CASE
        WHEN Amount < 100 THEN 'Low'
        WHEN Amount <= 500 THEN 'Medium'
        ELSE 'High'
    END AS Amount_Category
FROM Transactions
WHERE Status='Success';

--------------------------------------------------
-- INNER JOIN
--------------------------------------------------
SELECT
    T.Transaction_ID,
    T.Amount,
    S.Service_Name,
    M.Merchant_Name
FROM Transactions T
INNER JOIN Services S
    ON T.Service_ID = S.Service_ID
INNER JOIN Merchants M
    ON T.Merchant_ID = M.Merchant_ID
WHERE T.Status = 'Success'
LIMIT 10;

--------------------------------------------------
-- LEFT JOIN
--------------------------------------------------
SELECT DISTINCT
    M.Merchant_Name
FROM Merchants M
LEFT JOIN Transactions T
    ON M.Merchant_ID = T.Merchant_ID
WHERE T.Merchant_ID IS NOT NULL;
    
--------------------------------------------------
-- RIGHT JOIN
--------------------------------------------------
SELECT
    S.Service_Name,
    T.Transaction_ID,
    T.Amount
FROM Services S
RIGHT JOIN Transactions T
    ON S.Service_ID = T.Service_ID;
    
--------------------------------------------------
-- FULL JOIN
--------------------------------------------------
SELECT
    S.Service_Name,
    T.Transaction_ID
FROM Services S
LEFT JOIN Transactions T
ON S.Service_ID = T.Service_ID
UNION
SELECT
    S.Service_Name,
    T.Transaction_ID
FROM Services S
RIGHT JOIN Transactions T
ON S.Service_ID = T.Service_ID;
    
--------------------------------------------------
-- Subquery
--------------------------------------------------
SELECT
    Transaction_ID,
    Amount
FROM Transactions
WHERE Amount >
(
    SELECT AVG(Amount)
    FROM Transactions
    WHERE Status = 'Success'
);

-----------------------------------------------
-- Average successful transaction
-----------------------------------------------
SELECT
    AVG(Amount) AS Average_Amount
FROM Transactions
WHERE Status = 'Success';