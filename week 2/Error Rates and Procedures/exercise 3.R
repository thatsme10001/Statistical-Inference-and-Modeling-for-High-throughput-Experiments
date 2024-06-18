# Desired overall significance level


alpha <- 0.05

# Number of tests
n_tests <- 8793

# Sidak correction
alpha_prime <- 1 - (1 - alpha)^(1/n_tests)
alpha_prime
