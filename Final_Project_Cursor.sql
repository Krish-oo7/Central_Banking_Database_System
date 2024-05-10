/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/

--Cursor code with testing query
USE Final_Project_1;
GO

-- Implementing cursor to calculate the total deposit and withdrawal based on the transactions.
-- Drop the table if it already exists.
IF OBJECT_ID('tempdb..#AccountSummary') IS NOT NULL
    DROP TABLE #AccountSummary;

-- Creating a temporary table
CREATE TABLE #AccountSummary (
    account_num INT PRIMARY KEY,
    total_deposits DECIMAL(10, 2),
    total_withdrawals DECIMAL(10, 2)
);

-- Declare variables
DECLARE @account_num INT;
DECLARE @trans_amount DECIMAL(10, 2);
DECLARE @is_deposit BIT;

-- Declare Cursor
DECLARE trans_cursor CURSOR FOR
SELECT account_num, trans_amount, is_deposit
FROM Transactions;

-- Open Cursor
OPEN trans_cursor;

-- Fetch First row
FETCH NEXT FROM trans_cursor INTO @account_num, @trans_amount, @is_deposit;

-- Loop through cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Check if account exists in the summary table
    IF NOT EXISTS (SELECT 1 FROM #AccountSummary WHERE account_num = @account_num)
    BEGIN
        -- Insert new row for the account
        INSERT INTO #AccountSummary (account_num, total_deposits, total_withdrawals)
        VALUES (@account_num, 0, 0);
    END

    -- Update account summary
    IF @is_deposit = 1
    BEGIN
        UPDATE #AccountSummary
        SET total_deposits = total_deposits + @trans_amount
        WHERE account_num = @account_num;
    END
    ELSE
    BEGIN
        UPDATE #AccountSummary
        SET total_withdrawals = total_withdrawals + @trans_amount
        WHERE account_num = @account_num;
    END

    -- Fetch next row
    FETCH NEXT FROM trans_cursor INTO @account_num, @trans_amount, @is_deposit;
END

-- Close and deallocate cursor
CLOSE trans_cursor;
DEALLOCATE trans_cursor;

-- Select and display results
SELECT * FROM #AccountSummary;

-- Drop temporary table
DROP TABLE #AccountSummary;

/*
This script calculates the total deposit and withdrawal amounts for each account by iterating over the Transactions table using a cursor.
It updates the #AccountSummary temporary table accordingly. Finally, it selects and displays the results from the temporary table.
This operation can be useful for generating account statements or analyzing transaction trends for each account.
*/