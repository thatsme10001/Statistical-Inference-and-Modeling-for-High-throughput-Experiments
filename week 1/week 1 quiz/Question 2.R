RNGkind("Mersenne-Twister", "Inversion", "Rejection")



set.seed(3)
ctrl <- rnorm(100, 8, 2)

set.seed(4)
pvals <- replicate(30000, {
  expt <- rnorm(10, 8, 2)
  t.test(ctrl, expt)$p.value
})

proportion_below_0.05 <- mean(pvals < 0.05)
proportion_below_0.05
