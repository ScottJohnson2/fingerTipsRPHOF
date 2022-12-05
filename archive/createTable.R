if(!require('tidyverse')) install.packages('tidyverse')
if(!require('gt')) install.packages('gt')
if(!require('paletteer')) install.packages('paletteer')
if(!require('gtExtras')) install.packages('gtExtras')

#https://www.ardata.fr/en/flextable-gallery/2022-06-29-clinical-shift-table/
#https://themockup.blog/posts/2020-09-04-10-table-rules-in-r/


tenWorst <- worseDF %>%
              filter(AreaName == 'Barrow-in-Furness') %>%
              slice(1:10) %>%
              select(IndicatorName)



tenWorst$IndicatorIDShort <- substr(tenWorst$IndicatorName,1,3)


tenWorst$IndicatorNameSub <- sub('.*?-','',tenWorst$IndicatorName)

tenWorst$IndicatorNameSub <- gsub("\\s*\\([^\\)]+\\)","",as.character(tenWorst$IndicatorNameSub))


barrowData <- worseDF %>%
                  filter(AreaName == 'Barrow-in-Furness')


barrowData$IndicatorIDShort <- substr(barrowData$IndicatorName,1,3)



fullTb <- left_join(tenWorst, barrowData, by = 'IndicatorIDShort')

fullTb <- fullTb %>%
                select(IndicatorNameSub, Sex, Age, combinedRank)


#formattable(fullTb) 

fullTb$IndicatorNameSub <- trimws(fullTb$IndicatorNameSub, which = 'both', whitespace = ' ')


fullTb %>% 
            group_by(IndicatorNameSub) %>%
            gt(rowname_col = 'Age') %>%
            gt_theme_538() %>%
            tab_stubhead(label = 'Indicator Group') %>%
            tab_source_note(md('**data**: PHE Fingertips Publich Health Outcomes Framework')) %>%
                    data_color(
                columns = combinedRank,
                colors = scales::col_numeric(
                  paletteer::paletteer_d(
                    palette = "ggsci::red_material") %>% as.character(),
                  domain = NULL,
                  reverse = TRUE
                )
              )
            
