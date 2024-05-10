/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/

-- View Query 1: Retrieve Customer Information with Account Details
USE Final_Project_1;
GO

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
This view provides a convenient way for users to retrieve information about customers along with their associated account details.
By joining the Customers and Accounts tables, users can quickly access customer information such as name, address,
and phone number, along with account details like account number and balance.
*/