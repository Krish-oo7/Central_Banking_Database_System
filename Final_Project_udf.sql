/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/
--UDF for calculating balance with interest rate in given bank.
USE Final_Project_1;
GO

-- Drop user-defined function if it already exists
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'FN' AND name = 'CalculateAccountInterest')
    DROP FUNCTION CalculateAccountInterest;
GO

-- Create user-defined function
CREATE FUNCTION CalculateAccountInterest
(
    @balance DECIMAL(38, 2),
    @interest_rate DECIMAL(5, 2)
)
RETURNS DECIMAL(38, 2)
AS
BEGIN
    DECLARE @interest DECIMAL(38, 2);
    SET @interest = @balance * (@interest_rate / 100);
    RETURN @interest;
END;
GO

/*The `CalculateAccountInterest` UDF computes interest on an account balance based on a specified interest rate. 
It takes balance and interest rate as inputs and returns the calculated interest amount. 
This function aids in financial calculations by determining accrued interest on accounts.*/