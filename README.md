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
![alt text](https://github.com/Krish-oo7/Central_Banking_Database_System/blob/main/Misc/Tables.png)
	 TABLE_NAME | COLUMN_NAME | DATA_TYPE | CHARACTER_MAXIMUM_LENGTH | NUMERIC_PRECISION | NUMERIC_SCALE
  | ---------- | ----------- | --------- | ------------------------ | ----------------- | -------------
1 |    Bank	   |   bank_id   |   int	  |           NULL	        |        10	       |     0
2 |    Bank	   |  bank_name  |  varchar  |            50	           |       NULL	       |    NULL
3 |    ATMs	   |   atm_id	  |   int	  |           NULL	        |        10	       |     0
4 |    ATMs	   | atm_address |  varchar  |            50	           |        NULL	    |    NULL
5 |    ATMs	   | bill_limit  | smallint  |           NULL	        |         5         |     0
6 |    ATMs	   | cash_limit  | smallint  |           NULL	        |         5 	       |     0
7 |    ATMs	   |   bank_id	  |   int	  |           NULL	        |        10	       |     0
8 | Customers	|customer_id	|int|	NULL|	10|	0
9| Customers	|first_name|	varchar|	10|	NULL|	NULL
10 | Customers|	last_name|	varchar|	10|	NULL|	NULL
11 | Customers|	address	|varchar|	50|	NULL|	NULL
12 | Customers|	phone_num |	varchar	|15|	NULL|	NULL
13 | Accounts|	account_num |	int|	NULL|	10|	0
14 | Accounts|	balance	  |  decimal|	NULL|	38|	2
15 | Accounts|	bank_id	  |  int|	NULL|	10|	0
16 | Accounts|	customer_id	|int|	NULL|	10|	0
17 | Cards|	card_id	   |  int|	NULL|	10|	0
18 | Cards|	card_num	|char	|16|	NULL|	NULL
19 | Cards|	pin	|char	|4	|NULL	|NULL
20 | Cards|	account_num	|int	NULL	|10|	0
21 | Transactions|	trans_id	|int	|NULL|	10	|0
22 | Transactions|	trans_amount	|decimal|	NULL|	10|	2
23 | Transactions|	is_deposit	|bit	|NULL	|NULL	|NULL
24 | Transactions|	account_num	|int	|NULL	|10	|0
25 | Transactions|	trans_date	|datetime|	NULL|	NULL|	NULL
![image](https://github.com/Krish-oo7/Central_Banking_Database_System/assets/123626302/8735010e-e6b6-4931-bae7-5b4bce3e3c5c)

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

