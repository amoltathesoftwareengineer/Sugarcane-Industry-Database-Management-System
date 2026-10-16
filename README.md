
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

- Relational database design with primary and foreign keys
- Data integrity checks using constraints
- Sample data for farmers, plots, harvests, factories, and deliveries
- Farmer-wise sugarcane production reports
- Farmer-wise delivery revenue analysis
- Factory-wise delivery quantity reports
- Detailed delivery reports
- Overall business summary
- Data validation queries

## SQL Concepts Demonstrated

- CREATE TABLE and INSERT statements
- Primary keys and foreign keys
- JOIN operations
- Aggregate functions such as SUM() and COUNT()
- GROUP BY
- Calculated columns
- CHECK and NOT NULL constraints
- Data validation queries

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
