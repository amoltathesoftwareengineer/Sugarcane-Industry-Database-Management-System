
# Business Reports and SQL Analytics

## Project Overview

This document describes the business reports supported by the
Sugarcane Industry Database Management System using MySQL 8.0.

## 1. Farmer-wise Harvest Report

**Purpose:** Understand how much sugarcane each farmer produces.

**Tables:** `farmers`, `plots`, `harvest`

**Business value:**
- Compare production across farmers.
- Identify high-production farmers.
- Support agricultural planning.

## 2. Factory-wise Delivery Report

**Purpose:** Measure the quantity of sugarcane delivered to each factory.

**Tables:** `factories`, `deliveries`

**Business value:**
- Compare factory-wise supply.
- Monitor delivery volumes.
- Support supply-chain planning.

## 3. Farmer-wise Revenue Report

**Purpose:** Calculate estimated revenue from recorded deliveries.

**Calculation:**

`Revenue = delivered_quantity_in_tons × price_per_ton`

**Tables:** `farmers`, `plots`, `harvest`, `deliveries`

**Business value:**
- Estimate farmer-wise delivery revenue.
- Compare earnings across farmers.
- Support payment analysis.

**Note:** Revenue is an estimate based on recorded delivery quantities
and prices; it does not confirm that payment was received.

## 4. Harvest and Delivery Validation

**Purpose:** Identify harvest records where the total recorded
deliveries exceed the harvested quantity.

**Tables:** `harvest`, `deliveries`

**Business value:**
- Detect potentially inconsistent records.
- Improve data quality.
- Support inventory reconciliation.

## 5. Data Quality Checks

The `data_quality_checks.sql` file includes checks for:

- Missing farmer names.
- Invalid plot areas and quantities.
- Missing harvest or delivery dates.
- Invalid foreign-key references.
- Duplicate farmer names within a village.
- Deliveries exceeding recorded harvest quantities.

## Technologies

- MySQL 8.0
- SQL joins
- Aggregate functions
- GROUP BY and HAVING
- Primary and foreign keys
- Data validation
- Relational database design
