/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/

-- View Query 2: Retrieve Transaction History for a Specific Account
USE Final_Project_1;
GO

CREATE VIEW AccountTransactionHistoryView AS
SELECT
    t.trans_id,
    t.trans_amount,
    t.is_deposit,
    t.account_num,
    t.trans_date
FROM
    Transactions t
INNER JOIN
    Accounts a ON t.account_num = a.account_num;










/*
This view allows users to easily access the transaction history for a specific account.
By joining the Transactions and Accounts tables, users can view details such as transaction ID, amount,
 type (deposit or withdrawal), and date for all transactions associated with a particular account.
*/