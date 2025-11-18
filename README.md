# Sales Analysis using Oracle SQL

## Overview
This project uses Oracle SQL to analyze a small retail sales database.  
The goal is to answer key business questions about customer behavior, product performance, payment methods, shipment methods, and inventory risk.

The queries were written and tested in **Oracle APEX** using the following tables:

- `CUSTOMERS`
- `ORDERS`
- `ORDER_LINES`
- `PAYMENT_METHOD`
- `SHIPMENT_METHOD`
- `PRODUCTS`
- `PRODUCT_INVENTORY`

All analysis queries are in `sales_analysis.sql`.

---

## Business Questions Answered

### 1. Total number of orders per customer
Counts how many orders each customer has placed, showing full name and sorting by last name (A–Z).

### 2. Best-selling products (top 5)
Finds the top 5 best-selling products by quantity sold, returning product ID, product name, and total quantity.

### 3. Number of customers who paid by cash
Counts how many distinct customers used the **Cash** payment method.

### 4. Most popular shipment method
Finds which shipment method is used most frequently, returning the method with the highest number of orders.

### 5. Total orders and total revenue by payment method
Shows, for each payment method:

### 6. Products with low inventory but high sales (stock-out risk)
 Identifies products that:
- have **low inventory** (`QTY_ON_HAND < 50`)  
- and **high total sales** (`SUM(total_amount) > 50000`)

## Tools & Technologies

- **Database:** Oracle
- **Interface:** Oracle APEX (SQL Workshop / SQL Scripts)
- **Language:** Oracle SQL (standard joins, aggregates, GROUP BY, HAVING, ORDER BY)


## What I Practiced

- Writing multi-table `JOIN` queries
- Using `GROUP BY`, `HAVING`, and aggregate functions (`COUNT`, `SUM`)
- Ranking and limiting results with `ORDER BY` and `FETCH FIRST n ROWS ONLY`
- Translating business questions into SQL analysis
- Working with inventory, revenue, and customer behavior metrics
