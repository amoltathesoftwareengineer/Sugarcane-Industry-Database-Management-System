# Sugarcane Industry Database Management System

A MySQL-based database management project designed to manage sugarcane farmers, agricultural plots, harvest records, sugar factories, and delivery transactions.

## Project Overview

This project demonstrates how a relational database can organize sugarcane industry data and generate useful reports using SQL queries.

## Objectives

- Maintain farmer and agricultural plot information.
- Store sugarcane harvest records.
- Manage sugar factory details.
- Record sugarcane deliveries and price per ton.
- Generate production, delivery, and revenue reports using SQL.

## Technologies Used

- MySQL
- SQL
- Relational Database Management System (RDBMS)

## Database Schema

The project contains five tables:

| Table | Purpose |
|---|---|
| `farmers` | Stores farmer details |
| `plots` | Stores agricultural plot information |
| `harvest` | Records harvest dates and quantities |
| `factories` | Stores sugar factory details |
| `deliveries` | Records deliveries and prices per ton |

## Features

- Database creation and table design
- Primary key and foreign key relationships
- Sample data insertion using `INSERT`
- Multi-table queries using `JOIN`
- Aggregate reporting using `SUM()` and `GROUP BY`
- Farmer-wise production reports
- Factory-wise sugarcane receipt reports
- Delivery revenue calculations

## Setup Instructions

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to your MySQL server.
3. Open a new SQL query tab.
4. Copy and execute the SQL script provided in this repository.
5. Verify the tables and run the reporting queries.

## Sample SQL Queries

### 1. Total Sugarcane Production by Farmer

```sql
SELECT
    f.name AS farmer_name,
    SUM(h.quantity_in_tons) AS total_quantity_in_tons
FROM farmers f
JOIN plots p ON f.farmer_id = p.farmer_id
JOIN harvest h ON p.plot_id = h.plot_id
GROUP BY f.farmer_id, f.name;
```

### 2. Revenue by Delivery

```sql
SELECT
    d.delivery_id,
    f.name AS farmer_name,
    h.quantity_in_tons * d.price_per_ton AS revenue
FROM deliveries d
JOIN harvest h ON d.harvest_id = h.harvest_id
JOIN plots p ON h.plot_id = p.plot_id
JOIN farmers f ON p.farmer_id = f.farmer_id;
```

*Note: This example assumes the full harvest quantity was delivered. A production-ready database should store the actual delivered quantity separately.*

### 3. Total Sugarcane Received by Factory

```sql
SELECT
    fac.name AS factory_name,
    SUM(h.quantity_in_tons) AS total_received_in_tons
FROM deliveries d
JOIN factories fac ON d.factory_id = fac.factory_id
JOIN harvest h ON d.harvest_id = h.harvest_id
GROUP BY fac.factory_id, fac.name;
```

## Learning Outcomes

- Understanding relational database design
- Creating tables with primary and foreign keys
- Writing SQL queries using joins and aggregate functions
- Generating reports from related tables
- Applying database concepts to an agricultural industry use case

## Future Enhancements

- Add farmer payment and delivery tracking.
- Add data validation and constraints.
- Create views and stored procedures for reporting.
- Build a Power BI dashboard for production and revenue analysis.
- Add test cases and more realistic sample data.

## Author

**Amol Tathe**

GitHub: [amoltathesoftwareengineer](https://github.com/amoltathesoftwareengineer)

---

*This project is intended for learning and demonstrating SQL and relational database management concepts.*
