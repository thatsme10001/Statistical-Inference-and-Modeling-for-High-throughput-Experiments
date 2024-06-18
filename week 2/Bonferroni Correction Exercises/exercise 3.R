# Setting the seed for reproducibility
set.seed(1)

# Number of tests
m <- 8793

# Number of simulations
n_simulations <- 10000

# Bonferroni correction alpha level
alpha <- 0.05
bonferroni_cutoff <- alpha / m

# Generate p-values and check how many are below the cutoff for Bonferroni
fwer_bonferroni <- replicate(n_simulations, {
  pvals <- runif(m, 0, 1)
  sum(pvals < bonferroni_cutoff) > 0
})

# Estimate FWER for Bonferroni
fwer_bonferroni_estimate <- mean(fwer_bonferroni)

# Sidak correction alpha level
sidak_cutoff <- 1 - (1 - alpha)^(1 / m)

# Generate p-values and check how many are below the cutoff for Sidak
fwer_sidak <- replicate(n_simulations, {
  pvals <- runif(m, 0, 1)
  sum(pvals < sidak_cutoff) > 0
})

# Estimate FWER for Sidak
fwer_sidak_estimate <- mean(fwer_sidak)

# Plotting Bonferroni and Sidak cutoffs for various m
alphas <- seq(0, 0.25, 0.01)
m_values <- seq(2, 1000, 50)
bonferroni_alpha <- sapply(m_values, function(m) alphas / m)
sidak_alpha <- sapply(m_values, function(m) 1 - (1 - alphas)^(1 / m))

# Plotting the results
plot(m_values, bonferroni_alpha[1,], type = "l", col = "red", ylab = "Alpha cutoff", xlab = "Number of tests (m)", ylim = c(0, 0.05))
lines(m_values, sidak_alpha[1,], col = "blue")
legend("topright", legend = c("Bonferroni", "Sidak"), col = c("red", "blue"), lty = 1)

# Print the FWER estimates
cat("Monte Carlo estimate of FWER for Bonferroni:", fwer_bonferroni_estimate, "\n")
cat("Monte Carlo estimate of FWER for Sidak:", fwer_sidak_estimate, "\n")



