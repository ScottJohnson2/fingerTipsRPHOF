SELECT DISTINCT 
	   [LA_UA_Code2]
      ,[LA_UA_Name]
FROM [UK_Health_Dimensions].[ODS].[Local_Authorities_Unitary_Authorities_UK_v1_SCD]
WHERE [LA_UA_Name] IN 
				('Barrow-in-Furness'
				,'Blackburn with Darwen'
				,'Blackpool'
				,'Burnley'
				,'Chorley'
				,'Fylde'
				,'Hyndburn'
				,'Lancaster'
				,'Pendle'
				,'Preston'
				,'Ribble Valley'
				,'Rossendale'
				,'South Lakeland'
				,'South Ribble'
				,'West Lancashire'
				,'Wyre')