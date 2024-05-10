/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/

USE Final_Project_1;
GO
--Populate the Customers table
INSERT INTO Customers (customer_id, first_name, last_name, address, phone_num) VALUES
(191873690, 'Kristal', 'Tincher', ' 986 Schoolhouse Lane Huntington Beach, CA 92646', '6485151'),
(335430472, 'Elane', 'Tremble', ' 543 Devonshire Drive San Diego, CA 92117', '4749865'),
(338875710, 'Bryon', 'Rager', ' 678 Pheasant Run Salinas, CA 93906', '7458893'),
(481901357, 'Marvin', 'Binns', ' 838 Aspen Drive Chula Vista, CA 91911', '3304418'),
(548284015, 'Danielle', 'Arline', ' 644 College Street Van Nuys, CA 91405', '4494229'),
(616754635, 'Rosalee', 'Trivette', ' 574 Center Street San Bernardino, CA 92404', '2037896'),
(631659054, 'Shelley', 'Collard', ' 386 Route 7 Los Angeles, CA 90006', '1729720'),
(742042850, 'Errol', 'Brantner', ' 230 Magnolia Avenue Baldwin Park, CA 91706', '5954830'),
(972531115, 'Starla', 'Gilligan', ' 310 1st Street Huntington Park, CA 90255', '9108611'),
(995868025, 'Daphne', 'Lafreniere', ' 375 Cedar Lane Porterville, CA 93257', '9963696');

--Testing insert query
SELECT * FROM Customers;