# Number of tests
n_tests <- 8793

# Probability of not rejecting a null hypothesis in one test
p_not_reject <- 0.95

# Probability of not rejecting any null hypotheses
prob_not_reject_any <- p_not_reject^n_tests

# Probability of incorrectly rejecting at least one null hypothesis
prob_reject_at_least_one <- 1 - prob_not_reject_any
prob_reject_at_least_one
