/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/

USE Final_Project_1;
GO
--Testing query for store procedure
-- Declare table variable to store output
DECLARE @Output TABLE (
    CustomerID INT,
    CustomerName VARCHAR(50),
    TotalBalance DECIMAL(38, 2)
);

-- Execute stored procedure and insert output into table variable
INSERT INTO @Output
EXEC GetCustomerTotalBalance @customer_id = 481901357;

-- Print results
SELECT * FROM @Output;