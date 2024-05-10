/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/
USE Final_Project_1;
GO
-- Drop the temporary table if it already exists
IF OBJECT_ID('tempdb..#CustomerBalanceWithInterest') IS NOT NULL
    DROP TABLE #CustomerBalanceWithInterest;

-- Create a temporary table to store customer balances with added interest
CREATE TABLE #CustomerBalanceWithInterest (
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    AccountNum INT,
    Balance DECIMAL(38, 2),
    InterestRate DECIMAL(5, 2),
    FinalBalance DECIMAL(38, 2)
);

-- Insert data into the temporary table by joining BankCustomerAccountView and calculating interest
INSERT INTO #CustomerBalanceWithInterest (CustomerID, FirstName, LastName, AccountNum, Balance, InterestRate, FinalBalance)
SELECT 
    bcav.customer_id,
    bcav.first_name,
    bcav.last_name,
    bcav.account_num,
    bcav.balance,
    5.00 AS InterestRate, -- Adjust interest rate as needed
    dbo.CalculateAccountInterest(bcav.balance, 5.00) + bcav.balance AS FinalBalance -- Adjust interest rate as needed
FROM 
    BankCustomerAccountView bcav
WHERE 
    bcav.bank_id = 361473636; 

-- Select and display the data from the temporary table
SELECT * FROM #CustomerBalanceWithInterest;

-- Drop the temporary table
DROP TABLE #CustomerBalanceWithInterest;
