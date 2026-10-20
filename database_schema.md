
# Database Schema

## Project
Sugarcane Industry Database Management System

**Database:** MySQL 8.0

## Tables and Relationships

### 1. farmers
Stores farmer information.

- `farmer_id` — Primary Key
- `name` — Farmer name
- `village` — Village name
- `contact_number` — Contact information

### 2. plots
Stores agricultural plot information.

- `plot_id` — Primary Key
- `farmer_id` — Foreign Key referencing `farmers.farmer_id`
- `area` — Plot area
- `soil_type` — Soil classification

**Relationship:** One farmer can have multiple plots.

### 3. harvest
Stores sugarcane harvest records.

- `harvest_id` — Primary Key
- `plot_id` — Foreign Key referencing `plots.plot_id`
- `harvest_date` — Harvest date
- `quantity_in_tons` — Harvested quantity in tons

**Relationship:** One plot can have multiple harvest records.

### 4. factories
Stores sugar factory information.

- `factory_id` — Primary Key
- `name` — Factory name
- `location` — Factory location

### 5. deliveries
Stores sugarcane delivery details.

- `delivery_id` — Primary Key
- `harvest_id` — Foreign Key referencing `harvest.harvest_id`
- `factory_id` — Foreign Key referencing `factories.factory_id`
- `delivery_date` — Delivery date
- `delivered_quantity_in_tons` — Delivered quantity in tons
- `price_per_ton` — Price per ton

**Relationships:**
- One harvest record can have multiple delivery records.
- One factory can receive multiple deliveries.

## Database Design Highlights

- Primary keys uniquely identify records.
- Foreign keys establish relationships between tables.
- Decimal columns support quantity and price values.
- Positive-value constraints help prevent invalid area,
  harvest quantity, delivery quantity, and price values.
- SQL queries support reporting and data validation.
