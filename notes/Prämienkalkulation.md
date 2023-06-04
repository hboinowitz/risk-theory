## Zugrundeliegender Vermögensprozess
Gegeben seien Startkapital $u$, Prämie pro Periode $p$  und Schadenzahlungen pro Periode $S_j$. Dann kann der zugrunde liegende Vermögensprozess beschrieben werden durch
$$X_n := u + p\cdot n - \sum_{j=1} S_j$$
### Grenzwerte
- $p > \mathbb{E}S_1$, dann  $X_n \to_{n\to\infty} + \infty$
- $p < \mathbb{E}S_1$, dann $X_n \to_{n\to\infty} - \infty$  
- $p =\mathbb{E}S_1$, dann $\liminf_{n\to\infty} X_n = - \limsup_{n\to\infty} X_n = + \infty$  (chaotisch)

## Prämienprinzipien
- E-Wertprinzip: $p = (1+ \vartheta)\cdot\mathbb{E}S_1$ mit der sogenannten *safety* $\vartheta$ 
- Varianz-Prinzip: $p = \mathbb{E}S_1 + \alpha\cdot\mathop{Var} S_1$, $\alpha < 0$
- Standardabweichungs-Prinzip: $p = \mathbb{E}S_1 + \beta\cdot\sigma(S_1)$
- Nullnutzen-Prinzip
- Exponentialprinzip

### Konsistenz
Ein Prämienprinzip heißt **konsistent**, wenn für eine nicht statistische Konstante $c$ gilt: $p(S +c) = p(S) + c$
$\to$ die Konstante schlägt direkt und unverändert auf die Prämie durch
#### Konsistente Prämienprinzipien
Konsistenz haben wir für alle oben genannten Prinzipien mit Ausnahme des E-Wertprinzip gezeigt

### Additivität
Seien $S_1$ und $S_2$ zwei stochatisch unabhänginge Risiken. Dann heißt ein Prämienprinzip
- **additiv**, wenn  $p(S_1 + S_2) = p(S_1) + p(S_2)$ gilt
- **subadditiv**, wenn  $p(S_1 + S_2) \leq p(S_1) + p(S_2)$ gilt
Von einem **Diversifikationseffekt** spricht man, wenn $p(S_1 + S_2) < p(S_1) + p(S_2)$

## Weitere Wichtige Defintionen
- momenterzeugende Funktion $m_X$
- Nutzenfunktion
- left/right heavy tailed distributions $\to$ Anschauung, Zusammenhang mit der Momenterzeugenden Funktion
- Tail-Funktion $\bar{F}_X(x)$ 