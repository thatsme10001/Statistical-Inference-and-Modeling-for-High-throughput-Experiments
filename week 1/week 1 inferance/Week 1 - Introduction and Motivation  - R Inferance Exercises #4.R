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

set.seed(100)
num_below_0.05_list <- replicate(1000, {
  pvals_20 <- replicate(20, {
    cases <- rnorm(10, 30, 2)
    controls <- rnorm(10, 30, 2)
    t.test(cases, controls)$p.value
  })
  sum(pvals_20 < 0.05)
})

average_num_below_0.05 <- mean(num_below_0.05_list)
average_num_below_0.05



