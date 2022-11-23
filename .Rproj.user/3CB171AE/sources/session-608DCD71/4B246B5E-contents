
if(!require('devtools')) install.packages('devtools')
if(!require('tidyverse')) install.packages('tidyverse')
if(!require('data.table')) install.packages('data.table')
if(!require('DBI')) install.packages('DBI')
if(!require('odbc')) install.packages('odbc')
if(!require('writexl')) install.packages('writexl')


devtools::install_github("PublicHealthEngland/fingertipsR")

if(!require('fingertipsR')) install.packages('fingertipsR')
#https://www.rdocumentation.org/packages/fingertipsR/versions/0.1.1

SQLconnection <-dbConnect(odbc(),
                   Driver="SQL Server",
                   Server="MLCSU-BI-SQL",
                   Database="AnalystGlobal",
                   Trusted_Connection="True")

districtsSQLQuery <- read_file('SQLQueries/SQL_districtCodes.sql')


listOfDistricts <-dbGetQuery(SQLconnection,
                             districtsSQLQuery)%>%as_tibble()



profiles <- profiles(ProfileName = "Public Health Outcomes Framework")

profile <- unique(profiles$ProfileID)



for (i in listOfDistricts$LA_UA_Code2){
 data <- fingertips_data(AreaTypeID = 101 ,AreaCode = i, 
                ProfileID = profile, rank = TRUE) 
 
data <- unite(data, col = 'refColumn', c('IndicatorID','AreaCode','AreaType','Sex','Age','Category'),sep = '|', remove = FALSE)

data <- transform(data, ID = as.numeric(factor(refColumn)))

latestValues <- data %>% group_by(ID) %>% summarise(Timeperiod = max(Timeperiod))


latestData <- inner_join(data, latestValues, by = c('ID','Timeperiod'))


latestData <- latestData %>% mutate(combinedRank = case_when(Polarity == 'RAG - Low is good' ~ (AreaValuesCount + 1) - Rank, 
                                                    TRUE ~ Rank))

worseData <- latestData %>% filter(ComparedtoEnglandvalueorpercentiles == 'Worse' | ComparedtoRegionvalueorpercentiles == 'Worse')

worseData <- worseData %>% arrange(combinedRank)

betterData <- latestData %>% filter(ComparedtoEnglandvalueorpercentiles == 'Better' | ComparedtoRegionvalueorpercentiles == 'Better')

betterData <- betterData %>% arrange(combinedRank)

excelName <- str_replace_all(paste('excelOutputs/',unique(data$AreaName),'PHOF.xlsx'),' ','_')

write_xlsx(list(WorseIndicators = worseData, BetterIndicators = betterData), excelName)
}

















#data <- fingertips_data(AreaTypeID = 101 ,AreaCode = 'E07000027', 
 #                       ProfileID = 19, rank = TRUE)



