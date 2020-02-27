CREATE DATABASE TestWarehouse_20181012_1117
ON            ( NAME        = DeveloperTest --filename
              , FILENAME    = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\TestWarehouse_20181012_1117.ss' )  
AS SNAPSHOT OF TestWarehouse;  
GO

RESTORE DATABASE TestWarehouse 
   FROM DATABASE_SNAPSHOT = 'TestWarehouse_20181012_1117'
GO

DROP DATABASE TestWarehouse_20181012_1117
