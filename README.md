# video-game-sales-analysis with MySQL

## Overview

This project explores and analyzes video game sales data using MySQL.  
The goal is to answer business and market-related questions through SQL queries and exploratory data analysis techniques.

The dataset contains information about:
- Video game titles
- Platforms
- Genres
- Publishers
- Release years
- Regional sales
- Global sales

---

## Dataset

Dataset used: `vgsales.csv`

The dataset includes sales information from multiple regions:
- North America (NA)
- Europe (EU)
- Japan (JP)
- Other regions
- Global sales totals

---

## Objectives

This project aims to:
- Practice SQL querying and data analysis
- Explore regional sales trends
- Identify top-performing games and genres
- Detect sales outliers using statistical methods
- Analyze publisher and platform performance

---

## SQL Concepts Used

The project demonstrates the use of:

- SELECT statements
- Filtering with WHERE
- ORDER BY
- GROUP BY
- Aggregate functions
  - AVG()
  - SUM()
  - MAX()
  - STDDEV()
- Common Table Expressions (CTEs)
- Joins
- Aliases
- Statistical analysis
- Data exploration techniques

---

## Example Business Questions

Some of the questions explored in this project include:

- Which games had the highest global sales?
- Which genres perform best in North America?
- Are there significant regional differences in game preferences?
- Which games are statistical outliers in sales?
- Which publishers dominate the market?
- How do average sales differ across genres and platforms?

---

## Example Query

```sql
SELECT
    Genre,
    ROUND(AVG(NA_Sales), 3) AS average_sales_na
FROM vgsales
GROUP BY Genre
ORDER BY average_sales_na DESC;
```

---

## Key Findings

- Action and Sports games generated strong global sales overall.
- North America and Europe showed similar market preferences.
- Japan displayed distinct genre preferences compared to Western markets.
- A small number of blockbuster titles act as strong sales outliers.

---

## Project Structure

```text
video-game-sales-analysis/
│
├── README.md
├── dataset/
│   └── vgsales.csv
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_basic_sales_analysis.sql
│   ├── 03_outlier_analysis.sql
│   ├── 04_regional_analysis.sql
│   ├── 05_best_sellers.sql
│   ├── 06_data_validation_and_backup.sql
│   ├── 07_yearly_sales_analysis.sql
│   ├── 08_top_games_analysis.sql
│   ├── 09_publisher_analysis.sql
│   └── 10_platform_analysis.sql

## Tools Used

- MySQL
- MySQL Workbench
- GitHub

---

---

## Author

SQL data analysis project focused on video game sales trends, regional market analysis, and statistical insights.
