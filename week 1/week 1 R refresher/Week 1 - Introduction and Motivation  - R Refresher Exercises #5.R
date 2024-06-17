#install.packages("devtools") 

library(devtools)
install_github("genomicsclass/GSE5859Subset")

library(GSE5859Subset)
data(GSE5859Subset) ##this loads the three tables

  # Load the data
data(GSE5859Subset)

# Compute the median of each column
column_medians <- apply(geneExpression, 2, median)

# Compute the median of these medians
median(column_medians)

  
