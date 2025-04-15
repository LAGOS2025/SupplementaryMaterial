# On the Wind Farm Cable Routing Problem Optimization via Path-Relinking Metaheuristic 

This repository contains the implementation and experimental results for the paper:  

> **"On the Wind Farm Cable Routing Problem Optimization via Path-Relinking Metaheuristic**  
> *Submitted to the XIII Latin and American Algorithms, Graphs and Optimization Symposium (LAGOS 2025)*  

## 📄 Abstract  

The Wind Farm Cable Routing Problem (WFCRP) is an NP-hard graph-based optimization problem that models the electrical con- nection of turbines and substations in wind farms. The goal is to transfer energy from the turbines to substations through electrical cables, minimizing the connection cost. Previous works have proposed different approaches for the WFCRP, but a path-relinking metaheuristic does not exist to solve this problem. Because path-relinking has proven suitable for developing hybrid metaheuristics, this paper investigates its application to solve the WFCRP. We implemented six different path-relinking approaches and compared them with state-of-the-art algorithms. Experiments comprised 200 real-world wind farms with different difficulty levels and up to 120 turbines. Statistical tests analyzed solution quality and processing time.

## 📂 Repository Structure  
```
.
├── /Code/               # Source code (C/C++)
├── /results/            # Raw experimental and processed results
```
The table directory contains 7 files showing the following tables.

• Parameters for instance generation : Table indicating the characteristics of each instance used. For more details, see - A hybrid multi-agent
metaheuristic for the offshore wind farm cable routing problem, Expert Systems with Applications.

• Best found Solution and GAP: Table showing the raw value of the best solution obtained for each instance and the average distance that each
algorithm obtained.

• Mean results concerning the solution quality : Table showing the average solution obtained by each algorithm.

• Median results concerning the solution quality: Table showing the median solution obtained by each algorithm.

• Standard deviation results concerning the solution quality: Table showing the standard deviation obtained for each algorithm.

• Number of executions produced the best-found solution: Table showing the number of executions in which each algorithm found the best
solution.

• Results from the Kruskal-Wallis statistical test (P-values): Table showing p-values with the Kruskal-Wallis nonparametric statistical test.

The code directory contains the code that implements the Path Relinking algorithm applied to the problem of cable routing in wind farms. 
This code  only requires toobox to handle graphs and allows a dynamic visualization of the exchange of edges that occurred, as shown in the image Figure.png.
To run the code, simply press F5 in the main.m script. 17 instances were generated to be made available to the reader, however we cannot send the
instances used in the article. To obtain them, it is necessary to request them from D. Cazzaro, M. Fischetti, M. Fischetti.

---
