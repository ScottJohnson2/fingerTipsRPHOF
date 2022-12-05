#library(officer)
#library(magrittr)

combinedDoc <- read_docx(wordBetterTitle)


combinedDoc <- body_add_break(combinedDoc)
combinedDoc <- body_add_docx(combinedDoc, src = wordWorseTitle)

combinedWordTable <- str_replace_all(wordBetterTitle,'better','combined')

print(combinedDoc, target = combinedWordTable)

