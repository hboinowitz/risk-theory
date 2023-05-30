- Zentale Frage: Prämienaufteilung

## Idee
- Erstversicherer muss nicht den gesamten Schaden übernehmen, sondern nur den Anteil $S^I$  $\to$ auch kleinere Versicherungen können Produkte anbieten, die potentiell sehr Hohe Versicherungssummen nach sich ziehen können
- Rückversicherer übernimmt den Rest $S^R$
- Der Erst- und Rückerversicherer teilen sich entsprechend ihres Versicherungsrisikos die Prämie auf (Exposure Rating)
- $S = S^I + S^R$ 

## Varianten der Rückerversicherung
- Rückversicherung kann auf
	- Einzelschadenbasis
	- Gesamtschadenbasis
	erfolgen

## Modelle für Rückversicherung
### Quota/Proportionale Rückerversicherung
Rückversicherer übernimmt einen fixen Anteil der auftretenden Schäden 

### Excess of Loss
Rückversicherer deckelt die Einzelschäden $\to$ übernimmt die Schäden oberhalb einer Schranke $M$.
#### Prämienaufteilung
- Verdünnung bei Binomial und Poisson-Verteilung
- $\mathbb{E}S^I = \left(1- \left(\frac{\beta}{\beta + M}\right)^{\alpha - 1}\right)$ bei $\mathop{Pareto}(\alpha, \beta)$
- Allgemein $P\{Y_i \leq M \}$ für gegebene Verteilung

### Stop Loss
Rückversicherer deckelt den Gesamtschaden $\to$ übernimmt den Schaden oberhalb einer Schranke $M$

### Largest Claims Reinsurance
Schranke $M$ wird basierend auf den aufgetretenen Schäden bestimmt (z.B. die größten $k$ Schäden)
- COSIMA
- ECOMOR