/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/
--Testing query for View 2

USE Final_Project_1;
GO
SELECT * 
FROM AccountTransactionHistoryView
WHERE account_num = 753040214
ORDER BY trans_date DESC;