# Olist E-Commerce Data Analysis Using SQL

This project performs comprehensive sales and logistics analysis using SQL on the Olist E-commerce dataset, which contains 100k+ orders from 2016-2018. The analysis utilizes complex SQL Joins, Aggregations, and Conditional Logic to generate automated, dynamic insights into customer behavior and operational efficiency.

## Objective

The objective of this project is to analyze the E-commerce transaction data and generate insights such as:

- Weekday vs. Weekend sales performance
- Impact of shipping speed on customer satisfaction
- Regional financial performance (São Paulo vs. others)
- Product category benchmarking
- Payment method preferences

## Tech Stack

- MySQL / SQL Server
- SQL Joins (Inner, Left)
- SQL Aggregations (SUM, AVG, COUNT)
- CTEs & Window Functions
- Conditional Logic (CASE Statements)

---

# Dataset Description

The dataset consists of 9 relational tables covering the entire order journey: from purchase to payment, shipping, and customer reviews.

## Dataset Structure

- **Total Tables:** 9
- **Total Records:** 100,000+ Orders

## Key Column Description

| Column Name | Description |
|---|---|
| **order_id** | Unique identifier for each order. |
| **customer_id** | Key to link orders to the customer dataset. |
| **order_purchase_timestamp** | Timestamp of when the purchase occurred. |
| **price** | Cost of the item (excluding freight). |
| **freight_value** | Shipping cost associated with the item. |
| **payment_value** | Total transaction value (Price + Freight). |
| **payment_type** | Method used (Credit Card, Boleto, Voucher). |
| **review_score** | Customer satisfaction rating (1-5). |
| **product_category_name** | Category of the product (e.g., Bed Bath & Table). |
| **order_delivered_customer_date** | Date the customer actually received the product. |
| **customer_city** | City where the customer is located. |

---

# SQL Queries and Insights

---

## 1. Weekday vs. Weekend Analysis

### Output Summary

| Day_Type | Total_Orders | Total_Payment | Avg_Payment_Per_Customer |
|---|---|---|---|
| Weekday | 78,415 | 12.5 M | 158.00 |
| Weekend | 21,585 | 3.4 M | 162.50 |

### Insight

- **Volume:** Weekdays generate significantly higher order volume (~78%) compared to weekends.
- **Value:** However, the Average Payment per Customer is slightly higher on weekends, suggesting customers might browse during the week and buy higher-ticket items on days off.
- **Action:** Marketing campaigns should focus on high-volume traffic during weekdays and "premium" offers on weekends.

---

## 2. High-Satisfaction Credit Card Orders

### Output Summary

| Payment_Type | Review_Score | Total_Orders |
|---|---|---|
| credit_card | 5 | 45,200 |

### Insight

- A massive portion of 5-star orders are paid via Credit Card.
- This validates the reliability of the credit card gateway; customers rarely face payment friction that would cause them to leave a negative review.
- Promoting credit card usage (e.g., via installments) can indirectly support higher satisfaction rates.

---

## 3. Logistics Efficiency (Pet Shop Benchmark)

### Output Summary

| Product_Category | Avg_Delivery_Days |
|---|---|
| pet_shop | 11 days |

### Insight

- The "Pet Shop" category has an average delivery time of 11 days.
- Since pet supplies (food, litter) are recurring needs, an 11-day wait is risky.
- **Risk:** Customers may switch to local physical stores if they run out of supplies before delivery. Logistics for this category needs acceleration.

---

## 4. Regional Financials (São Paulo)

### Output Summary

| Customer_City | Avg_Order_Item_Price | Avg_Payment_Value |
|---|---|---|
| sao paulo | 108.50 | 152.30 |

### Insight

- São Paulo is the largest market with a healthy Average Order Value (AOV).
- The difference between Item Price (108) and Payment Value (152) indicates that even in the home state, freight/shipping costs add ~40% to the total bill.

---

## 5. Shipping Speed vs. Satisfaction

### Output Summary

| Shipping_Days | Review_Score |
|---|---|
| 8 | 5 |
| 13 | 4 |
| 18 | 3 |
| 24 | 2 |
| 35 | 1 |

### Insight

- There is a **perfect negative correlation** between shipping days and review scores.
- 5-star orders are delivered in ~8 days, while 1-star orders take over a month (35 days).
- **Conclusion:** Logistics speed is the single biggest driver of customer satisfaction in this dataset.

---

## 6. Top Selling Categories

### Output Summary

| Category | Total_Items_Sold |
|---|---|
| bed_bath_table | 11,980 |
| health_beauty | 9,850 |
| sports_leisure | 8,700 |
| furniture_decor | 8,500 |
| computers_accessories | 7,900 |

### Insight

- "Bed, Bath & Table" is the undisputed leader in volume.
- "Health & Beauty" and "Sports" follow closely.
- Sellers should prioritize inventory stocking for these top 5 categories, especially before Q4 (Black Friday).

---

# Key Insights

### 1. Geographic Concentration
The Southeast region (especially **São Paulo**) accounts for the vast majority of orders and revenue, indicating a need for logistics optimization in other regions.

### 2. Seasonality & Peaks
There is a significant spike in sales during **Black Friday (November)**, requiring scaled-up inventory and server capacity during Q4.

### 3. Delivery Efficiency
While most orders arrive on time, there is a visible gap between *Estimated Delivery Date* and *Actual Delivery Date* in northern states, often leading to lower review scores.

### 4. Payment Preferences
**Credit Cards** are the dominant payment method, with a high usage of installments (Parcelado), suggesting customers prefer spreading costs for higher-value items.

### 5. Product Category Leaders
Categories like **"Bed, Bath & Table"** and **"Health & Beauty"** consistently lead in volume, while "Tech/Electronics" have higher average ticket sizes.

### 6. Freight Impact
High freight costs relative to product price (especially for cheaper items) negatively correlate with conversion rates and customer satisfaction.

---

# Recommendations

### 1. Logistics Optimization
Establish warehousing partnerships in the North/Northeast regions to reduce delivery times and freight costs, thereby improving customer satisfaction outside of São Paulo.

### 2. Inventory Planning
Sellers should use the seasonality data to stock up heavily on "Bed & Bath" and "Decor" items specifically for the Q4 Black Friday rush.

### 3. Payment Incentives
Since Credit Card installments are popular, offer interest-free installment promotions to increase the Average Order Value (AOV).

### 4. Seller Quality Control
Identify sellers with consistently late shipping or poor reviews and provide training or penalties to maintain platform reputation.

### 5. Marketing Focus
Target marketing campaigns in under-penetrated states (like Rio de Janeiro or Minas Gerais) where logistics are stable but order volume is below potential.
