/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/
--Store procedure to get the total balance of sprecifict user from all the accaounts
-- Drop stored procedure if it already exists
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GetCustomerTotalBalance')
    DROP PROCEDURE GetCustomerTotalBalance;
GO

-- Create stored procedure
CREATE PROCEDURE GetCustomerTotalBalance
    @customer_id INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @customer_name VARCHAR(50);
    DECLARE @total_balance DECIMAL(38, 2);

    -- Get customer name
    SELECT @customer_name = CONCAT(first_name, ' ', last_name)
    FROM Customers
    WHERE customer_id = @customer_id;

    -- Calculate total balance
    SELECT @total_balance = SUM(balance)
    FROM Accounts
    WHERE customer_id = @customer_id;

    -- Print customer ID, name, and total balance in table format
    SELECT 
        CustomerID = @customer_id,
        CustomerName = @customer_name,
        TotalBalance = @total_balance;
END;
GO








/*The stored procedure GetCustomerTotalBalance calculates and returns the total balance across all accounts belonging to a specified customer. 
It takes the customer ID as input and retrieves the sum of balances from the Accounts table associated with that customer, 
providing a concise summary of their financial status with their name.*/