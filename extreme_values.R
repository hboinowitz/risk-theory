library(latex2exp)
n <- 10000
rounds <- 1000
x_ <- seq(-1, 2, by=.1)
y <- purrr::map_dbl(
  x_,
  \(x) mean(purrr::map_lgl((1:rounds), ~ max(rexp(n)) <= x + log(n)))
)

par("mar"=c(5, 6, 2, 2))
plot(x_, y, xlab = "x", ann = F)
lines(x_, purrr::map(x_, ~ exp(-exp(-.))))
mtext(TeX(r"($P\left(M_n \leq \frac{x + log(n)}{\lambda}\right)$)"), side = 2, line = 2,
      cex = 1)
mtext(TeX(r"($x$)"), side = 1, line = 2,
      cex = 1)

n_ <- (1:5000)
rounds <- 10
x <- list()
all_maxima <- list()
for (n in n_) {
  maxima <- purrr::map_dbl((1:rounds), ~ max(rnorm(n)))  
  all_maxima <- append(all_maxima, mean(maxima))
}

b_n <- function(n) {
  sqrt(2 * log(n)) - (log(log(n)) + log(4 * pi)) / (2 * sqrt(2 * log(n)))
}

plot(n_, all_maxima)
lines(n_, 
      purrr::map_dbl(n_, b_n), 
      col = "red"
)

eps <- 0.5
n <- 1000
sample <- rnorm(n, 80)
sort(sample)[[n * eps]]
qnorm(eps, 80)
