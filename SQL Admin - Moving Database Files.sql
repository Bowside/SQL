Use MASTER
GO

-- Set database to single user mode
ALTER DATABASE Conexus_Warehouse
SET SINGLE_USER
GO 

-- Detach the database
sp_detach_db 'Conexus_Warehouse'
GO

USE master
GO

-- Now Attach the database
CREATE DATABASE Conexus_Warehouse ON
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse.mdf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201412.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201501.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201502.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201503.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201504.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201505.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201506.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201507.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201508.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201509.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201510.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201511.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201512.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201601.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201602.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201603.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201604.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201605.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201606.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201607.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201608.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201609.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201610.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201611.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201612.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201701.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201702.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201703.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201704.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201705.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201706.ndf'),
(FILENAME = 'J:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_201707.ndf'),
(FILENAME = 'K:\MSSQL12.SCOM001\MSSQL\DATA\Conexus_Warehouse_Log.ldf') FOR ATTACH
GO