/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/

USE Final_Project_1;
GO
--Populate the ATMs table
INSERT INTO ATMs (atm_id, atm_address, bill_limit, cash_limit, bank_id) VALUES
(216422679, '30 Magnolia Avenue Baldwin Park, CA 91706', 5000, 10000, 307945084),
(355615067, '38 Aspen Drive Chula Vista, CA 91911', 5000, 10000, 113163645),
(505570697, '43 Devonshire Drive San Diego, CA 92117', 5000, 10000, 264576485),
(687179920, '78 Pheasant Run Salinas, CA 93906', 5000, 10000, 334615916),
(730816273, '86 Schoolhouse Lane Huntington Beach, CA 92646', 5000, 10000, 495885336),
(760731674, '74 Center Street San Bernardino, CA 92404', 5000, 10000, 118440214),
(770139830, '44 College Street Van Nuys, CA 91405', 5000, 10000, 361473636),
(817085901, '10 1st Street Huntington Park, CA 90255', 5000, 10000, 177465746),
(842691955, '75 Cedar Lane Porterville, CA 93257', 5000, 10000, 120522693),
(939559663, '86 Route 7 Los Angeles, CA 90006', 5000, 10000, 408987001);

--Testing insert query
SELECT * FROM ATMs;