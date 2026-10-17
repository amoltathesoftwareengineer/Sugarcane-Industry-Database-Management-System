
# Sugarcane Industry Database Management System

A SQL-based database management project designed to manage sugarcane farmers, agricultural plots, harvesting records, sugar factories, and sugarcane deliveries.

## Project Overview

The Sugarcane Industry Database Management System organizes sugarcane production and delivery data in a relational database. It helps track harvested quantities, factory deliveries, and delivery revenue using SQL queries.

## Technologies Used

- MySQL 8.0
- SQL
- Relational Database Management
- Data Analysis and Reporting

## Database Tables

| Table | Description |
|---|---|
| farmers | Stores farmer details |
| plots | Stores agricultural plot information |
| harvest | Records harvested sugarcane quantities |
| factories | Stores sugar factory details |
| deliveries | Tracks deliveries, quantities, and prices |

## Key Features


## Key Features

- **Farmer Management:** Store farmer names and village information.
- **Agricultural Plot Tracking:** Maintain plot details, cultivated area, and soil type.
- **Harvest Management:** Record harvested sugarcane quantities and harvest dates.
- **Factory Management:** Maintain sugar factory names and locations.
- **Delivery Tracking:** Record delivered quantities and prices per ton.
- **Payment Analysis:** Calculate total payments and farmer-wise income using SQL.
- **Data Reporting:** Generate summaries using JOIN, GROUP BY, aggregate functions, and sorting.


## Technologies Used

- **Database:** MySQL
- **Query Language:** SQL
- **Tools:** MySQL-compatible SQL editor / DB Fiddle

## SQL Concepts Demonstrated

- DDL (CREATE TABLE)
- DML (INSERT)
- INNER JOIN
- Aggregate Functions: SUM(), COUNT(), AVG()
- GROUP BY and ORDER BY
- Calculated Columns
- Multi-table Queries
- Business Reporting and Data Analysis


## Sample Query Results

### 1. Farmer-wise Total Harvest

| Farmer Name | Village | Total Harvest (Tons) |
|---|---|---:|
| Suresh Jadhav | Sangli | 15.00 |
| Ramesh Patil | Kolhapur | 12.50 |

### 2. Factory-wise Delivery and Payment

| Factory Name | Delivered Tons | Total Payment |
|---|---:|---:|
| Sahyadri Sugar | 15.00 | 48000 |
| Krishna Sugar Mill | 12.50 | 37500 |

### 3. Farmer-wise Total Income

| Farmer Name | Village | Delivered Tons | Total Income |
|---|---|---:|---:|
| Suresh Jadhav | Sangli | 15.00 | 48000 |
| Ramesh Patil | Kolhapur | 12.50 | 37500 |

### 4. Factory-wise Delivery Summary

| Factory Name | Total Deliveries | Total Tons | Average Price per Ton |
|---|---:|---:|---:|
| Sahyadri Sugar | 1 | 15.00 | 3200 |
| Krishna Sugar Mill | 1 | 12.50 | 3000 |



## Sample Business Insights

The sample dataset contains:

- 2 farmers
- 2 agricultural plots
- 2 harvest records
- 2 sugar factories
- 2 delivery records

Sample delivery summary:

| Metric | Sample Result |
|---|---:|
| Total Deliveries | 2 |
| Total Delivered Sugarcane | 27.50 tons |
| Total Delivery Revenue | 85,500.00 |

*These results are based on the sample data included in the SQL script.*

## How to Run the Project

1. Open MySQL 8.0 or a compatible MySQL SQL editor.
2. Create a new SQL script.
3. Copy the contents of `sugarcane_industry.sql` into the script.
4. Execute the SQL statements in order.
5. Run the report queries to view the results.

## Project Structure

```text
Sugarcane-Industry-Database-Management-System/
├── README.md
├── queries.sql
└── sugarcane_industry.sql
```

## Future Improvements

- Add farmer payment and billing management.
- Create monthly and yearly production reports.
- Add a Power BI dashboard for business insights.
- Expand the database with additional farmers, factories, and delivery records.

## Author

**Amol Tathe**

- GitHub: [amoltathathesoftwareengineer](https://github.com/amoltathathesoftwareengineer)

---

This project is created for learning and demonstrating SQL database design, data management, and reporting concepts.
