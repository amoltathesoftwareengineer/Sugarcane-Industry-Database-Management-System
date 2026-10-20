# 🌱 Sugarcane Industry Database Management System

A MySQL-based relational database project designed to manage sugarcane farmers, agricultural plots, harvest records, sugar factories, and delivery transactions. This project demonstrates database design, SQL querying, data validation, and business reporting.

## 📌 Project Overview

The Sugarcane Industry Database Management System organizes sugarcane production and delivery information in a structured relational database. It helps analyze harvested quantities, factory deliveries, and estimated delivery revenue through SQL queries.

## 🎯 Project Objectives

- Organize farmer and agricultural plot information.
- Track sugarcane harvesting and delivery transactions.
- Maintain relationships between farmers, plots, harvests, and factories.
- Generate business reports using SQL.
- Validate data quality and identify potentially inconsistent records.

## 🛠️ Technologies Used

- **Database:** MySQL 8.0
- **Query Language:** SQL
- **Concepts:** Relational Database Design, Joins, Aggregations, Data Validation
- **Tools:** MySQL-compatible SQL editor

## 🗂️ Database Schema

The database contains five main tables.

| Table | Purpose |
|---|---|
| `farmers` | Stores farmer names, villages, and contact information |
| `plots` | Stores plot area, soil type, and farmer relationships |
| `harvest` | Records harvest dates and quantities in tons |
| `factories` | Stores sugar factory names and locations |
| `deliveries` | Tracks delivered quantities, dates, factories, and prices |

### Database Relationships

- One farmer can have multiple agricultural plots.
- One plot can have multiple harvest records.
- One harvest record can have multiple delivery records.
- One factory can receive multiple deliveries.

Primary keys and foreign keys establish relationships between the tables. The schema also uses positive-value constraints for relevant quantities and prices.

For the detailed documentation, see [`database_schema.md`](database_schema.md).

## ✨ Key Features

- **Farmer Management:** Store farmer and village information.
- **Plot Tracking:** Maintain agricultural area and soil type.
- **Harvest Management:** Record harvest dates and production quantities.
- **Factory Management:** Maintain sugar factory information.
- **Delivery Tracking:** Record delivered quantities and prices per ton.
- **Revenue Analysis:** Calculate estimated revenue from delivery quantities and prices.
- **SQL Business Reporting:** Summarize production, deliveries, and revenue.
- **Data Quality Checks:** Identify missing values, invalid quantities, duplicate farmer records, and potentially inconsistent deliveries.

## 📊 SQL Concepts Demonstrated

- DDL — `CREATE TABLE`
- DML — `INSERT`
- Primary Keys and Foreign Keys
- `INNER JOIN` and `LEFT JOIN`
- Aggregate Functions — `SUM()`, `COUNT()`, `AVG()`
- `GROUP BY`, `ORDER BY`, and `HAVING`
- Calculated Columns
- `CHECK` Constraints
- Multi-table Queries
- Data Validation and Business Reporting

## 📈 Business Reports

The project supports the following analytical reports:

1. **Farmer-wise Harvest Report** — compares harvested quantities across farmers.
2. **Factory-wise Delivery Report** — summarizes delivered quantities by factory.
3. **Farmer-wise Revenue Report** — calculates estimated revenue from recorded deliveries.
4. **Factory-wise Delivery Summary** — analyzes delivery counts, total quantities, and average prices.
5. **Harvest and Delivery Validation** — identifies cases where recorded deliveries exceed harvested quantities.

See [`reports.md`](reports.md) for the report descriptions and [`queries.sql`](queries.sql) for SQL reporting queries.

## 🔎 Data Quality and Validation

The [`data_quality_checks.sql`](data_quality_checks.sql) file contains checks for:

- Missing farmer names.
- Invalid agricultural plot areas.
- Invalid harvest and delivery quantities.
- Missing harvest or delivery dates.
- Records with missing referenced farmers, plots, harvests, or factories.
- Duplicate farmer names within the same village.
- Total recorded deliveries exceeding harvested quantities.

These queries help identify potential data quality issues without modifying existing records.

## 📁 Project Structure

```text
Sugarcane-Industry-Database-Management-System/
├── README.md
├── sugarcane_industry.sql
├── queries.sql
├── data_quality_checks.sql
├── database_schema.md
├── reports.md
└── LICENSE
```

## 🚀 How to Run the Project

1. Open MySQL 8.0 or a compatible MySQL SQL editor.
2. Select or create a database for this project.
3. Open `sugarcane_industry.sql`.
4. Execute the schema creation and sample-data statements in order.
5. Run `queries.sql` to generate business reports.
6. Run `data_quality_checks.sql` to perform validation checks.
7. Review `database_schema.md` and `reports.md` for documentation.

**Note:** Execute the SQL files in the same database. If your SQL script already selects or creates a database, follow its existing setup instructions.

## 📌 Sample Dataset

The project's sample dataset is designed to demonstrate the database relationships and reporting queries.

The README's previously documented sample summary includes:

| Metric | Sample Result |
|---|---:|
| Farmers | 2 |
| Agricultural Plots | 2 |
| Harvest Records | 2 |
| Sugar Factories | 2 |
| Delivery Records | 2 |
| Total Delivered Sugarcane | 27.50 tons |
| Total Estimated Delivery Revenue | 85,500.00 |

*These figures are documented sample results. Run the SQL scripts to verify them against the current repository data.*

## 🔮 Future Enhancements

- Add farmer billing and payment status tracking.
- Develop monthly and yearly production reports.
- Build a Power BI dashboard for production and delivery analytics.
- Expand the dataset with additional farmers, factories, and transactions.
- Add automated database testing and reporting.

## 👨‍💻 Author

**Amol Tathe**

- GitHub: [amoltathesoftwareengineer](https://github.com/amoltathesoftwareengineer)

---

This project was developed for learning and demonstrating SQL database design, data management, data validation, and business reporting.
