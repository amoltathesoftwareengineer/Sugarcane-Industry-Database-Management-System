
-- =====================================================
-- Sugarcane Industry Database Management System
-- Data Quality and Validation Checks
-- MySQL 8.0
-- =====================================================

-- 1. Check farmers with missing names
SELECT farmer_id, name
FROM farmers
WHERE name IS NULL OR TRIM(name) = '';

-- 2. Check invalid plot areas
SELECT plot_id, farmer_id, area
FROM plots
WHERE area IS NULL OR area <= 0;

-- 3. Check invalid harvest records
SELECT harvest_id, plot_id, harvest_date, quantity_in_tons
FROM harvest
WHERE harvest_date IS NULL
   OR quantity_in_tons IS NULL
   OR quantity_in_tons <= 0;

-- 4. Check invalid delivery records
SELECT delivery_id, harvest_id, factory_id,
       delivery_date, delivered_quantity_in_tons, price_per_ton
FROM deliveries
WHERE delivery_date IS NULL
   OR delivered_quantity_in_tons IS NULL
   OR delivered_quantity_in_tons <= 0
   OR price_per_ton IS NULL
   OR price_per_ton <= 0;

-- 5. Check plots without a valid farmer
SELECT p.plot_id, p.farmer_id
FROM plots p
LEFT JOIN farmers f ON p.farmer_id = f.farmer_id
WHERE f.farmer_id IS NULL;

-- 6. Check harvest records without a valid plot
SELECT h.harvest_id, h.plot_id
FROM harvest h
LEFT JOIN plots p ON h.plot_id = p.plot_id
WHERE p.plot_id IS NULL;

-- 7. Check deliveries without a valid harvest or factory
SELECT d.delivery_id, d.harvest_id, d.factory_id
FROM deliveries d
LEFT JOIN harvest h ON d.harvest_id = h.harvest_id
LEFT JOIN factories f ON d.factory_id = f.factory_id
WHERE h.harvest_id IS NULL
   OR f.factory_id IS NULL;

-- 8. Find harvest records where total deliveries
-- exceed the harvested quantity
SELECT
    h.harvest_id,
    h.quantity_in_tons AS harvested_quantity,
    COALESCE(SUM(d.delivered_quantity_in_tons), 0)
        AS total_delivered_quantity
FROM harvest h
LEFT JOIN deliveries d ON h.harvest_id = d.harvest_id
GROUP BY h.harvest_id, h.quantity_in_tons
HAVING COALESCE(SUM(d.delivered_quantity_in_tons), 0)
       > h.quantity_in_tons;

-- 9. Check duplicate farmer names within the same village
SELECT
    name,
    village,
    COUNT(*) AS duplicate_count
FROM farmers
GROUP BY name, village
HAVING COUNT(*) > 1;
