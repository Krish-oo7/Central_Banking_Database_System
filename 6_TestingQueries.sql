--Qeuries for testing
USE Banking;
GO
    
--Testing query for Create tables  
SELECT 
    TABLE_NAME, 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    NUMERIC_PRECISION, 
    NUMERIC_SCALE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = 'dbo';


--Number of rows in each tables
SELECT 
    t.name AS TABLE_NAME,
    SUM(p.rows) AS ROW_COUNT
FROM 
    sys.tables t
INNER JOIN 
    sys.partitions p ON t.object_id = p.object_id
WHERE 
    t.is_ms_shipped = 0
    AND p.index_id IN (0,1) 
GROUP BY 
    t.name;


--Testing qurey for View 1
SELECT *
FROM CustomerAccountDetailsView
WHERE customer_id = 481901357;


--Testing query for View 2
SELECT * 
FROM AccountTransactionHistoryView
WHERE account_num = 753040214
ORDER BY trans_date DESC;


--Testing query for View 3
SELECT * 
FROM BankCustomerAccountView
WHERE bank_id = 361473636;


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
