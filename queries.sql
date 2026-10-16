-- Query 1: Farmer-wise total harvest
SELECT
    f.name AS farmer_name,
    f.village,
    SUM(h.quantity_in_tons) AS total_harvest_tons
FROM farmers f
JOIN plots p ON f.farmer_id = p.farmer_id
JOIN harvest h ON p.plot_id = h.plot_id
GROUP BY f.farmer_id, f.name, f.village
ORDER BY total_harvest_tons DESC;


-- Query 2: Factory-wise delivery and payment
SELECT
    f.name AS factory_name,
    SUM(d.delivered_quantity_in_tons) AS total_delivered_tons,
    SUM(d.delivered_quantity_in_tons * d.price_per_ton) AS total_payment
FROM factories f
JOIN deliveries d ON f.factory_id = d.factory_id
GROUP BY f.factory_id, f.name
ORDER BY total_payment DESC;


-- Query 3: Farmer-wise total income
SELECT
    f.name AS farmer_name,
    f.village,
    SUM(d.delivered_quantity_in_tons) AS delivered_tons,
    SUM(d.delivered_quantity_in_tons * d.price_per_ton) AS total_income
FROM farmers f
JOIN plots p ON f.farmer_id = p.farmer_id
JOIN harvest h ON p.plot_id = h.plot_id
JOIN deliveries d ON h.harvest_id = d.harvest_id
GROUP BY f.farmer_id, f.name, f.village
ORDER BY total_income DESC;