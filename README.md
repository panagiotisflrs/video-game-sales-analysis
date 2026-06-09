# Video Game Sales Analysis — SQL Analysis

Analysis of global video game sales across platforms, genres, publishers, and regions from 1982 to 2015, using a publicly available dataset sourced from [Kaggle](https://www.kaggle.com/datasets/gregorut/videogamesales).

---

## Dataset

| Property | Detail |
|---|---|
| Source | Kaggle — Video Game Sales |
| File | `vgsales.csv` |
| Period | 1982 – 2015 |
| Records | 16,000+ video game titles |
| Regions | North America, Europe, Japan, Other, Global |
| Columns | Title, Platform, Genre, Publisher, Release Year, Regional Sales, Global Sales |
| Unit | Millions of units sold |

---

## Files

| File | Description |
|---|---|
| `01_database_setup.sql` | Database creation, column type fix for `Year`, data range validation |
| `02_basic_sales_analysis.sql` | Top games in North America, average and standard deviation of sales by genre |
| `03_outlier_analysis.sql` | High-end and low-end outlier detection using the 2-standard-deviation method |
| `04_regional_analysis.sql` | Genre sales comparison across North America, Europe, Japan, and other regions |
| `05_best_sellers.sql` | Best-selling games and genres per region, using subqueries and CTEs |
| `06_data_validation_and_backup.sql` | Duplicate detection with `ROW_NUMBER()`, backup table creation |
| `07_yearly_sales_analysis.sql` | Yearly sales trends by region and globally from 1982 to 2015 |
| `08_top_games_analysis.sql` | Top 10 games in Europe, top 3 per year using `DENSE_RANK()` |
| `09_publisher_analysis.sql` | Publisher activity, regional sales, global sales, and genre distribution |
| `10_platform_analysis.sql` | Platform comparison by number of titles released and total global sales |

> Files are numbered in recommended execution order. `06_data_validation_and_backup.sql` creates the `vgsalesbackup` table used in files 07–09.

---

## Analytical Questions

| # | Question | Techniques |
|---|---|---|
| 1 | Which games generated the highest sales in North America? | `ORDER BY`, `LIMIT` |
| 2 | Which genres have the highest average sales, and how much variance is there? | `AVG()`, `STDDEV()` |
| 3 | Which games are statistical outliers within their genre? | `STDDEV()`, CTE, self-join |
| 4 | How do genre preferences differ across regions? | `SUM()`, `GROUP BY`, multi-column aggregation |
| 5 | What is the best-selling game and genre in each region? | Subquery, CTE chaining, `UNION ALL` |
| 6 | Are there duplicate records in the dataset? | `ROW_NUMBER()`, `PARTITION BY` |
| 7 | How did global and regional sales trend year over year? | `GROUP BY`, `YEAR()`, aggregation |
| 8 | What are the top 3 best-selling games in Europe for every year? | `DENSE_RANK()`, window functions |
| 9 | Which publishers released the most games and generated the most revenue? | `COUNT()`, `SUM()`, `GROUP BY` |
| 10 | Which platforms had the most releases and the highest global sales? | `COUNT()`, `SUM()`, comparative aggregation |

---

## SQL Techniques Used

- Window functions: `DENSE_RANK()`, `ROW_NUMBER()` with `PARTITION BY`
- Multi-step CTEs and CTE chaining
- Outlier detection using `STDDEV()` with a 2-standard-deviation threshold
- Self-joins for genre-level statistical comparisons
- Subqueries vs. CTEs — both approaches implemented and compared
- `UNION ALL` for combining ranked results across regions
- Aggregate functions: `AVG()`, `SUM()`, `MAX()`, `COUNT()`, `STDDEV()`
- Date handling with `YEAR()` on a `DATE` column
- Backup table creation and duplicate detection workflow

---

## Key Findings

- Wii Sports is the best-selling game in both North America and Europe
- Pokemon Red/Blue is the best-selling game in Japan with 10.22M units
- North America and Europe show similar genre preferences; Japan is noticeably different
- The Shooter genre leads total sales in NA and EU; Role-Playing leads in Japan
- Despite having fewer titles than Xbox 360 and PS3, the Wii generated significantly higher global sales
- A small number of blockbuster titles act as strong outliers within their genres

---

## Tools

- MySQL 8.0
- MySQL Workbench
- GitHub
