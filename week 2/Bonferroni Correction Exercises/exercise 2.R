# Set the seed for reproducibility
set.seed(1)

# Number of tests
m <- 8793

# Number of simulations
n_simulations <- 10000

# Bonferroni correction alpha level
alpha <- 0.05
bonferroni_cutoff <- alpha / m

# Initialize a vector to store results of the simulations
fwer_results <- numeric(n_simulations)

# Run the simulations
for (i in 1:n_simulations) {
  # Generate p-values from a uniform distribution
  pvals <- runif(m, 0, 1)
  
  # Check if any p-value is below the Bonferroni cutoff
  fwer_results[i] <- any(pvals < bonferroni_cutoff)
}

# Estimate the FWER
fwer_estimate <- mean(fwer_results)

# Print the FWER estimate
cat("Monte Carlo estimate of FWER for Bonferroni:", fwer_estimate, "\n")


"""
Setting the Seed:

set.seed(1) ensures that the random number generation is reproducible.
Defining Variables:

m <- 8793: Defines the number of tests.
n_simulations <- 10000: Sets the number of Monte Carlo simulations.
alpha <- 0.05: The significance level for the tests.
bonferroni_cutoff <- alpha / m: Calculates the Bonferroni correction cutoff.
Simulations:

A loop runs 10,000 simulations.
In each simulation, p-values are generated from a uniform distribution using runif(m, 0, 1).
any(pvals < bonferroni_cutoff) checks if any p-value in the current simulation is below the Bonferroni cutoff.
The result (TRUE or FALSE) is stored in the fwer_results vector.
Calculating FWER:

mean(fwer_results) calculates the proportion of simulations where at least one null hypothesis is incorrectly rejected, providing an estimate of the FWER.
"""
