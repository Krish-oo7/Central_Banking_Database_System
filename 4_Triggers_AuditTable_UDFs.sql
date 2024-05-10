-- Creating Audit Table, Triggers, and User Defined Function (UDFs)
USE Banking;
GO
/*
The TransactionAudit table tracks transactions with audit_id as a primary key, storing trans_id, action (insert, delete, update), and audit_date. 
Triggers on the Transactions table automatically insert audit records upon insert, delete, or update operations, maintaining a comprehensive log of 
transactional activities for auditing purposes.
*/
  
-- Creating Audit table for Transactions
CREATE TABLE TransactionAudit (
  audit_id INT IDENTITY(1,1) PRIMARY KEY,
  trans_id INT NOT NULL,
  action VARCHAR(50) NOT NULL,
  audit_date DATETIME,
  CONSTRAINT FK_TransactionAudit_Transactions FOREIGN KEY (trans_id) REFERENCES Transactions(trans_id) ON DELETE CASCADE
);
GO

-- Drop stored procedure if it already exists
IF OBJECT_ID('InsertTransaction', 'P') IS NOT NULL
    DROP PROCEDURE InsertTransaction;
GO

-- Creating stored procedure for inserting transactions and logging audit
CREATE PROCEDURE InsertTransaction (
    @trans_amount DECIMAL(10, 2),
    @is_deposit BIT,
    @account_num INT
)
AS
BEGIN
    DECLARE @trans_id INT;
    -- Insert into Transactions table
    INSERT INTO Transactions (trans_amount, is_deposit, account_num, trans_date)
    VALUES (@trans_amount, @is_deposit, @account_num, GETDATE());
    
    -- Get the last inserted transaction ID
    SET @trans_id = SCOPE_IDENTITY();
    
    -- Log the action into TransactionAudit table
    INSERT INTO TransactionAudit (trans_id, action, audit_date)
    VALUES (@trans_id, 
            CASE WHEN @is_deposit = 1 THEN 'Deposit' ELSE 'Withdrawal' END, 
            GETDATE());
END;
GO

-- Creating UDF to calculate total balance of customer's accounts
CREATE FUNCTION CalculateTotalBalance (
    @customer_id INT
)
RETURNS DECIMAL(38, 2)
AS
BEGIN
    DECLARE @total_balance DECIMAL(38, 2);
    
    SELECT @total_balance = SUM(balance)
    FROM Accounts
    WHERE customer_id = @customer_id;
    
    RETURN ISNULL(@total_balance, 0);
END;
GO

-- Drop UDF if it already exists
IF OBJECT_ID('CalculateTotalBalance', 'FN') IS NOT NULL
    DROP FUNCTION CalculateTotalBalance;
GO

-- Creating trigger to log transaction insertions into the audit table
CREATE TRIGGER LogTransactionAudit
ON Transactions
AFTER INSERT
AS
BEGIN
    INSERT INTO TransactionAudit (trans_id, action, audit_date)
    SELECT trans_id, 'Insert', GETDATE()
    FROM inserted;
END;
GO

IF OBJECT_ID('DeleteTransactionAudit', 'TR') IS NOT NULL
    DROP TRIGGER DeleteTransactionAudit;
GO

-- Creating trigger to log transaction deletions into the audit table
CREATE TRIGGER DeleteTransactionAudit
ON Transactions
AFTER DELETE
AS
BEGIN
    INSERT INTO TransactionAudit (trans_id, action, audit_date)
    SELECT trans_id, 'Delete', GETDATE()
    FROM deleted;
END;
GO

-- Creating trigger to log transaction updates into the audit table
CREATE TRIGGER UpdateTransactionAudit
ON Transactions
AFTER UPDATE
AS
BEGIN
    INSERT INTO TransactionAudit (trans_id, action, audit_date)
    SELECT trans_id, 'Update', GETDATE()
    FROM inserted;
END;
GO
