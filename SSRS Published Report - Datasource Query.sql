WITH XMLNAMESPACES 
( DEFAULT 
  'http://schemas.microsoft.com/sqlserver/reporting/2010/01/reportdefinition'
, 'http://schemas.microsoft.com/SQLServer/reporting/reportdesigner' AS ReportDefinition )
SELECT  
CATDATA.ItemID AS ReportId
,CATDATA.Name AS ReportName
,CATDATA.Path AS ReportPathLocation
,xmlcolumn.value('(@Name)[1]', 'VARCHAR(250)') AS DataSetName  
,xmlcolumn.value('(Query/DataSourceName)[1]','VARCHAR(250)') AS DataSoureName 
,xmlcolumn.value('(Query/CommandText)[1]','VARCHAR(2500)') AS CommandText
FROM (  
	SELECT C.Name
	,c.ItemID
	,c.Path
	,CONVERT(XML,CONVERT(VARBINARY(MAX),C.Content)) AS reportXML
	FROM  ReportServer.dbo.Catalog C
	WHERE  C.Content is not null
	AND  C.Type = 2
	) CATDATA
CROSS APPLY reportXML.nodes('/Report/DataSets/DataSet') xmltable ( xmlcolumn )
ORDER BY CATDATA.Name

UNION

WITH XMLNAMESPACES
( DEFAULT 
  'http://schemas.microsoft.com/sqlserver/reporting/2005/01/reportdefinition'
, 'http://schemas.microsoft.com/SQLServer/reporting/reportdesigner' AS ReportDefinition )
SELECT  
CATDATA.ItemID AS ReportId
,CATDATA.Name AS ReportName
,CATDATA.Path AS ReportPathLocation
,xmlcolumn.value('(@Name)[1]', 'VARCHAR(250)') AS DataSetName  
,xmlcolumn.value('(Query/DataSourceName)[1]','VARCHAR(250)') AS DataSoureName 
,xmlcolumn.value('(Query/CommandText)[1]','VARCHAR(2500)') AS CommandText
FROM (  
	SELECT C.ItemId, C.Name
	,c.Path
	,CONVERT(XML,CONVERT(VARBINARY(MAX),C.Content)) AS reportXML
	FROM  ReportServer.dbo.Catalog C
	WHERE  C.Content is not null
	AND  C.Type = 2
	) CATDATA
CROSS APPLY reportXML.nodes('/Report/DataSets/DataSet') xmltable ( xmlcolumn )
ORDER BY CATDATA.Name

UNION

WITH XMLNAMESPACES
( DEFAULT 
  'http://schemas.microsoft.com/sqlserver/reporting/2008/01/reportdefinition'
, 'http://schemas.microsoft.com/SQLServer/reporting/reportdesigner' AS ReportDefinition )
SELECT  
CATDATA.ItemID AS ReportId
,CATDATA.Name AS ReportName
,CATDATA.Path AS ReportPathLocation
,xmlcolumn.value('(@Name)[1]', 'VARCHAR(250)') AS DataSetName  
,xmlcolumn.value('(Query/DataSourceName)[1]','VARCHAR(250)') AS DataSoureName 
,xmlcolumn.value('(Query/CommandText)[1]','VARCHAR(2500)') AS CommandText
FROM (  
	SELECT C.ItemId, C.Name
	,c.Path
	,CONVERT(XML,CONVERT(VARBINARY(MAX),C.Content)) AS reportXML
	FROM  ReportServer.dbo.Catalog C
	WHERE  C.Content is not null
	AND  C.Type = 2
	) CATDATA
CROSS APPLY reportXML.nodes('/Report/DataSets/DataSet') xmltable ( xmlcolumn )
ORDER BY CATDATA.Name