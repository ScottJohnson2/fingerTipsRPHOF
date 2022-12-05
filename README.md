
# fingerTipsRPHOF
 r Project to import data from Fingertips for each of L&SC districts


Running steps:

Open R project fingerTipsRPHOF.Rproj
run full script which separately runs:
	rScripts\fingerTipsR - script to pull through data from the Publich Health Outcomes Framework	for the districts listed (to change districts alter the SQL script SQLQueries\SQL_districtCodes.sql)
	rScripts\createWorseTableDoc - script to create formatted tables of all indicators in which the districts perform statistically worse than national or regional comparators. Word documents writeen to folder wordOutputs\worseTables
	rScripts\createBetterTableDoc - script to create formatted tables of all indicators in which the districts perform statistically better than national or regional comparators. Word documents writeen to folder wordOutputs\betterTables



