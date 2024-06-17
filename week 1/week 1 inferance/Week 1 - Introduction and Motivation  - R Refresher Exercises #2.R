#install.packages("devtools") 

library(devtools)
install_github("genomicsclass/GSE5859Subset")

library(GSE5859Subset)
data(GSE5859Subset) ##this loads the three tables

  # Load the data
data(GSE5859Subset)

# Explore the geneAnnotation data frame
head(geneAnnotation)

# Remove features with NA in the chromosome column and count genes on chromosome Y
sum(!is.na(geneAnnotation$CHR) & geneAnnotation$CHR == "chrY")

  
