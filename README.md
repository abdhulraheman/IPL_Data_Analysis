# 🏏 IPL Data Analysis | Python, SQL & Power BI

## 📌 Project Overview

This project analyzes **Indian Premier League (IPL) match and ball-by-ball data** to identify trends in team performance, player performance, scoring patterns, venues, seasons, and match outcomes.

The project demonstrates an end-to-end **Data Analytics workflow** using **Python, Pandas, SQL/MySQL, and Power BI**, including data exploration, data cleaning, SQL analysis, and data visualization.

---

## 🎯 Business Objectives

The main objectives of this project are to:

* Analyze IPL team performance across seasons
* Identify top-performing batters and bowlers
* Analyze Player of the Match performance
* Identify high-scoring overs and teams with the most sixes
* Analyze venue and city-level match trends
* Analyze batting partnerships
* Compare team wins and win percentages
* Explore the relationship between toss results and match outcomes
* Present analytical findings through Power BI visualizations

---

## 📊 Dataset

The project uses two IPL datasets:

### 1. Matches Dataset

Contains match-level information such as:

* Match ID
* Season
* City
* Date
* Match Type
* Player of the Match
* Venue
* Teams
* Toss Winner
* Toss Decision
* Match Winner
* Result
* Result Margin
* Target Runs
* Target Overs
* Super Over
* Match Method
* Umpires

### 2. Deliveries Dataset

Contains ball-by-ball information such as:

* Match ID
* Innings
* Batting Team
* Bowling Team
* Over
* Ball
* Batter
* Bowler
* Non-Striker
* Batsman Runs
* Extra Runs
* Total Runs
* Extras Type
* Wickets
* Player Dismissed
* Dismissal Kind
* Fielder

The datasets contain **1,095 matches and 260,920 ball-by-ball records** in the analyzed files.

---

## 🛠️ Tools & Technologies

| Tool                 | Purpose                                   |
| -------------------- | ----------------------------------------- |
| **Python**           | Data exploration and cleaning             |
| **Pandas**           | Data manipulation and transformation      |
| **MySQL**            | SQL-based data analysis                   |
| **Power BI**         | Data visualization and dashboarding       |
| **Jupyter Notebook** | Python analysis environment               |
| **GitHub**           | Project documentation and version control |

---

## 🔄 Project Workflow

```text
Raw IPL Data
     ↓
Data Exploration
     ↓
Data Cleaning & Transformation
     ↓
Cleaned Dataset
     ↓
MySQL Data Analysis
     ↓
Business Questions & Insights
     ↓
Power BI Dashboard
     ↓
Data-Driven Insights
```

---

## 🐍 1. Data Cleaning & Exploration — Python

Python and Pandas were used to explore and prepare the IPL datasets.

### Key activities:

* Loaded match and ball-by-ball datasets using Pandas
* Explored dataset structure and columns
* Checked missing values
* Analyzed unique values and frequencies
* Handled missing city information
* Handled missing match-result fields
* Filled missing target information
* Standardized missing Player of the Match and winner values
* Handled missing extras, dismissal, and fielder information
* Verified missing values after cleaning
* Exported cleaned datasets for further analysis

The cleaned datasets were exported as Excel files for downstream analysis.

---

## 🗄️ 2. SQL Analysis — MySQL

The cleaned IPL data was analyzed using SQL to answer business and analytical questions.

### SQL concepts used:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `HAVING`
* Aggregate Functions
* `SUM()`
* `COUNT()`
* `AVG()`
* `ROUND()`
* `INNER JOIN`
* Subqueries
* CTEs
* Window Functions
* `RANK()`
* `LEAST()`
* `GREATEST()`

### Key analytical questions:

1. Which team has won the most matches overall?
2. Which cities have hosted the most IPL matches?
3. Which players have won the most Player of the Match awards?
4. Which venue has hosted the highest number of matches?
5. How many matches were played in each season?
6. Which team won the most matches in each season?
7. Which batter scored the most runs?
8. Which bowler took the most wickets?
9. Which over produced the highest number of runs?
10. Which teams hit the most sixes?
11. Which batting partnerships scored the most runs?
12. Which bowlers have the best economy rate?
13. Does winning the toss relate to winning the match?
14. What are the team-level performance metrics?

These SQL analyses are implemented in the project SQL file.

---

## 📈 3. Power BI Dashboard

The cleaned IPL data was used to create a Power BI dashboard for interactive data visualization.

The dashboard is designed to help analyze:

* Team performance
* Player performance
* Match trends
* Season-wise performance
* Scoring patterns
* IPL match statistics

The Power BI file included in this repository is:

```text
IPL_Dashboards.pbix
```

---

## 💡 Key Analytical Areas

The project focuses on several important Data Analytics areas:

### Team Performance

* Total wins
* Season-wise wins
* Matches played
* Win percentage
* Toss performance

### Player Performance

* Top run scorers
* Top wicket takers
* Player of the Match awards
* Batting partnerships
* Bowling economy

### Match Analysis

* Matches by season
* Matches by city
* Matches by venue
* Scoring patterns
* High-scoring overs
* Sixes and fours

---

## 📁 Project Structure

```text
IPL-Data-Analysis/
│
├── IPL_Data_Cleaning.ipynb
├── IPL_Matches_DA.sql
├── IPL_Dashboards.pbix
│
├── Matches_Final_dataset.xlsx
├── Deliveries_Final_Dataset.xlsx
│
└── README.md
```

---

## 🚀 How to Use This Project

### Python

Open:

```text
IPL_Data_Cleaning.ipynb
```

Run the notebook using **Jupyter Notebook / JupyterLab**.

Required Python library:

```python
import pandas as pd
```

### SQL

Open:

```text
IPL_Matches_DA.sql
```

Run the queries in **MySQL Workbench** after loading the datasets into the required database.

The SQL script uses:

```sql
USE ipl_analysis;
```

### Power BI

Open:

```text
IPL_Dashboards.pbix
```

using **Microsoft Power BI Desktop**.

---

## 🔑 Skills Demonstrated

**Data Analytics:**
Data Cleaning, Data Exploration, Data Transformation, Exploratory Data Analysis, Data Visualization, Trend Analysis, Performance Analysis

**Python:**
Python, Pandas

**SQL:**
MySQL, Joins, CTEs, Window Functions, Aggregations, GROUP BY, HAVING, Subqueries, Ranking

**Power BI:**
Dashboard Development, Data Visualization, Interactive Reporting

---

## 📌 Project Outcome

This project demonstrates an end-to-end approach to transforming raw IPL data into structured datasets, performing SQL-based analysis, and presenting analytical findings through Power BI.

It showcases practical skills in **data cleaning, SQL querying, analytical problem-solving, data visualization, and business-oriented reporting**.

---

## 👨‍💻 Author

**Abdhul Raheman Sheik**

**Data Analyst | SQL | Python | Power BI | Excel**

* LinkedIn: [Abdhul Raheman Sheik](https://www.linkedin.com/in/abdhul-raheman-sheik-483b90250/)
* GitHub: [abdhulraheman](https://github.com/abdhulraheman)

---

## ⭐ If You Find This Project Useful

Feel free to explore the notebook, SQL queries, and Power BI dashboard to understand the complete data analysis workflow.
