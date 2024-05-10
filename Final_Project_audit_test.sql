/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/

USE Final_Project_1;
GO
-- Test Audit table
-- Insert a value into transactions table
INSERT INTO Transactions (trans_id, trans_amount, is_deposit, account_num, trans_date)
VALUES (709392363, 100.00, 1, 420728786, GETDATE());

-- Modify a inserted transaction
UPDATE Transactions
SET trans_amount = 150.00
WHERE trans_id = 709392363;

--Check audit table for Transactions log
SELECT * FROM TransactionAudit;

