n <- 500
samples <- rcauchy(n, location = 10)
sorted_samples <- sort(samples, decreasing = T)
k_ <- (1:150)

hill <- \(k) 1/k * sum(
  map_dbl((1:k), 
          ~ log(sorted_samples[.]) - log(sorted_samples[k])
          )
  )
plot(k_, map(k_, hill))
