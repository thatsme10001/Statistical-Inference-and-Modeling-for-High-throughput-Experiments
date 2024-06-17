RNGkind("Mersenne-Twister", "Inversion", "Rejection")



set.seed(3)
ctrl <- rnorm(100, 8, 2)

set.seed(4)
pvals <- replicate(30000, {
  expt <- rnorm(10, 8, 2)
  t.test(ctrl, expt)$p.value
})

num_below_0.05 <- sum(pvals < 0.05)
num_below_0.05
