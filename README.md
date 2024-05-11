# Central Banking Database System
## Purpose
The aim of this project is to develop and implement a comprehensive database system tailored to centralize the banking industry. This database, implemented using the `Microsoft SQL Server` database server, will include structured tables to manage critical information required for banking operations, covering areas such as bank details, ATM data, customer profiles, account records, transaction details, and card information.

## ER Diagram
![alt text](https://github.com/Krish-oo7/Central_Banking_Database_System/blob/main/Misc/ER%20Diagram.png)

## Phase 1
1. Create a database.
2. Create the tables mentioned above in ER diagram.
3. Populate all the tables.

### Tables Detail
![alt text](https://github.com/Krish-oo7/Central_Banking_Database_System/blob/main/Tables.png)

## Phase 2
1. Create meaningful views that provide different types of information.
   - The `CustomerAccountDetailsView` merges data from `Customers` and `Accounts` tables, providing users with customer information (name, address, phone number) and account details (account number, balance).
   - The "AccountTransactionHistoryView" combines `Transactions` and `Accounts` tables to show transaction details (ID, amount, type, date) associated with a specific account.
   - The "BankCustomerAccountView" combines `Customers`, `Accounts`, and `Bank` tables to display customer details (ID, name, address, phone) and account information (number, balance) for a specific bank.
2. Create an Audit Table for lookup the table.
   - The `TransactionAudit` table logs transactional activities (trans_id, action, audit_date) using triggers on the Transactions table for comprehensive auditing.
3. Create a Store Procedure.
   - The stored procedure `GetCustomerTotalBalance` calculates and returns the total balance of accounts for a specified customer, offering a concise financial summary with their name.
4. Create a User Defined function (UDF).
   - The `CalculateAccountInterest` UDF computes interest for an account balance using a specified interest rate, facilitating financial calculations with accrued interest determination.
5. Create a Cursor for this database.
   - This script calculates account deposit and withdrawal totals using a cursor on the Transactions table, updating a temporary table `#AccountSummary` and displaying the results, beneficial for account statement generation and transaction trend analysis.
  
## Testing
Create the `TestingQueries` file containing queries to test all the operations mentioned in Phase 1 and Phase 2.

