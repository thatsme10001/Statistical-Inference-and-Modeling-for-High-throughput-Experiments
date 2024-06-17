RNGkind("Mersenne-Twister", "Inversion", "Rejection")



set.seed(3)
ctrl <- rnorm(100, 8, 2)

set.seed(51)
pvals_30 <- replicate(30, {
  cases <- rnorm(5, 7.5, 2.5)
  controls <- rnorm(5, 7.5, 2.5)
  t.test(cases, controls)$p.value
})

hist(num_below_0.05_replicates, main="Histogram of p-value counts", xlab="Number of p-values < 0.05", breaks=20)


