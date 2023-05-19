library(scales)
library(magrittr)

# Plot the situation
x <- (1:20)
y <- cumsum(rpois(x, 2))
plot(x, y, type = "s", xlab = "days", ylab = "num accidents")

# Probability that we have to wait for more than 1 day
1 - pexp(1, rate = 2)
1 - pgamma(1, shape = 1, rate = 2) # Alternatively

# Probability that the 4-th accident has not occured after 3 days
1 - pgamma(3, shape = 4, rate = 2)

# Using the definition of the Poisson Process
lambda_ <- 2
ppois(0, lambda = lambda_ * 1)
ppois(3, lambda = lambda_ * 3)

# Alternatively in a for-loop
results <- c()
for (attempt in (1:1000)) {
  results %<>% c(as.integer(sum(rpois(3, 2)) < 4))
}
mean(results)

# Plot the situation for inhomogeneous Poisson-process
x <- (1:365)
y_hom <- cumsum(rpois(x, 2))
y_inhom <- cumsum(rpois(x, 2 * exp(-0.001 * x)))
plot(x,
     y_hom,
     t = "s",
     xlab = "days",
     ylab = "num accidents")
points(
  x,
  y_inhom,
  t = "s",
  xlab = "days",
  ylab = "num accidents",
  col = "blue",
)
legend(
  "right",
  c("homogeneous", "inhomogeneous"),
  col = c("black", "blue"),
  lty = c(1, 1),
  title = "Poisson Process"
)

# Define intensity function for inhomogeneous Poisson-process
lambda_t <- \(x) 2 * exp(-0.001 * x)

total <- integrate(lambda_t, 0, 365)$value
first_half <- integrate(lambda_t, 0, 365 / 2)$value
second_half <- integrate(lambda_t, 365 / 2, 365)$value
print(
  sprintf(
    "%.0f accidents, %.0f in the first and %.0f in the seond half of the year",
    total,
    first_half,
    second_half
  )
)

# Get rate by integration
rate <- integrate(lambda_t, 366, 380)$value
ppois(24, lambda = rate) - ppois(19, lambda = rate)

# Alternatively in a for-loop
results <- c()
for (attempt in (1:1000)) {
  num_accidents <- sum(rpois(14, lambda_t(366:380)))
  results %<>% c(as.integer(num_accidents %in% (20:24)))
}
mean(results)

# Histograms
X <- (1:50)
data_hist <- data.frame(
  X = X,
  P_X_inhom = dpois(X, lambda = rate),
  P_X_hom = dpois(X, lambda = 28)
)
barplot(P_X_inhom ~ X,
        data = data_hist,
        ylab = "P(X)",
        col = "lightblue")
barplot(P_X_hom ~ X,
        data = data_hist,
        add = T,
        col = alpha("grey", 0.75))
legend(
  "topright",
  c("homogeneous", "inhomogeneous"),
  fill = c(alpha("grey", 0.75), "lightblue"),
  title = "Poisson Process"
)
