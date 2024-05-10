-- Creating Three Views to access certain information
USE Banking;
GO
  
/*
-- View Query 1: Retrieve Customer Information with Account Details
This view provides a convenient way for users to retrieve information about customers along with their associated account details.
By joining the Customers and Accounts tables, users can quickly access customer information such as name, address,
and phone number, along with account details like account number and balance.
*/
CREATE VIEW CustomerAccountDetailsView AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.address,
    c.phone_num,
    a.account_num,
    a.balance
FROM
    Customers c
INNER JOIN
    Accounts a ON c.customer_id = a.customer_id;


/*
-- View Query 2: Retrieve Transaction History for a Specific Account
This view allows users to easily access the transaction history for a specific account.
By joining the Transactions and Accounts tables, users can view details such as transaction ID, amount,
 type (deposit or withdrawal), and date for all transactions associated with a particular account.
*/
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
-- Query 3: Retrieve Customer and Account Information for a Specific Bank
This view provides users with information about customers and their associated accounts for a specific bank.
By joining the Customers, Accounts, and Bank tables, users can retrieve details such as customer ID, name, address,
 phone number, account number, and balance for all customers associated with a particular bank.
*/
CREATE VIEW BankCustomerAccountView AS
SELECT
    b.bank_id,
    b.bank_name,
    a.account_num,
    a.balance,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.address,
    c.phone_num
FROM
    Customers c
INNER JOIN
    Accounts a ON c.customer_id = a.customer_id
INNER JOIN
    Bank b ON a.bank_id = b.bank_id;
