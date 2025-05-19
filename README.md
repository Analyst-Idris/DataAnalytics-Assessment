# DataAnalytics-Assessment

## Overview
This repository contains my solutions for the SQL Proficiency Assessment, designed to demonstrate advanced data querying skills across multiple tables and real-world business cases.

### Q1 - High-Value Customers with Multiple Products

I joined the users_customuser, savings_savingsaccount, and plans_plan tables to filter customers with at least one funded savings plan and one investment plan. Then, I grouped the results by customer and summed up their deposits.


### Q2 - Transaction Frequency Analysis

This query calculates average monthly transactions per customer using DATEDIFF and conditional categorization with **CASE**. I then grouped by frequency level.


### Q3 - Account Inactivity Alert

I identified the latest transaction for each account, calculated the days since the last one, and filtered for accounts with over 365 days of inactivity.


### Q4 - Customer Lifetime Value (CLV)

Using total transaction volume and customer tenure in months, I estimated CLV based on a simplified revenue model, multiplying monthly profit by 12.

# Challenges

While working with the dataset, the following challenges were encountered and carefully resolved to ensure effective and efficient results.

* Ensuring correct conversion from kobo to naira
  
* Accurately calculating active months for frequency
  
* Handling NULLs and non-uniform transaction data


