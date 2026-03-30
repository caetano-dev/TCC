**1. Weber, M., et al. (2019). "Anti-Money Laundering in Bitcoin: Experimenting with Graph Convolutional Networks for Financial Forensics."**
* **The Gap:** The manuscript discusses graph-based AML detection but omits the paper that introduced the Elliptic Data Set, the most widely recognized empirical benchmark in this niche. 
* **Integration:** Contrast the use of the synthetic AMLworld dataset against Elliptic to academically justify the dataset choice in Section 2.1.

**2. Milo, R., et al. (2002). "Network motifs: simple building blocks of complex networks." *Science*.**
* **The Gap:** Section 2.3.3 extracts topological motifs (scatter-gather, fan-in, fan-out), but lacks the seminal citation that originally defined network motifs in complex systems.
* **Integration:** Anchor the mathematical definition of motifs using this paper before applying the concept to specific financial typologies.

**3. Rossi, E., et al. (2020). "Temporal Graph Networks for Deep Learning on Dynamic Graphs."**
* **The Gap:** Section 1.2.1 defines "Grafos Temporais" and sliding windows to prevent look-ahead bias. Current citations (e.g., Sizan et al.) are applied AML papers, not the foundational theoretical literature on dynamic graphs.
* **Integration:** Provide rigorous theoretical grounding for the discrete-time dynamic graph (snapshot) aggregation paradigm.

**4. Chawla, N. V., et al. (2002). "SMOTE: Synthetic Minority Over-sampling Technique."**
* **The Gap:** The implementation utilizes a custom density-based hard-negative mining algorithm via `MiniBatchKMeans` for Stage 1 class balancing, but does not contrast this against the industry standard for extreme imbalance.
* **Integration:** Represent the strongest alternative argument. Explain empirically why clustering-based undersampling maps the fraud decision boundary more effectively than interpolating synthetic minority samples.

**5. "Enhancing Fraud Detection through Cascading Machine Learning Models and Clustering Techniques" (2024).**
* **The Gap:** The Two-Stage Cascade (Funneling) architecture in Section 2.4.2 lacks recent empirical backing for the specific combination of clustering (hard-negatives) and sequential classification.
* **Integration:** Validate the pipeline design. Demonstrate that sequentially cascading models adapted to clustered patterns is an established consensus for optimizing the recall-precision tradeoff in financial fraud.
