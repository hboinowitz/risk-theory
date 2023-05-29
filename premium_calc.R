library(distributionsrd)
library(latex2exp)
exp_num_claims <- 100
expected_damage <- 50
t <- 50
num_claims <- rpois(t, 100)
print(num_claims)
p <- exp_num_claims * expected_damage


exceed_expected <- c()
collected_sum_of_claims <- c()
for (j in (1:500)) {
  all_claims <- mapply(\(x) rexp(x, 1 / expected_damage), num_claims)
  sum_of_claims <- sum(Reduce(c, all_claims))
  exceed_expected <- c(
    exceed_expected,
    ifelse(
      sum_of_claims > t * p,
      "nicht gedeckt",
      "gedeckt"
    )
  )
  collected_sum_of_claims <- c(collected_sum_of_claims, sum_of_claims)
}

barplot(prop.table(table(exceed_expected)),
        main = "Deckung der Schäden durch Erwartungswert")

daily_claims <- mapply(sum, all_claims)
plot((1:t), cumsum(daily_claims), t = "s", main="Vermögensprozess", xlab="t",
     ylab="Schadenhöhe")
lines((1:t), p * (1:t), t = "s", col = "red")

expected_sum_of_claims <- t * exp_num_claims * expected_damage
bins <- hist(collected_sum_of_claims / expected_sum_of_claims)
bins$counts <- cumsum(bins$density)
plot(bins, ylab = "Anteil abgedeckt", xlab=TeX(r"($\sum_{j} S_j / (E \sum_{j} S_j)$)"),
     main="Anteil abgedeckter Schäden in Abhängigkeit von der Safety")                              
     