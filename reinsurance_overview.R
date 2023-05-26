library(distributionsrd)
library(tidyverse)
lambda <- 80
t <- 40
N <- rpois(t, lambda)
print(N)
alpha <- 2.5
beta <- 40000

# Verteilungsparameter
mean_ <- alpha * beta / (alpha - 1)
sd_ <- beta / (alpha - 1) * sqrt(alpha / (alpha - 2))

# t Tage mit Pareto-verteilten Schäden
daily_costs_both <- c()
costs_per_day <- list()

for (day in (1:t)) {
  costs <- rpareto(N[day], alpha, beta)
  daily_costs <- sum(costs)
  daily_costs_both <- c(daily_costs_both, daily_costs)
  costs_per_day <- append(costs_per_day, list(costs))
}

# Quota-Rückversicherung
ratio <- 0.05
daily_costs_reinsurance_quota <- c()

for (day in (1:t)) {
  costs <- costs_per_day[[day]]
  costs_reinsurrance_quota <- sum(costs) * ratio
  daily_costs_reinsurance_quota <- c(daily_costs_reinsurance_quota, costs_reinsurrance_quota)
}

# XL-Rückversicherung
M <- 120000
daily_costs_reinsurance_xl <- c()
cases_reinsurance_xl <- c()

for (day in (1:t)) {
  costs <- costs_per_day[[day]]
  costs_reinsurrance_xl <- sum(mapply(\(x) max(x - M, 0), costs))
  N_reinsurrance_xl <- sum(as.integer(costs > M))
  cases_reinsurance_xl <-
    c(cases_reinsurance_xl, N_reinsurrance_xl)
  daily_costs_reinsurance_xl <- c(daily_costs_reinsurance_xl, costs_reinsurrance_xl)
}

# Stop-Loss
cap_stop_loss <- 30e6
total_costs <- sum(daily_costs_both)
total_costs_reinsurance_stop_loss <-
  max(total_costs - cap_stop_loss, 0)

# Largest-Claims
ranking_of_costs <- sort(Reduce(c, costs_per_day), decreasing = T)

# COSIMA
k <- 140
cap_cosima <- sum(ranking_of_costs[1:k])
total_costs_reinsurance_cosima <- total_costs - cap_cosima

# ECOMOR
M_ecomor <- ranking_of_costs[k]
daily_costs_reinsurance_ecomor <- c()
cases_reinsurance_ecomor <- c()

for (day in (1:t)) {
  costs <- costs_per_day[[day]]
  costs_reinsurrance_ecomor <-
    sum(mapply(\(x) max(x - M_ecomor, 0), costs))
  N_reinsurrance_ecomor <- sum(as.integer(costs > M_ecomor))
  cases_reinsurance_ecomor <-
    c(cases_reinsurance_ecomor, N_reinsurrance_ecomor)
  daily_costs_reinsurance_ecomor <- c(daily_costs_reinsurance_ecomor, costs_reinsurrance_ecomor)
}

daily_costs_all_types <- list(
  daily_costs_reinsurance_ecomor,
  daily_costs_reinsurance_quota,
  daily_costs_reinsurance_xl
)

cumulated_costs <- mapply(cumsum, daily_costs_all_types)
daily_costs_plot <- mapply(cbind, daily_costs_all_types)
matplot(
  cumulated_costs,
  type = c("b"),
  pch = 1,
  col = 1:3,
  xlab = "t [d]",
  ylab = "Costs RI [€]"
)
legend(
  "topleft",
  legend = c("ECOMOR", "Quota", "XL"),
  col = 1:4,
  pch = 1
) # optional legend

matplot(
  daily_costs_plot,
  type = c("b"),
  pch = 1,
  col = 1:3,
  xlab = "t [d]",
  ylab = "Costs RI [€]"
)
legend(
  "topleft",
  legend = c("ECOMOR", "Quota", "XL"),
  col = 1:4,
  pch = 1
) # optional legend

hist(daily_costs_both, xlab = "Costs [€]", 
     main = "Distribution of Daily Accident Costs")
hist(ranking_of_costs, xlab = "Costs [€]", 
     main = "Distribution of single Accident Costs")

# Zusammenfassung des Exposures für Erst- und Rückversicherer
costs_per_reinusrance_type <- data.frame(
  costs_reinsurer = matrix(mapply(sum, daily_costs_all_types))
  )
rownames(costs_per_reinusrance_type) <- c("ECOMOR", "Quota", "XL")
costs_per_reinusrance_type <- costs_per_reinusrance_type %>% 
  mutate(percentage = costs_reinsurer/total_costs)
