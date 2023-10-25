### Erneuerungsmodell
$$S(t) = \sum_{i=1}^{N(t)} Y_i, \quad t\geq 0$$
### Cramér - Lundberg
In dem oben genannten Erneuerungsmodell wird angenommen, dass $w_i \sim \mathop{Exp}(\lambda)$ mit $\lambda > 0$ $\to$ $N(t) \sim \mathop{Poi}(\lambda \cdot t), \quad t \geq 0$  mit Intensitätsparameter $\lambda$.

### Risikoprozess
$$U(t) = u + p(t) - S(t)$$
mit Prämieneinnahmen $p(t)$ und **Startkapital** $u$ 
**Annahme**:
Häufig wird eine regelmäßige (z.B. monatliche Prämienzahlung) angenommen, d.h. $p(t) = c \cdot t$

**Beobachtung:**
In diesem Modell kann Ruin nur zu den diskreten Schadenszeitpunkten $t = T_n$ eintreten.

#### Technischer Ruin
Wenn $U(t) < 0$ für ein $t\geq 0$, d.h. $\inf_{t \geq 0} U(t) < 0$, spricht man von technischem Ruin.
Dies ist gleichbedeutend mit 
$$\sup_{n\in\mathbb{N}} \left( \sum_{i = 1}^n Y_i - c\cdot W_i \right) > u$$
### Net Profit Condition
Eine Ruinwahrscheinlichkeit $< 1$ tritt nur ein, wenn die *net profit condition* erfüllt ist, also gerade dann, wenn
$$\mathbb{E}Y_1 - c\cdot\mathbb{E}W_1 < 0$$Die *net profit condition* für das Cramér-Lundberg-Modell lautet
$$\mu - \frac{c}{\lambda} < 0$$
Wenn im **Cramér-Lundberg-Modell** die [[Prämienkalkulation|Prämie]] nach dem **E-Wert-Prinzip** berechnet wird, ist die **NPC stets erfüllt**.
### Lundberg-Koeffizient
Die eindeutige, strikt positive Lösung $\nu$ der Gleichung
$$m_{Z_1}(h) = \mathbb{E}e^{h(Y_1 - c\cdot W_1)}$$
wird Lundberg-Koeffizient genannt.
**Voraussetzungen:**
- NPC erfüllt
- $m_{Z_1}$ existiert in einer Umgebung $(-h_0, h_0)$ für $h_0 > 0$

### Lundberg-Ungleichung
Wenn der Lundberg-Koeffizient $\nu$ existiert, dann gilt für jedes $u > 0$
$$\psi(u) \leq e^{-\nu \cdot u}$$