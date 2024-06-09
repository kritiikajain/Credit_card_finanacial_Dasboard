use ccdb
CREATE TABLE cc_detail1 (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

select * from cc_detail

BULK INSERT cc_detail
FROM 'D:\credit_card_formatted.csv'
WITH (FORMAT ='CSV'
      , FIRSTROW=2
	  , FIELDTERMINATOR = ','
	  , ROWTERMINATOR = '0x0a');




SELECT * FROM cc_detail

--SELECT Week_Start_Date
--FROM cc_detail
--WHERE ISDATE(Week_Start_Date) = 0;

SELECT 
    c.name AS COLUMN_NAME,
    t.name AS DATA_TYPE,
    c.max_length AS CHARACTER_MAXIMUM_LENGTH,
    c.precision AS NUMERIC_PRECISION,
    c.scale AS NUMERIC_SCALE,
    c.is_nullable AS IS_NULLABLE
FROM 
    sys.columns c
JOIN 
    sys.types t ON c.user_type_id = t.user_type_id
WHERE 
    c.object_id = OBJECT_ID('dbo.cc_detail');


--Truncate table cc_detail

CREATE TABLE cust_detail1 (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);
 
SELECT * FROM cust_detail

BULK INSERT cust_detail
FROM 'D:\customer.csv'
WITH (FORMAT ='CSV'
      , FIRSTROW=2
	  , FIELDTERMINATOR = ','
	  , ROWTERMINATOR = '0x0a');

BULK INSERT cc_detail
FROM 'D:\cc_add_formatted.csv'
WITH (FORMAT ='CSV'
      , FIRSTROW=2
	  , FIELDTERMINATOR = ','
	  , ROWTERMINATOR = '0x0a');

BULK INSERT cust_detail
FROM 'D:\cust_add.csv'
WITH (FORMAT ='CSV'
      , FIRSTROW=2
	  , FIELDTERMINATOR = ','
	  , ROWTERMINATOR = '0x0a');


 
