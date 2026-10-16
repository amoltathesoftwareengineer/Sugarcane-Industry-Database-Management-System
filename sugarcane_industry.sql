
-- Sugarcane Industry Database Management System
-- Database: MySQL 8.0

-- 1. Create Farmers Table
CREATE TABLE farmers (
    farmer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    village VARCHAR(100),
    contact_number VARCHAR(15)
);

-- 2. Create Plots Table
CREATE TABLE plots (
    plot_id INT PRIMARY KEY AUTO_INCREMENT,
    farmer_id INT NOT NULL,
    area DECIMAL(10,2) CHECK (area > 0),
    soil_type VARCHAR(50),
    FOREIGN KEY (farmer_id) REFERENCES farmers(farmer_id)
);

-- 3. Create Harvest Table
CREATE TABLE harvest (
    harvest_id INT PRIMARY KEY AUTO_INCREMENT,
    plot_id INT NOT NULL,
    harvest_date DATE NOT NULL,
    quantity_in_tons DECIMAL(10,2) NOT NULL
        CHECK (quantity_in_tons > 0),
    FOREIGN KEY (plot_id) REFERENCES plots(plot_id)
);

-- 4. Create Factories Table
CREATE TABLE factories (
    factory_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- 5. Create Deliveries Table
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    harvest_id INT NOT NULL,
    factory_id INT NOT NULL,
    delivery_date DATE NOT NULL,
    delivered_quantity_in_tons DECIMAL(10,2) NOT NULL
        CHECK (delivered_quantity_in_tons > 0),
    price_per_ton DECIMAL(10,2) NOT NULL
        CHECK (price_per_ton > 0),
    FOREIGN KEY (harvest_id) REFERENCES harvest(harvest_id),
    FOREIGN KEY (factory_id) REFERENCES factories(factory_id)
);

-- 6. Insert Sample Farmers
INSERT INTO farmers (name, village, contact_number)
VALUES
('Ramesh Patil', 'Kolhapur', '9191919191'),
('Suresh Jadhav', 'Sangli', '9292929292');

-- 7. Insert Sample Plots
INSERT INTO plots (farmer_id, area, soil_type)
VALUES
(1, 2.5, 'Black'),
(2, 3.2, 'Red');

-- 8. Insert Harvest Records
INSERT INTO harvest (plot_id, harvest_date, quantity_in_tons)
VALUES
(1, '2025-01-10', 12.5),
(2, '2025-02-12', 15.0);

-- 9. Insert Factories
INSERT INTO factories (name, location)
VALUES
('Krishna Sugar Mill', 'Satara'),
('Sahyadri Sugar', 'Pune');

-- 10. Insert Delivery Records
INSERT INTO deliveries (
    harvest_id,
    factory_id,
    delivery_date,
    delivered_quantity_in_tons,
    price_per_ton
)
VALUES
(1, 1, '2025-01-15', 12.5, 3000),
(2, 2, '2025-02-18', 15.0, 3200);

-- REPORT 1: Total Sugarcane Harvested by Farmer
SELECT
    f.name AS farmer_name,
    SUM(h.quantity_in_tons) AS total_harvested_tons
FROM farmers f
JOIN plots p ON f.farmer_id = p.farmer_id
JOIN harvest h ON p.plot_id = h.plot_id
GROUP BY f.farmer_id, f.name;

-- REPORT 2: Farmer-wise Delivery Revenue
SELECT
    f.name AS farmer_name,
    d.delivered_quantity_in_tons,
    d.price_per_ton,
    d.delivered_quantity_in_tons * d.price_per_ton AS revenue
FROM deliveries d
JOIN harvest h ON d.harvest_id = h.harvest_id
JOIN plots p ON h.plot_id = p.plot_id
JOIN farmers f ON p.farmer_id = f.farmer_id;

-- REPORT 3: Factory-wise Delivered Quantity
SELECT
    fac.name AS factory_name,
    SUM(d.delivered_quantity_in_tons) AS total_received_tons
FROM deliveries d
JOIN factories fac ON d.factory_id = fac.factory_id
GROUP BY fac.factory_id, fac.name;

-- REPORT 4: Delivery Details with Farmer and Factory
SELECT
    d.delivery_id,
    f.name AS farmer_name,
    fac.name AS factory_name,
    d.delivery_date,
    d.delivered_quantity_in_tons,
    d.price_per_ton,
    d.delivered_quantity_in_tons * d.price_per_ton AS total_revenue
FROM deliveries d
JOIN harvest h ON d.harvest_id = h.harvest_id
JOIN plots p ON h.plot_id = p.plot_id
JOIN farmers f ON p.farmer_id = f.farmer_id
JOIN factories fac ON d.factory_id = fac.factory_id;

-- REPORT 5: Overall Business Summary
SELECT
    COUNT(*) AS total_deliveries,
    SUM(delivered_quantity_in_tons) AS total_delivered_tons,
    SUM(delivered_quantity_in_tons * price_per_ton) AS total_revenue
FROM deliveries;

-- REPORT 6: Data Validation Check
SELECT *
FROM deliveries
WHERE delivered_quantity_in_tons <= 0
   OR price_per_ton <= 0
   OR delivered_quantity_in_tons IS NULL
   OR price_per_ton IS NULL;
