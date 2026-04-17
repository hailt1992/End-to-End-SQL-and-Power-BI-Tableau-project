# ☕ Cafe Sales Data Cleaning & BI Analytics Project

## 📌 Project Overview

This project demonstrates an end-to-end **Business Intelligence workflow**, transforming a messy cafe sales dataset into actionable insights using **SQL for data cleaning** and **Power BI for visualization**.

The dataset contains 10,000 rows of intentionally dirty data, simulating real-world challenges such as missing values, inconsistencies, and incorrect records.


---
## 🧹 SQL – Data Cleaning & Preparation

Data cleaning was performed using SQL to ensure data quality and reliability.

### 🔧 Key Cleaning Steps

- Handling missing values (imputation or removal)
- Removing or correcting invalid entries (`ERROR`, `UNKNOWN`)
- Standardizing categorical values (Item, Payment Method, Location)
- Ensuring consistency in numerical columns (Quantity, Price)
- Verifying calculated fields:
  - Unit Price
  - Quantity
  - Total Spent
- Detecting and removing duplicate records

---

## 📊 Power BI and Tableau – Data Visualization & Dashboard

An interactive Power BI and Tableau dashboard was built to analyze sales performance and business trends.

### 📈 Key Features

- Revenue and quantity analysis by:
  - Item
  - Time series (monthly trends)
- KPI cards for high-level performance metrics
- Interactive item filter (menu-based selection)
- Created menu and added item photos
- Buttons and bookmarks:
  - Toggle views for **2023 Revenue Overview Report**
 
---

## 💡 Business Insights & Recommendations

### 📉 Deal of the Month Strategy
Promote low-performing items to boost sales:

- January → Smoothie  
- July → Juice  
- September → Salad  
- October → Sandwich  
- November → Tea  

---

### 🎯 Business Growth Strategies

#### 🛍️ Sales & Marketing
- Introduce seasonal food and drink offerings  
- Enhance store ambiance with seasonal decorations  
- Strengthen brand marketing initiatives  

#### 👥 Customer Engagement
- Implement a loyalty/membership program  
- Conduct customer satisfaction surveys  
- Improve service quality based on feedback  

#### 🏪 Operations
- Remodel store layout if needed  
- Expand through franchise opportunities  

#### 👨‍💼 Employee Development
- Quarterly employee training programs  
- Encourage employee feedback and innovation  
- Provide career growth and promotion opportunities

---

## 🛠️ Tools & Technologies

- **SQL** – Data cleaning & transformation  
- **Power BI** – Dashboard creation & visualization  
- **Excel / CSV** – Data source  

---

## 🚀 Key Skills Demonstrated

- Data Cleaning & Data Quality Management  
- SQL Querying & Transformation  
- Data Visualization (Power BI)  
- Dashboard Design & User Interaction (filters, bookmarks, buttons)  
- Business Insight Generation  
- Strategic Decision-Making  

---

## 📈 Project Outcome

This project highlights the ability to:
- Transform raw, messy data into a clean dataset  
- Build interactive dashboards for stakeholders  
- Translate data insights into **practical business strategies**

---

## 📬 Contact

Feel free to connect with me for feedback, collaboration, or opportunities!

Email: hailt1706@gmail.com
Phone number: 707-515-8485 
Linkedin: https://www.linkedin.com/in/hailt1706/

---
---

## 📂 Dataset Information

- **File Name:** `dirty_cafe_sales.csv`  
- **Rows:** 10,000  
- **Columns:** 8  
- **Source:** https://www.kaggle.com/datasets/ahmedmohamed2003/cafe-sales-dirty-data-for-cleaning-training
### 🧾 Column Descriptions

| Column Name        | Description |
|-------------------|------------|
| Transaction ID     | Unique identifier for each transaction |
| Item              | Product purchased (may contain missing/invalid values) |
| Quantity          | Number of items purchased (may include errors like "UNKNOWN") |
| Price Per Unit    | Price of a single item |
| Total Spent       | Quantity × Price Per Unit |
| Payment Method    | Payment type (Cash, Credit Card, etc.) |
| Location          | Purchase type (In-store, Takeaway) |
| Transaction Date  | Date of transaction |

---

## ⚠️ Data Challenges

The dataset includes several real-world data quality issues:

- Missing values (`None`, empty cells)
- Invalid entries (`ERROR`, `UNKNOWN`)
- Inconsistent data formats
- Incorrect or incomplete transaction records

---

## 🧹 Data Cleaning Process

Key steps performed:

- Handling missing values (imputation or removal)
- Removing or correcting invalid entries
- Standardizing categorical values
- Ensuring consistency in numerical columns
- Verifying calculated fields (e.g., Total Spent)
- Detecting and removing duplicates

---

## 📊 Exploratory Data Analysis (EDA)

EDA was conducted to uncover patterns and insights:

- Sales trends over time
- Revenue by item
- Payment method distribution
- Customer purchasing behavior
- Location-based sales analysis

---

## 🍽️ Menu Pricing Reference

| Item       | Price ($) |
|------------|----------|
| Coffee     | 2.00     |
| Tea        | 1.50     |
| Sandwich   | 4.00     |
| Salad      | 5.00     |
| Cake       | 3.00     |
| Cookie     | 1.00     |
| Smoothie   | 4.00     |
| Juice      | 3.00     |

---
## Use Cases

This dataset is suitable for:

Practicing data cleaning techniques such as handling missing values, removing duplicates, and correcting invalid entries.
Exploring EDA techniques like visualizations and summary statistics.

