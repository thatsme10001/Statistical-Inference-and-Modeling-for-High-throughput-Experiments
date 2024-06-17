RNGkind("Mersenne-Twister", "Inversion", "Rejection")

# console - install.packages("downloader")
set.seed(1)
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- "femaleControlsPopulation.csv"
if (!file.exists(filename)) download(url, destfile = filename)
population <- read.csv(filename)

pvals <- replicate(1000, {
  control <- sample(population[,1], 12)
  treatment <- sample(population[,1], 12)
  t.test(treatment, control)$p.value
})

proportion_reject_null <- mean(num_below_0.05_list > 0)
proportion_reject_null




