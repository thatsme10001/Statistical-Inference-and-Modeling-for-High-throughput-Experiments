RNGkind("Mersenne-Twister", "Inversion", "Rejection")



set.seed(3)
ctrl <- rnorm(100, 8, 2)

set.seed(4)
pvals <- replicate(30000, {
  expt <- rnorm(10, 8, 2)
  t.test(ctrl, expt)$p.value
})

# Adjust the margins and plot the histogram
par(mar=c(5, 4, 4, 2) + 0.1)
hist(pvals, main="Histogram of p-values", xlab="p-value", breaks=50)
