RNGkind("Mersenne-Twister", "Inversion", "Rejection")



set.seed(3)
ctrl <- rnorm(100, 8, 2)

set.seed(51)
pvals_30 <- replicate(30, {
  cases <- rnorm(5, 7.5, 2.5)
  controls <- rnorm(5, 7.5, 2.5)
  t.test(cases, controls)$p.value
})

proportion_more_than_3 <- mean(num_below_0.05_replicates > 3)
proportion_more_than_3


