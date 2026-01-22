# TASK-4-SQL-Intermediate-Joins-INNER-LEFT-
📊 SQL JOINs & Business Analysis Project


📌 Project Overview

This project demonstrates how to use SQL JOINs to analyze relational sales data for business decision-making.
The dataset includes customers, orders, products, categories, and order details, imported from CSV files into MySQL Workbench.

The objective is to:

Combine multiple tables using JOINs

Enforce relational integrity using primary and foreign keys

Perform revenue and customer analysis

Extract actionable business insights

🗂️ Dataset Tables Used
Table Name	Description
customers	Customer master data
orders	Order-level information
order_details	Line-item details for each order
products	Product catalog
categories	Product category information
⚙️ Tools & Technologies

MySQL Workbench

SQL (MySQL dialect)

CSV datasets

🔗 Database Relationships

customers.CustomerID → orders.CustomerID

orders.OrderID → order_details.OrderID

products.ProductID → order_details.ProductID

categories.CategoryID → products.CategoryID

Primary keys and foreign keys were explicitly added after CSV import to ensure data integrity.

🧠 SQL Tasks Performed
1️⃣ INNER JOIN – Orders with Customers

Combined orders with customer details

Validated output by matching joined row count with total orders

2️⃣ LEFT JOIN – Customers Without Orders

Identified customers who never placed an order

Important for marketing and re-engagement strategies

3️⃣ Revenue per Product

Joined orders, order details, and products

Calculated total revenue per product

Identified high-performing SKUs

4️⃣ Category-wise Revenue Analysis

Joined products with categories

Generated revenue distribution by category

Used for product strategy decisions

5️⃣ Conditional Analysis Using WHERE

Answered business questions such as:

“Sales in region X between dates Y and Z”

6️⃣ Data Export

Exported final analytical outputs into CSV file
