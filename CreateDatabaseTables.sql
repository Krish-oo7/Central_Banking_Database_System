--CREATE A DATABASE FOR BANKING
CREATE DATABASE Banking;
GO

-- CREATE TABLES FOR THE DATABASE
USE Banking;
GO
  
-- Create Bank table
CREATE TABLE Bank (
  bank_id INT NOT NULL,
  bank_name VARCHAR(50) NOT NULL,
  CONSTRAINT PK_Bank PRIMARY KEY (bank_id),
  CONSTRAINT CHK_BankID CHECK (bank_id > 0)
);

-- Create ATMs table
CREATE TABLE ATMs (
  atm_id INT NOT NULL,
  atm_address VARCHAR(50) NOT NULL,
  bill_limit SMALLINT NOT NULL DEFAULT 5000,
  cash_limit SMALLINT NOT NULL DEFAULT 10000,
  bank_id INT,
  CONSTRAINT PK_ATMs PRIMARY KEY (atm_id),
  CONSTRAINT FK_ATMs_Bank FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE
);

-- Create Customers table
CREATE TABLE Customers (
  customer_id INT NOT NULL,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  address VARCHAR(50) NOT NULL,
  phone_num VARCHAR(15) NOT NULL,
  CONSTRAINT PK_Customers PRIMARY KEY (customer_id),
);

-- Create Accounts table
CREATE TABLE Accounts (
  account_num INT NOT NULL,
  balance DECIMAL(38, 2) NOT NULL,
  bank_id INT,
  customer_id INT,
  CONSTRAINT PK_Accounts PRIMARY KEY (account_num),
  CONSTRAINT FK_Accounts_Bank FOREIGN KEY (bank_id) REFERENCES Bank(bank_id) ON DELETE CASCADE,
  CONSTRAINT FK_Accounts_Customers FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE NO ACTION
);

-- Create Cards table
CREATE TABLE Cards (
  card_id INT NOT NULL,
  card_num CHAR(16) NOT NULL,
  pin CHAR(4) NOT NULL,
  account_num INT,
  CONSTRAINT PK_Cards PRIMARY KEY (card_id),
  CONSTRAINT UQ_Cards_CardNum UNIQUE (card_num),
  CONSTRAINT FK_Cards_Accounts FOREIGN KEY (account_num) REFERENCES Accounts(account_num) ON DELETE NO ACTION
);


-- Create Transactions table
CREATE TABLE Transactions (
  trans_id INT NOT NULL,
  trans_amount DECIMAL(10, 2) NOT NULL,
  is_deposit BIT,
  account_num INT,
  trans_date DATETIME,
  CONSTRAINT PK_Transactions PRIMARY KEY (trans_id),
  CONSTRAINT CHK_Transactions_TransID CHECK (trans_id > 0 AND trans_amount > 0),
  CONSTRAINT FK_Transactions_Accounts FOREIGN KEY (account_num) REFERENCES Accounts(account_num) ON DELETE CASCADE
);
