RNGkind("Mersenne-Twister", "Inversion", "Rejection")



set.seed(3)
ctrl <- rnorm(100, 8, 2)

set.seed(100)
num_below_0.05_replicates <- replicate(1000, {
  pvals_30 <- replicate(30, {
    cases <- rnorm(5, 7.5, 2.5)
    controls <- rnorm(5, 7.5, 2.5)
    t.test(cases, controls)$p.value
  })
  sum(pvals_30 < 0.05)
})

average_num_below_0.05 <- mean(num_below_0.05_replicates)
average_num_below_0.05


