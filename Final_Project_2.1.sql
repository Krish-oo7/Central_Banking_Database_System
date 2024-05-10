/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/

USE Final_Project_1;
GO
--Populate the Bank table
INSERT INTO Bank (bank_id, bank_name) VALUES
(113163645, 'State Bank of India'),
(118440214, 'HDFC Bank'),
(120522693, 'Central Bank'),
(177465746, 'Reserve Bank of India'),
(264576485, 'Chase'),
(307945084, 'Swiss Bank'),
(334615916, 'Bank of America'),
(361473636, 'Bank of Terrorist'),
(408987001, 'Desert Finance'),
(495885336, 'Rajputana Bank');

--Testing insert query
SELECT * FROM Bank;