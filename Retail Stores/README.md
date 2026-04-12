# 🛒 Dirty Retail Store Sales Dataset

## 📌 Overview
The **Dirty Retail Store Sales** dataset contains **12,575 rows** of synthetic retail transaction data.

It includes **8 product categories**, each with **25 items** and static pricing. The dataset intentionally includes **dirty data** (missing, inconsistent, or invalid values) to simulate real-world scenarios.

👉 This dataset is ideal for:
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Feature Engineering

---

## 🧰 Tools Used
- 🗄️ SQL → Data Cleaning
- 📊 Power BI → Data Visualization & Dashboarding
- 📊 Tableau → Data Visualization & Dashboarding
https://public.tableau.com/app/profile/hai.le6258/viz/RetailStore_17758525999160/SalesPerformance?publish=yes

---

## 📁 File Information

| Attribute           | Value                      |
|--------------------|----------------------------|
| File Name          | `retail_store_sales.csv`   |
| Number of Rows     | 12,575                    |
| Number of Columns  | 11                        |

---

## 📊 Columns Description

| Column Name         | Description                                                                 | Example Values         |
|--------------------|-----------------------------------------------------------------------------|------------------------|
| Transaction ID     | Unique identifier for each transaction (always present)                    | TXN_1234567            |
| Customer ID        | Unique identifier for each customer (25 unique customers)                  | CUST_01                |
| Category           | Product category                                                           | Food, Furniture        |
| Item               | Purchased item (may contain missing values)                                | Item_1_FOOD, None      |
| Price Per Unit     | Static item price (may be missing)                                         | 4.00, None             |
| Quantity           | Number of units purchased (may be missing)                                 | 1, None                |
| Total Spent        | Quantity × Price Per Unit (may be missing)                                 | 8.00, None             |
| Payment Method     | Payment method (may be invalid/missing)                                    | Cash, Credit Card      |
| Location           | Transaction location (may be invalid/missing)                              | In-store, Online       |
| Transaction Date   | Always valid transaction date                                              | 2023-01-15             |
| Discount Applied   | Indicates if discount applied (may be missing)                             | True, False, None      |

---

## 🏷️ Categories

The dataset includes **8 categories**, each with 25 items:

- Electric Household Essentials  
- Furniture  
- Computers & Electric Accessories  
- Food  
- Beverages  
- Milk Products  
- Patisserie  
- Butchers  

---

## ⚠️ Key Characteristics

### 🔹 Missing Data
- Columns like `Item`, `Price Per Unit`, `Quantity`, and `Total Spent` may contain `NULL` or `None`
- Simulates real-world messy datasets

### 🔹 Item Probabilities
- Items have different probabilities of appearing in transactions

### 🔹 Transaction Integrity
- `Transaction ID` → always unique  
- `Customer ID` → always valid (25 customers)

### 🔹 Dynamic Dirtiness
- Some rows contain partial data
- Requires inference (e.g., deducing `Item` from `Price` and `Total Spent`)

---

## 🎯 Use Cases

This dataset is ideal for:

- 🧹 Data Cleaning Practice  
- 📊 Exploratory Data Analysis (EDA)  
- 🧠 Feature Engineering  
- ✅ Data Validation  

---

## 🧹 Suggested Cleaning Steps

### 1. Handle Missing Values
- Infer missing `Item` using `Price Per Unit` and `Total Spent`
- Handle null values appropriately (impute/drop)

### 2. Validate Data Consistency
Ensure:
```text
Total Spent = Quantity × Price Per Unit
