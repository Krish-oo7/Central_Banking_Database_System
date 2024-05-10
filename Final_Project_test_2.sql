/*
** Team: Final_Project_1
** Authors Name-ID : Krishna Singh Rajput - 1229962853
**                 : Nidhi Prakashbhai Mistry - 1230085261
** Course: IFT/530
** SQL Server version: Microsoft SQL Server 2022
*/

--Number of rows in each tables
SELECT 
    t.name AS TABLE_NAME,
    SUM(p.rows) AS ROW_COUNT
FROM 
    sys.tables t
INNER JOIN 
    sys.partitions p ON t.object_id = p.object_id
WHERE 
    t.is_ms_shipped = 0
    AND p.index_id IN (0,1) 
GROUP BY 
    t.name;