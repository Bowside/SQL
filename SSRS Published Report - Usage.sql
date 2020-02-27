SELECT ISNULL(b.linkSourceID, b.ItemID) AS BaseReportId 
	  ,b.Name 
	  ,b.Path
	  ,CASE 
			WHEN  b.Path LIKE '%South Africa%'
			THEN 'South Africa' 
			WHEN  b.Path LIKE '%Rest of Africa%'
			THEN 'Rest of Africa'
			WHEN  b.Path LIKE '%Market Risk%'
			THEN 'MarketRisk'
			WHEN b.Path LIKE '%Dashboard%'
			THEN 'Ops'
		END AS 'Reporting Area'
	  ,CASE 
			WHEN  b.Path LIKE '%South Africa%' OR b.Path LIKE '%Market Risk%'
			THEN 'South Africa' 
			WHEN  b.Path LIKE '%Rest of Africa%'
			THEN CASE
					WHEN b.Path LIKE '%Angola%'
					THEN 'Angola'
					WHEN b.Path LIKE '%Botswana%'
					THEN 'Botswana'
					WHEN b.Path LIKE '%Congo%'
					THEN 'Congo'
					WHEN b.Path LIKE '%Ghana%'
					THEN 'Ghana'
					WHEN b.Path LIKE '%Kenya%'
					THEN 'Kenya'
					WHEN b.Path LIKE '%Lesotho%'
					THEN 'Lesotho'
					WHEN b.Path LIKE '%Malawi%'
					THEN 'Malawi'
					WHEN b.Path LIKE '%Mauritius%'
					THEN 'Mauritius'
					WHEN b.Path LIKE '%Mozambique%'
					THEN 'Mozambique'
					WHEN b.Path LIKE '%Namibia%'
					THEN 'Namibia'
					WHEN b.Path LIKE '%/Nigeria/%'
					THEN 'Nigeria'
					WHEN b.Path LIKE '%/Nigeria Bank/%'
					THEN 'Nigeria Bank'
					WHEN b.Path LIKE '%/Nigeria Capital/%'
					THEN 'Nigeria Capital'
					WHEN b.Path LIKE '%South Sudan%'
					THEN 'South Sudan'
					WHEN b.Path LIKE '%Swaziland%'
					THEN 'Swaziland'
					WHEN b.Path LIKE '%Tanzania%'
					THEN 'Tanzania'
					WHEN b.Path LIKE '%Uganda%'
					THEN 'Uganda'
					WHEN b.Path LIKE '%Zambia%'
					THEN 'Zambia'
					WHEN b.Path LIKE '%Zimbabwe%'
					THEN 'Zimbabwe'
				 ELSE 'Rest of Africa' 
				 END
			WHEN b.Path LIKE '%Compass%'
			THEN 'Ops Dashboard'
		END AS 'Country'
		
	  ,ISNULL([UserName], 'Not Applicable')		AS UserName
      ,ISNULL([Format], 'Not Applicable')		AS Format
      ,ISNULL([TimeStart], '1900/01/01')		AS ReportRunStartTime 
      ,ISNULL([TimeEnd], '1900/01/01')			AS ReportRunEndTime
      ,ISNULL([Status], 'Not Run')				AS ReportRunStatus
      ,1										AS ReportExecutionCount
      ,[ByteCount]
      ,[RowCount]
      ,[TimeDataRetrieval] / 1000				AS TimeDataRetrieval
      ,[TimeProcessing] / 1000					AS TimeProcessing
      ,[TimeRendering] / 1000					AS TimeRendering
  FROM [ReportServer].[dbo].[ExecutionLog] a
  
  FULL OUTER JOIN [ReportServer].[dbo].[Catalog] b
  ON a.ReportID = b.ItemID 
  
  WHERE b.Hidden <> 1
  AND b.Type IN (2,4)
  AND ISNULL([TimeStart], '1900/01/01') > '2017-01-01'