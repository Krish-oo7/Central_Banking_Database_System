/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/
-- Query 3: Retrieve Customer and Account Information for a Specific Bank
USE Final_Project_1;
GO

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





/*
This view provides users with information about customers and their associated accounts for a specific bank.
By joining the Customers, Accounts, and Bank tables, users can retrieve details such as customer ID, name, address,
 phone number, account number, and balance for all customers associated with a particular bank.
*/
