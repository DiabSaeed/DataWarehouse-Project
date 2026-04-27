# DataWarehouse-Project
Building Modern Data Warehouse with SQL Server, including ETL, Data Modeling, and Analytics
# Build A DWH for Retail Data

---

## 1. Project Overview

**Project Name:** Retail 360 Data Warehouse

**Objective:** To centralize disparate retail data (Transactions, Inventory, and Customers) into a single source of truth to enable data-driven decision-making regarding sales performance and customer retention.

---

## 2. Business Requirements (The "Why")

The business stakeholders need to answer the following questions:

- Which product categories are driving the highest gross margin?
- Are there specific stores that consistently underperform in "Units Per Transaction" (UPT)?
- How does a promotion affect the sales volume vs. the actual profit?
- Which customer segments are most likely to churn (haven't purchased in 60+ days)?

---

## 3. Data Requirements (The "What")

We will extract data from the following source entities (your CSV files):

| **Source Entity** | **Key Attributes** | **Data Frequency** |
| --- | --- | --- |
| **Orders** | Order_ID, Customer_ID, Store_ID, Order_Date, Total_Amount | Daily Batch |
| **Order_Items** | Order_ID, Product_ID, Quantity, Unit_Price, Discount_Amount | Daily Batch |
| **Products** | Product_ID, Product_Name, Category, Brand, Cost_Price | Monthly/Ad-hoc |
| **Customers** | Customer_ID, Name, Email, Join_Date, Location | Daily Update |
| **Stores** | Store_ID, Store_Name, Region, Manager_Name | Static |

---

## 4. Functional Requirements (The "How")

### 4.1. Data Transformation Rules

- **Currency Standardization:** All transactions must be converted to a base currency (e.g., USD) if multiple currencies exist.
- **Returns Handling:** If a transaction is a "Return," it must be flagged, and the quantity should be treated as a negative value in the Fact table.
- **Deduplication:** The system must check for duplicate `Order_ID` entries during the "Silver" staging layer.

### 4.2. Dimensional Modeling (The Star Schema)

- **Fact Table:** `fact_sales` (Grain: One row per item per order).
- **Dimension Tables:** * `dim_product` (SCD Type 2 to track category changes).
    - `dim_customer` (SCD Type 1 for basic info).
    - `dim_date` (Standard retail calendar: Day, Month, Quarter, Year, Weekend Flag).

---

## 5. Non-Functional Requirements

- **Accuracy:** The DWH totals must match the Source System (POS) totals with 100% accuracy.
- **Latency:** Data must be processed and available in the "Gold" layer by 8:00 AM every morning.
- **Security:** Mask PII (Personally Identifiable Information) such as customer emails in the reporting layer.

---

## 6. Success Metrics (KPIs)

The project will be considered successful if the following can be calculated via SQL/Power BI:

1. **Year-over-Year (YoY) Sales Growth.**
2. **Average Order Value (AOV).**
    - Formula:
        
        $$\frac{\text{Total Revenue}}{\text{Number of Unique Orders}}$$
        
3. **Basket Penetration:** (How often Product A is bought with Product B).

---
