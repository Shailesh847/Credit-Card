USE ccdb;
SET GLOBAL local_infile = 1;

SELECT * FROM cust_detail;
SELECT * FROM cc_detail;

LOAD DATA LOCAL INFILE 'D:/Power BI/project/Credit Card/cc_add.csv'
INTO TABLE cc_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Client_Num, Card_Category, Annual_Fees, Activation_30_Days, Customer_Acq_Cost, @v_Week_Start_Date, Week_Num, Qtr, current_year, Credit_Limit, Total_Revolving_Bal, Total_Trans_Amt, Total_Trans_Ct, Avg_Utilization_Ratio, Use_Chip, Exp_Type, Interest_Earned, Delinquent_Acc)
SET Week_Start_Date = STR_TO_DATE(@v_Week_Start_Date, '%d-%m-%Y');

LOAD DATA LOCAL INFILE 'D:/Power BI/project/Credit Card/cust_add.csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

