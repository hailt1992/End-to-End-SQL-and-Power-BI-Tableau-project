# Global Unemployment Analysis (1991–2025)

An in-depth diagnostic of the global labor market spanning 34 years, evaluating long-term trends, gender equity gaps, and post-pandemic recovery.

---

## 📌 Project Overview
This study utilizes historical data to analyze the stabilization of global labor markets following the 2020 economic shock[cite: 2, 3]. [cite_start]By leveraging datasets provided by **Luca Lullo**, the project identifies regions with high volatility and tracks the pace of recovery across different demographics[cite: 1, 3, 4].

* **Global Coverage**: Analysis of 183 countries[cite: 6, 7].
* **Historical Average**: Global unemployment rate of 7.96%[cite: 8, 9].
* **Key Focus**: Recovery rates, gender disparities, and market instability[cite: 3, 4, 159].

---

## 📊 Key Insights & Features
* **Post-Pandemic Recovery**: Utilized complex SQL queries to calculate stabilization rates five years after the 2020 pandemic[cite: 3, 175].
  * **Top Performers**: Saint Lucia (-63.0%), Bolivia (-62.0%), and the Russian Federation (-62.0%)[cite: 177].
* **Gender Gap Analysis**: Identifies significant disparities in labor equity[cite: 4, 22].
  * **Widest Gaps**: Egypt, Djibouti, and the Syrian Arab Republic[cite: 129, 137, 138].
* **Volatility Tracking**: Highlights the 10 countries with the most frequent unemployment spikes and drops, led by **Myanmar**, **Belarus**, and **Pakistan**[cite: 43, 44, 160, 170, 171].

---

## 🛠️ Tech Stack
* **SQL**: Executed diagnostic queries to calculate recovery rates and volatility metrics[cite: 3].
* **Power BI**: Developed interactive dashboards for trend mapping and gender gap visualizations[cite: 4].

---

## 📁 Dataset Details
* **Scope**: 180+ countries and territories.
* **Demographics**: Segmented by age groups (15+, 15–24, 25+) and sex (Male, Female, Total)[cite: 40, 41, 89, 90].
* **Data Cleaning**:
  * Integrated a `Region` field by joining `raw_data` and `mapping_list`.
  * Removed unnecessary fields and standardized naming conventions.
  * Excluded regional aggregates (G7, BRICS) to ensure country-level granularity.

---

## 📈 Visualizations Included
* **34-Year Trend Line**: Global unemployment fluctuations from 1991 to 2025[cite: 10, 100].
* **Gender Gap Map**: Regional comparison of labor equity across continents[cite: 91, 92, 94, 95].
* **Volatility Bar Chart**: Ranking countries based on labor market instability[cite: 160, 162].
* **Recovery Table**: Detailed post-2020 stabilization rates by country[cite: 174, 177].
