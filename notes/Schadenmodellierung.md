## Annahme
Der Gesamtschaden $S$ lässt sich durch
$$S = \sum^N_{i = 1} Y_i$$
mit einer ganzzahligen Zufallsvariable $N$ und unabhängig, identisch verteilten Schadenshöhenverteilungen $Y_i$ beschreiben.

>[!INFO] Frage
>Wie deckt sich das mit der Realität? Zum Beispiel bei Naturkatastrophen, werden ja gehäuft (sehr hohe) Schadensmeldungen eingehen.

## Mögliche Verteilung
- Schadenanzahl
	- Poisson
	- Binomial
	- negativ Binomial
- Schadenhöhe
	- Exponentialverteilung
	- $\Gamma$-Verteilung
	- $\beta$-Verteilung
	- Pareto

## Panjer-Klasse
Eine Verteilung gehört zur Panjer-Klasse, wenn sie die folgende Rekursion erfüllt
$$p(k+1) = \left(a - \frac{b}{k+1}\right)\cdot p(i)$$
Diese Eigenschaft haben wir z.B. für die
- Poisson-Verteilung
- Binomialverteilung
- negative Binomialverteilung
gezeigt.

### Panjer-Rekusrionsformel
Seien die $Y_i$ verteilt wie oben beschrieben **mit Werten aus $\mathbb{N}$**. Außerdem gehöre die Verteilung der $N$ zur **Panjer-Klasse** mit Parametern $a$, $b$. Dann gilt für $p_n = P\{N=n\}$, $g_k = P\{S=k\}$, $p_0=g_0$  und $k\geq 1$
$$g_k = \sum_{t=1}^{k}\left(a - \frac{bt}{n}\right)P\{Y_1 = t\}g_{k-t}$$

## Modellierung des Schadens in kontinuierlicher Zeit
- Idee: 
	- Zwischenankunftszeiten $w_1, \dots, w_n$, d.h. Zeiten zwischen zwei Schadensmedlungen i.i.d.
	- für $N(t)$ zähle Ankünfte bis zum Zeitpunkt $t$, d.h $N(t) := |\{n\in\mathbb{N} | T_n \leq t\}|$ 
- Der **Gesamtschaden** bis zum Zeitpunkt $t \geq 0$ ist gegeben durch
  $$S(t) = \sum_{j=1}^{N(t)} Y_j$$
  - Zwischenankunftszeiten verteilt gemäß $\mathop{Exp}(\lambda)$ $\to$ **homogener** Poisson-Prozess
  - Allgemein: Zusammengesetzer Poisson-Prozess