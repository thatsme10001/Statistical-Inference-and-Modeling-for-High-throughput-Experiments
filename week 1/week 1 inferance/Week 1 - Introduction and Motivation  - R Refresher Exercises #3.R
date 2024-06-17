#install.packages("devtools") 

library(devtools)
install_github("genomicsclass/GSE5859Subset")

library(GSE5859Subset)
data(GSE5859Subset) ##this loads the three tables

  # Load the data
data(GSE5859Subset)

symbol <- which(geneAnnotation$SYMBOL=="ARPC1A")
date <- which(sampleInfo$date=="2005-06-10")
geneExpression[symbol, date]
  
