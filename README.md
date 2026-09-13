# Kimia Farma Big Data Analytics - Performance Analytics (2020-2023)

Welcome to my data analytics portfolio project. This project is part of the Project-Based Internship program, focusing on evaluating and analyzing the business and operational performance of **PT Kimia Farma Tbk** from 2020 to 2023 by using BigQuery SQL for data aggregation and Google Looker Studio for interactive analytics.

---

## 📌 Executive Summary
Kimia Farma operates a massive network of healthcare branches and medicine distributions across Indonesia. To optimize corporate growth and strategy, this project integrates siloed operational data into a unified data warehouse environment. The goal is to evaluate nationwide transaction patterns, track financial health metrics, and pinpoint operational inconsistencies across regional branches.

## 🛠️ Tech Stack & Infrastructure
*   **Data Warehouse & Processing:** Google Cloud Platform (GCP) - Google BigQuery
*   **Language:** Standard ANSI SQL
*   **Data Visualization & BI:** Google Looker Studio
*   **Version Control:** GitHub

---

## 📂 Dataset Architecture & Source Data
The analysis integrates 4 core relational tables hosted under the `kimia_farma` dataset:
*   `kf_final_transaction`: Historical transactional logs including discounts, dates, customer names, and transaction ratings.
*   `kf_product`: Medicine master catalog containing product categories and base pricing.
*   `kf_kantor_cabang`: Branch office profiles including geographical locations (City/Province) and total branch ratings.
*   `kf_inventory`: Operational warehouse stocks data monitoring product availability.

---

## 🧠 Business Logic & Analytical Calculations
To deliver real business value, the query modernizes data ingestion by incorporating dynamic margin logic and core financial variables:

1.  **Gross Profit Percentage Margin Logic (`persentase_gross_laba`):**
    *   Price $\le$ Rp 50,000 $\rightarrow$ **10%** profit margin
    *   Price > Rp 50,000 - Rp 100,000 $\rightarrow$ **15%** profit margin
    *   Price > Rp 100,000 - Rp 300,000 $\rightarrow$ **20%** profit margin
    *   Price > Rp 300,000 - Rp 500,000 $\rightarrow$ **25%** profit margin
    *   Price > Rp 50,000 $\rightarrow$ **30%** profit margin
2.  **Net Sales (`nett_sales`):** Calculated by subtracting the given discount percentage from the base catalog price.
3.  **Net Profit (`nett_profit`):** Derived from multiplying `nett_sales` by the dynamic `persentase_gross_laba`.

---

## 📊 Interactive Business Intelligence Dashboard
The analytical table materialized in BigQuery is directly connected to **Google Looker Studio**. The dashboard includes:
*   **Financial Trends:** Year-over-Year (YoY) revenue comparison graphs to track company trajectory.
*   **Geospatial Insights:** An interactive Indonesia Geo Map visualizing net profit distribution by province.
*   **Operational & Service Auditing:** A matrix filtering the Top 5 branches with high corporate ratings but low customer transaction ratings for immediate quality control.

---

## 🔒 Terms of Use
All rights reserved. This repository is developed strictly as a personal learning project and professional analytics portfolio. The scripts and documentation are available for review purposes only.

---
*Developed as a professional portfolio project by an Aspiring Data Analyst.*
