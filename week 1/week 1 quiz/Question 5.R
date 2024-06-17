RNGkind("Mersenne-Twister", "Inversion", "Rejection")



set.seed(3)
ctrl <- rnorm(100, 8, 2)

set.seed(4)
pvals <- replicate(30000, {
  expt <- rnorm(10, 8, 2)
  t.test(ctrl, expt)$p.value
})


set.seed(28)
cases <- rnorm(5, 7.5, 2.5)
controls <- rnorm(5, 7.5, 2.5)
p_value_single <- t.test(cases, controls)$p.value
p_value_single

