### Beispiele für Risikomaße
Gegeben: Verlust-ZV $V$
- $\mathop{Var}(V)$ bzw. $\sqrt{\mathop{Var}(V)}$
- Value-at-Risk: $$\mathit{VaR}_{1-\varepsilon}(V) := F_V^{-1}(1-\varepsilon)$$
- Expected Shortfall *oder* Conditional Value-at-Risk:  $$\mathit{CVaR}_{1-\varepsilon}(V) := \mathbb{E}\left[V \vert V \geq \mathit{VaR}_{1-\varepsilon}(V)\right]$$
### Kohärenz
**Vier Eigenschaften** müssen für die Kohärenz erfüllt sein
1. $R(V + a) = R(V) + a$
2. $R(\lambda V) = \lambda \cdot R(V)$
3. $V_1 \succeq V_2 \Rightarrow R(V_1) \geq R(V_2)$
4. $R(V_1 + V_2) \leq R(V_1) + R(V_2)$

Der $\mathit{VaR}$ erfüllt lediglich die ersten 3 Eigenschaften, nicht die vierte.

### Zusammenhänge zwischen $\mathit{VaR}$ und $\mathit{CVaR}$
- Allgemein$$\mathit{CVaR}_{1-\varepsilon}(V) := \mathit{VaR}_{1-\varepsilon}(V) + \mathbb{E}\left[V -  \mathit{VaR}_{1-\varepsilon}(V) \vert V \geq \mathit{VaR}_{1-\varepsilon}(V)\right]$$
- Falls $\mathcal{D}(V)$ eine Riemann-Dichte besitzt gilt:   $$\mathit{CVaR}_{1-\varepsilon}(V) = \frac{1}{\varepsilon}\int_0^\varepsilon Var_{1-t}(V)\,\mathrm{d}t$$
  ### Subadditivität des $\mathit{CVaR}$
  Für den $\mathit{CVaR}$ ist das Kohärenz-Kriterium (K4) erfüllt.
  Beweis über zwei Hilfsaussagen.