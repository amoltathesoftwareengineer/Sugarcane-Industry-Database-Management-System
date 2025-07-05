CREATE DATABASE IF NOT EXISTS sugarcane_industry_db;
USE sugarcane_industry_db;

-- Farmers Table
CREATE TABLE farmers (
    farmer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    village VARCHAR(100),
    contact_number VARCHAR(15)
);

-- Plots Table
CREATE TABLE plots (
    plot_id INT PRIMARY KEY AUTO_INCREMENT,
    farmer_id INT,
    area DECIMAL(10,2),
    soil_type VARCHAR(50),
    FOREIGN KEY (farmer_id) REFERENCES farmers(farmer_id)
);

-- Harvest Table
CREATE TABLE harvest (
    harvest_id INT PRIMARY KEY AUTO_INCREMENT,
    plot_id INT,
    harvest_date DATE,
    quantity_in_tons DECIMAL(10,2),
    FOREIGN KEY (plot_id) REFERENCES plots(plot_id)
);

-- Factory Table
CREATE TABLE factories (
    factory_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(100)
);

-- Delivery Table
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    harvest_id INT,
    factory_id INT,
    delivery_date DATE,
    price_per_ton DECIMAL(10,2),
    FOREIGN KEY (harvest_id) REFERENCES harvest(harvest_id),
    FOREIGN KEY (factory_id) REFERENCES factories(factory_id)
);
-- Farmers
INSERT INTO farmers (name, village, contact_number)
VALUES ('Ramesh Patil', 'Kolhapur', '9191919191'),
       ('Suresh Jadhav', 'Sangli', '9191919191');

-- Plots
INSERT INTO plots (farmer_id, area, soil_type)
VALUES (1, 2.5, 'Black'), (2, 3.2, 'Red');

-- Harvest
INSERT INTO harvest (plot_id, harvest_date, quantity_in_tons)
VALUES (1, '2025-01-10', 12.5), (2, '2025-02-12', 15.0);

-- Factories
INSERT INTO factories (name, location)
VALUES ('Krishna Sugar Mill', 'Satara'), ('Sahyadri Sugar', 'Pune');

-- Deliveries
INSERT INTO deliveries (harvest_id, factory_id, delivery_date, price_per_ton)
VALUES (1, 1, '2025-01-15', 3000), (2, 2, '2025-02-18', 3200);

-- Total production per farmer
SELECT f.name, SUM(h.quantity_in_tons) AS total_quantity
FROM farmers f
JOIN plots p ON f.farmer_id = p.farmer_id
JOIN harvest h ON p.plot_id = h.plot_id
GROUP BY f.name;

-- Total revenue by delivery
SELECT d.delivery_id, f.name AS farmer_name, d.quantity_in_tons * d.price_per_ton AS revenue
FROM deliveries d
JOIN harvest h ON d.harvest_id = h.harvest_id
JOIN plots p ON h.plot_id = p.plot_id
JOIN farmers f ON p.farmer_id = f.farmer_id;

-- List of factories and how much they received
SELECT fac.name, SUM(h.quantity_in_tons) AS total_received
FROM deliveries d
JOIN factories fac ON d.factory_id = fac.factory_id
JOIN harvest h ON d.harvest_id = h.harvest_id
GROUP BY fac.name;
